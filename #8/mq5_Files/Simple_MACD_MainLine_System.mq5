//+------------------------------------------------------------------+
//|                                  Simple MACD MainLine System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //cretaing an array for prices
   double MACDMainLine[];
   
   //Defining MACD and its parameters
   int MACDDef = iMACD(_Symbol,_Period,12,26,9,PRICE_CLOSE);
   
   //Sorting price array from current data
   ArraySetAsSeries(MACDMainLine,true);
   
   //Storing results after defining MA, line, current data
   CopyBuffer(MACDDef,0,0,3,MACDMainLine);
   
   //Get values of current data
   float MACDMainLineVal = (MACDMainLine[0]);
   
   //Commenting on the chart the value of MACD
   Comment("MACD Value is ",MACDMainLineVal);
  }
//+------------------------------------------------------------------+
