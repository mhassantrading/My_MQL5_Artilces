//+------------------------------------------------------------------+
//|                                            One SMA crossover.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   //create an array for several prices
   double myMovingAverageArray1[];
   
   //define Ask, Bid
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   
   //define the properties of  MAs - simple MA, 1st 24
   int movingAverage1 = iMA(_Symbol, _Period, 24, 0, MODE_SMA, PRICE_CLOSE);
   
   //sort the price arrays 1, 2 from current candle
   ArraySetAsSeries(myMovingAverageArray1,true);
   
   //Defined MA1, MA2 - one line - currentcandle, 3 candles - store result
   CopyBuffer(movingAverage1,0,0,3,myMovingAverageArray1);
   
   //Check if we have a buy entry signal
   if (
      (Ask>myMovingAverageArray1[0])
      )
         {
         Comment("BUY");
         }
    
   //check if we have a sell entry signal      
   if (
      (Bid<myMovingAverageArray1[0])
      )
         {
         Comment("SELL");
         }          
  }
//+------------------------------------------------------------------+
