//+------------------------------------------------------------------+
//|                                    Alligator Signals System .mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
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
   CopyBuffer(alligatorDef,0,0,13,jawsArray);
   CopyBuffer(alligatorDef,1,0,13,teethArray);
   CopyBuffer(alligatorDef,2,0,13,lipsArray);
//get value of current data
   double jawsValue=NormalizeDouble(jawsArray[0],5);
   double teethValue=NormalizeDouble(teethArray[0],5);
   double lipsValue=NormalizeDouble(lipsArray[0],5);
//conditions of strategy
   if(lipsValue>teethValue && lipsValue>jawsValue)
     {
      Comment("Buy","\n",
              "jawsValue = ",jawsValue,"\n",
              "teethValue = ",teethValue,"\n",
              "lipsValue = ",lipsValue);
     }
   if(lipsValue<teethValue && lipsValue<jawsValue)
     {
      Comment("Sell","\n",
              "jawsValue = ",jawsValue,"\n",
              "teethValue = ",teethValue,"\n",
              "lipsValue = ",lipsValue);
     }
  }
//+------------------------------------------------------------------+