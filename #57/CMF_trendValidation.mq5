//+------------------------------------------------------------------+
//|                                          CMF_trendValidation.mq5 |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
input int                 periods=20; // Periods
input ENUM_APPLIED_VOLUME volumeTypeInp=VOLUME_TICK;  // Volume Type
input int maPeriodInp=20; //MA Period
input double      lotSize=1;
input double      slLvl=300;
input double      tpLvl=900;
int cmf;
int ma;
CTrade trade;
int barsTotal;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   cmf = iCustom(_Symbol,PERIOD_CURRENT,"Chaikin_Money_Flow",periods,volumeTypeInp);
   ma = iMA(_Symbol,PERIOD_CURRENT,maPeriodInp,0,MODE_SMA,PRICE_CLOSE);
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("EA is removed");
  }
void OnTick()
  {
   int bars=iBars(_Symbol,PERIOD_CURRENT);
   if(barsTotal != bars)
     {
      barsTotal=bars;
      double cmfInd[];
      double maInd[];
      CopyBuffer(cmf,0,0,3,cmfInd);
      CopyBuffer(ma,0,0,3,maInd);
      ArraySetAsSeries(cmfInd,true);
      ArraySetAsSeries(maInd,true);
      double cmfVal = NormalizeDouble(cmfInd[0], 5);
      double maVal= NormalizeDouble(maInd[0],5);
      double cmfPreVal = NormalizeDouble(cmfInd[1], 5);
      double maPreVal = NormalizeDouble(maInd[1],5);;
      double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
      double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
      double prevClose = iClose(_Symbol,PERIOD_CURRENT,1);
      if(prevClose<maPreVal && ask>maVal)
        {
         if(cmfVal>0)
           {
            double slVal=ask - slLvl*_Point;
            double tpVal=ask + tpLvl*_Point;
            trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
           }
        }
      if(prevClose>maPreVal && bid<maVal)
        {
         if(cmfVal<0)
           {
            double slVal=bid + slLvl*_Point;
            double tpVal=bid - tpLvl*_Point;
            trade.Sell(lotSize,_Symbol,bid,slVal,tpVal);
           }
        }
     }
  }
//+------------------------------------------------------------------+
