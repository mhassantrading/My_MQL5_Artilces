//+------------------------------------------------------------------+
//|                                          DPO_trendValidation.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
input int         period=20; // Periods
input int         maPeriodInp=20; //MA Period
input double      lotSize=1;
input double      slLvl=300;
input double      tpLvl=900;
int dpo;
int ma;
CTrade trade;
int barsTotal;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   dpo = iCustom(_Symbol,PERIOD_CURRENT,"customDPO",period);
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
      double dpoInd[];
      double maInd[];
      CopyBuffer(dpo,0,0,3,dpoInd);
      CopyBuffer(ma,0,0,3,maInd);
      ArraySetAsSeries(dpoInd,true);
      ArraySetAsSeries(maInd,true);
      double dpoVal = NormalizeDouble(dpoInd[0], 6);
      double maVal= NormalizeDouble(maInd[0],5);
      double dpoPreVal = NormalizeDouble(dpoInd[1], 5);
      double maPreVal = NormalizeDouble(maInd[1],5);;
      double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
      double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
      double prevClose = iClose(_Symbol,PERIOD_CURRENT,1);
      if(prevClose<maPreVal && ask>maVal)
        {
         if(dpoVal>0)
           {
            double slVal=ask - slLvl*_Point;
            double tpVal=ask + tpLvl*_Point;
            trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
           }
        }
      if(prevClose>maPreVal && bid<maVal)
        {
         if(dpoVal<0)
           {
            double slVal=bid + slLvl*_Point;
            double tpVal=bid - tpLvl*_Point;
            trade.Sell(lotSize,_Symbol,bid,slVal,tpVal);
           }
        }
     }
  }
//+------------------------------------------------------------------+
