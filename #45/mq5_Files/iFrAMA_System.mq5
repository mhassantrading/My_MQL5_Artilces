//+------------------------------------------------------------------+
//|                                                iFrAMA_System.mq5 |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
input double lotSize = 1;
input ENUM_TIMEFRAMES timeFrame = PERIOD_H1;
input int MAPeriod= 50;
int FrAMA;
int barsTotal;
CTrade trade;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   FrAMA = iFrAMA(_Symbol, timeFrame, MAPeriod,0, PRICE_CLOSE);
   barsTotal=iBars(_Symbol,timeFrame);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   MqlRates priceArray[];
   double myFrAMAArray[];
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   ArraySetAsSeries(priceArray,true);
   ArraySetAsSeries(myFrAMAArray,true);
   int Data=CopyRates(_Symbol,timeFrame,0,3,priceArray);
   CopyBuffer(FrAMA,0,0,3,myFrAMAArray);
   double lastClose=(priceArray[1].close);
   double FrAMAVal = NormalizeDouble(myFrAMAArray[1],_Digits);
   double prevClose=(priceArray[2].close);
   double prevFrAMAVal = NormalizeDouble(myFrAMAArray[2],_Digits);
   int bars=iBars(_Symbol,timeFrame);
   if(barsTotal != bars)
     {
      barsTotal=bars;
      if(lastClose>FrAMAVal && prevClose<prevFrAMAVal)
        {
         trade.PositionClose(_Symbol);
         trade.Buy(lotSize,_Symbol,Ask,0,0,NULL);
        }
      if(lastClose<FrAMAVal && prevClose>prevFrAMAVal)
        {
         trade.PositionClose(_Symbol);
         trade.Sell(lotSize,_Symbol,Bid,0,0,NULL);
        }
     }
  }
//+------------------------------------------------------------------+