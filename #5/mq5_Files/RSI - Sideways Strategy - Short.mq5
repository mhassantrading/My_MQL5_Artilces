//+------------------------------------------------------------------+
//|                             RSI - Sideways Streategy - Short.mq5 |
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
   //Creating array for prices
   double RSIArray[];
   
   //Identying RSI properties
   int RSIDef = iRSI(_Symbol, _Period, 14, PRICE_CLOSE);

   //Sorting prices array
   ArraySetAsSeries(RSIArray,true);
   
   //Identifying EA
   CopyBuffer(RSIDef,0,0,1,RSIArray);
   
   //Calculating EA
   double RSIValue = NormalizeDouble(RSIArray[0],2);
   
   //Creating signal according to RSI
   if(RSIValue>70)
   Comment ("Sideways - SHORT");
   
   if(RSIValue<50)
   Comment ("Sideways - TAKE PROFIT");
  }
//+------------------------------------------------------------------+
