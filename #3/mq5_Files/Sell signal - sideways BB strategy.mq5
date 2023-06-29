//+------------------------------------------------------------------+
//|                                    Sell sideways BB strategy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   //define Ask, Bid
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   
   //create an array for several prices
   double MiddleBandArray[];
   double UpperBandArray[];
   double LowerBandArray[];
   
   //sort the price array from the cuurent candle downwards
   ArraySetAsSeries(MiddleBandArray,true);
   ArraySetAsSeries(UpperBandArray,true);
   ArraySetAsSeries(LowerBandArray,true);
   
   //define Bollinger Bands
   int BollingerBands = iBands(_Symbol,_Period,20,0,2,PRICE_CLOSE);
   
   
   //copy price info into the array
   CopyBuffer(BollingerBands,0,0,3,MiddleBandArray);
   CopyBuffer(BollingerBands,1,0,3,UpperBandArray);
   CopyBuffer(BollingerBands,2,0,3,LowerBandArray);
   
   //calcualte EA for the cuurent candle
   double MiddleBandValue=MiddleBandArray[0];
   double UpperBandValue=UpperBandArray[0];
   double LowerBandValue=LowerBandArray[0];
   
   //giving sell signal when price < MA
   if (
      (Bid>=UpperBandArray[0])
      )
         {
         Comment("SELL");
         }
    
   //check if we have a take profit signal      
   if (
      (Ask<=LowerBandArray[0])
      )
         {
         Comment("TAKE PROFIT");
         }  
  }
//+------------------------------------------------------------------+
