//+------------------------------------------------------------------+
//|                                                AroonLevelsEA.mq5 |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
input int         periodInp = 25; // Period
input int         shiftInp  = 0; // Shift
input double      lotSize=1;
input double      slLvl=200;
input double      tpLvl=600;
int aroon;
int barsTotal;
CTrade trade;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   aroon = iCustom(_Symbol,PERIOD_CURRENT,"Aroon",periodInp,shiftInp);
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
      double upBuffer[], downBuffer[];
      CopyBuffer(aroon,0,0,3,upBuffer);
      CopyBuffer(aroon,1,0,3,downBuffer);
      ArraySetAsSeries(upBuffer,true);
      ArraySetAsSeries(downBuffer,true);
      double prevDownValue = downBuffer[1];
      double downValue = downBuffer[0];
      if(prevDownValue> 10 && downValue<10)
        {
         double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
         double slVal=ask - slLvl*_Point;
         double tpVal=ask + tpLvl*_Point;
         trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
        }
      if(prevDownValue < 50 && downValue>50)
        {
         double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
         double slVal=bid + slLvl*_Point;
         double tpVal=bid - tpLvl*_Point;
         trade.Sell(lotSize,_Symbol,bid,slVal,tpVal);
        }
     }
  }
