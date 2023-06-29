//+------------------------------------------------------------------+
//|                                      Simple Alligator System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//--------------------------------------------------------------------
void OnTick()
  {
//creating three arrays of Alligator components
   double jawsArray[];
   double teethArray[];
   double lipsArray[];
//Sorting data
   ArraySetAsSeries(jawsArray,true);
   ArraySetAsSeries(teethArray,true);
   ArraySetAsSeries(lipsArray,true);
//define Alligator
   int alligatorDef=iAlligator(_Symbol,_Period,13,8,8,5,5,3,MODE_SMMA,PRICE_MEDIAN);
//define data and store result
   CopyBuffer(alligatorDef,0,0,3,jawsArray);
   CopyBuffer(alligatorDef,1,0,3,teethArray);
   CopyBuffer(alligatorDef,2,0,3,lipsArray);
//get value of current data
   double jawsValue=NormalizeDouble(jawsArray[0],5);
   double teethValue=NormalizeDouble(teethArray[0],5);
   double lipsValue=NormalizeDouble(lipsArray[0],5);
//comment on the chart
   Comment("jawsValue = ",jawsValue,"\n",
           "teethValue = ",teethValue,"\n",
           "lipsValue = ",lipsValue);
  }
//+------------------------------------------------------------------+
