//+------------------------------------------------------------------+
//|                                                 chvCrossover.mq5 |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
enum smoothMode
  {
   SMA=0,// Simple MA
   EMA=1 // Exponential MA
  };
input int          smoothPeriodInp=10;  // Smoothing period
input int          chvPeriodInp=10;     // Chaikin Volatility period
input smoothMode smoothTypeInp=EMA;   // Smoothing Mode
input double      lotSize=1;
input double slPips = 300;
input double tpPips = 600;
int chv;
int barsTotal;
CTrade trade;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   chv = iCustom(_Symbol,PERIOD_CURRENT,"Custom_CHV",smoothPeriodInp,chvPeriodInp, smoothTypeInp, lotSize, slPips, tpPips);
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("EA is removed");
  }
void OnTick()
  {
   int bars=iBars(_Symbol,PERIOD_CURRENT);
   if(barsTotal < bars)
     {
      barsTotal=bars;
      double chvInd[];
      CopyBuffer(chv,0,0,3,chvInd);
      ArraySetAsSeries(chvInd,true);
      double chvVal = NormalizeDouble(chvInd[0], 1);
      double chvValPrev = NormalizeDouble(chvInd[1], 1);
      if(chvVal>0)
        {
         double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
         double slVal = ask - slPips*_Point;
         double tpVal = ask + tpPips*_Point;
         trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
        }
      if(chvVal<0)
        {
         double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
         double slVal = bid + slPips*_Point;
         double tpVal = bid - tpPips*_Point;
         trade.Sell(lotSize,_Symbol,bid,slVal,tpVal);
        }
     }
  }
//+------------------------------------------------------------------+
