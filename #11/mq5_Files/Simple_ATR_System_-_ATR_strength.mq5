//+------------------------------------------------------------------+
//|                             Simple ATR System - ATR strength.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //creating price array
   double PriceArray[];
   
   
   //Sorting data
   ArraySetAsSeries(PriceArray,true);
   
   //define ATR
   int ATRDef=iATR(_Symbol,_Period,14);   
   
   //define data and store result
   CopyBuffer(ATRDef,0,0,3,PriceArray);
   
   //get value of current data
   double ATRValue=NormalizeDouble(PriceArray[0],5);
   
   //comment on the chart with ATR strength as per its value
   if(ATRValue>0.0024)
   Comment("Strong ATR","\n","ATR Value = ",ATRValue);
   
   if(ATRValue<0.0014)
   Comment("Weak ATR","\n","ATR Value = ",ATRValue);
   
   if((ATRValue>0.0014)&&(ATRValue<0.0024))
   Comment("ATR Value = ",ATRValue);
   
  }
//+------------------------------------------------------------------+
