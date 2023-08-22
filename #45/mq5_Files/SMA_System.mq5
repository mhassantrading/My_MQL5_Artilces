//+------------------------------------------------------------------+
//|                                                   SMA_System.mq5 |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
input double lotSize = 1;
input ENUM_TIMEFRAMES timeFrame = PERIOD_H1;
input int MAPeriod= 50;
int simpleMA;
int barsTotal;
CTrade trade;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   simpleMA = iMA(_Symbol, timeFrame, MAPeriod, 0, MODE_SMA, PRICE_CLOSE);
   barsTotal=iBars(_Symbol,timeFrame);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   MqlRates priceArray[];
   double mySMAArray[];
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   ArraySetAsSeries(priceArray,true);
   ArraySetAsSeries(mySMAArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);
   CopyBuffer(simpleMA,0,0,3,mySMAArray);
   double lastClose=(priceArray[1].close);
   double SMAVal = NormalizeDouble(mySMAArray[1],_Digits);
   double prevClose=(priceArray[2].close);
   double prevSMAVal = NormalizeDouble(mySMAArray[2],_Digits);
   int bars=iBars(_Symbol,timeFrame);
   if(barsTotal != bars)
     {
      barsTotal=bars;
      if(prevClose<prevSMAVal && lastClose>SMAVal)
        {
         trade.PositionClose(_Symbol);
         trade.Buy(lotSize,_Symbol,Ask,0,0,NULL);
        }
      if(prevClose>prevSMAVal && lastClose<SMAVal)
        {
         trade.PositionClose(_Symbol);
         trade.Sell(lotSize,_Symbol,Bid,0,0,NULL);
        }
     }
  }
//+------------------------------------------------------------------+