//+------------------------------------------------------------------+
//|                                                   Simple OBV.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //creating an array for OBV
   double OBVArray[];
   
   //sorting the array from the current data
   ArraySetAsSeries(OBVArray,true);
   
   //defining OBV
   int OBVDef =iOBV(_Symbol, _Period,VOLUME_TICK);
   
   //defining EA, buffer, sorting in array
   CopyBuffer(OBVDef,0,0,3,OBVArray);
   
   //calculating current OBV value
   double OBVValue=OBVArray[0];
   
   //creating a comment with OBV value
   Comment("OBV Value is: ",OBVValue);  
  }
//+------------------------------------------------------------------+