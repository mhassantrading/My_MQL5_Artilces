//+------------------------------------------------------------------+
//|                                       Simple Momentum System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //Creating array for prices
   double PriceArray [];
   
   //Identifying Momentum properties
   int MomentumDef = iMomentum(_Symbol,_Period,14,PRICE_CLOSE);
   
   //Sorting price array
   ArraySetAsSeries(PriceArray,true);
   
   //Copying results
   CopyBuffer(MomentumDef,0,0,3,PriceArray);
   
   //Getting Momentum value of current price
   double MomentumValue = NormalizeDouble(PriceArray[0],2);
   
   //Commenting Momentum output on the chart
   if(MomentumValue>100) Comment("MOMENTUM VALUE IS: ",MomentumValue);
   
  }
//+------------------------------------------------------------------+
