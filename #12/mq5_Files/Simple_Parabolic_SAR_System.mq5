//+------------------------------------------------------------------+
//|                                  Simple Parabolic SAR System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {    
   //create a SAR array
   double SARArray[];
   
   //define SAR EA
   int SARDef=iSAR(_Symbol,_Period,0.02,0.2);
   
   //sort array from current data
   ArraySetAsSeries(SARArray,true);
   
   //fill SARArray with SARDef 
   CopyBuffer(SARDef,0,0,3,SARArray);
   
   //calculate value of last data
   double SARValue=NormalizeDouble(SARArray[0],5);

   //chart comment with the signal
   Comment("Parabolic SAR value is ",SARValue);
  }
//+------------------------------------------------------------------+
