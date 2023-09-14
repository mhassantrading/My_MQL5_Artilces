//+------------------------------------------------------------------+
//|                                        CTrade_Trading_System.mq5 |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
int simpleMA;
int barsTotal;
CTrade trade;
int OnInit()
  {
   simpleMA = iMA(_Symbol, PERIOD_H1, 50, 0, MODE_SMA, PRICE_CLOSE);
   barsTotal=iBars(_Symbol,PERIOD_H1);
   return(INIT_SUCCEEDED);
  }
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
   double prevClose=(priceArray[2].close);
   double SMAVal = NormalizeDouble(mySMAArray[1],_Digits);
   double prevSMAVal = NormalizeDouble(mySMAArray[2],_Digits);
   int bars=iBars(_Symbol,PERIOD_H1);
   if(barsTotal != bars)
     {
      barsTotal=bars;
      if(prevClose<prevSMAVal && lastClose>SMAVal)
        {
         trade.Buy(0.1,_Symbol,Ask,Ask-(500*_Point),Ask+(1000*_Point),NULL);
        }
      if(prevClose>prevSMAVal && lastClose<SMAVal)
        {
         trade.Sell(0.1,_Symbol,Bid,Bid+(500*_Point),Bid-(1000*_Point),NULL);
        }
     }
  }