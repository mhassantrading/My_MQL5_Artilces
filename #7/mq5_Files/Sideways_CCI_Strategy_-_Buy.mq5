//+------------------------------------------------------------------+
//|                                  Sideways CCI Strategy - Buy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //Creating an array of prices
   double ArrayOfPrices[];
   
   //Sorting price array from current data
   ArraySetAsSeries(ArrayOfPrices,true);
   
   //CCI properties Definition
   int CCIDef = iCCI(_Symbol,_Period,14,PRICE_CLOSE);
   
   //Storing results
   CopyBuffer(CCIDef,0,0,3,ArrayOfPrices);
   
   //Getting value of current data
   double CCIValue = (ArrayOfPrices[0]);
   
   //CCI signals
   if(CCIValue< -100)
   Comment ("SIDEWAYS CCI - BUY SIGNAL ");
   
   if(CCIValue> 100)
   Comment ("SIDEWAYS CCI - TAKE PROFIT");
  }
//+------------------------------------------------------------------+
