//+------------------------------------------------------------------+
//|                                                 CMF_OB&OS.mq5 |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
input int                 periods=20; // Periods
input ENUM_APPLIED_VOLUME volumeTypeInp=VOLUME_TICK;  // Volume Type
input double cmfPosLvls = 0.20; // CMF OB Level
input double cmfNegLvls = -0.20; // CMF OS Level
input double      lotSize=1;
input double      slLvl=300;
input double      tpLvl=900;
int cmf;
CTrade trade;
int barsTotal;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   cmf = iCustom(_Symbol,PERIOD_CURRENT,"Chaikin_Money_Flow",periods,volumeTypeInp);
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
      CopyBuffer(cmf,0,0,3,cmfInd);
      ArraySetAsSeries(cmfInd,true);
      double cmfVal = NormalizeDouble(cmfInd[0], 5);
      double cmfPreVal = NormalizeDouble(cmfInd[1], 5);
      double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
      double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
      if(cmfVal<=cmfNegLvls)
        {
         double slVal=ask - slLvl*_Point;
         double tpVal=ask + tpLvl*_Point;
         trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
        }
      if(cmfVal>=cmfPosLvls)
        {
         double slVal=bid + slLvl*_Point;
         double tpVal=bid - tpLvl*_Point;
         trade.Sell(lotSize,_Symbol,bid,slVal,tpVal);
        }
     }
  }
//+------------------------------------------------------------------+
