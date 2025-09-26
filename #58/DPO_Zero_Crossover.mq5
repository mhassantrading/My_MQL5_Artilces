//+------------------------------------------------------------------+
//|                                           DPO_Zero_Crossover.mq5 |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
input int                 period=20; // Periods
input double      lotSize=1;
input double      slLvl=300;
input double      tpLvl=900;
int dpo;
CTrade trade;
int barsTotal;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   dpo = iCustom(_Symbol,PERIOD_CURRENT,"customDPO",period);
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
      CopyBuffer(dpo,0,0,3,dpoInd);
      ArraySetAsSeries(dpoInd,true);
      double dpoVal = NormalizeDouble(dpoInd[1], 6);
      double dpoPreVal = NormalizeDouble(dpoInd[2], 6);
      double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
      double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
      if(dpoPreVal<0 && dpoVal>0)
        {
         double slVal=ask - slLvl*_Point;
         double tpVal=ask + tpLvl*_Point;
         trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
        }
      if(dpoPreVal>0 && dpoVal<0)
        {
         double slVal=bid + slLvl*_Point;
         double tpVal=bid - tpLvl*_Point;
         trade.Sell(lotSize,_Symbol,bid,slVal,tpVal);
        }
     }
  }
//+------------------------------------------------------------------+
