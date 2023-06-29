//+------------------------------------------------------------------+
//|                                                    Simple AD.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //create an array for AD
   double ADArray[];
   
   //sorting the array from the current data
   ArraySetAsSeries(ADArray,true);
   
   //defining AD
   int ADDef=iAD(_Symbol,_Period,VOLUME_TICK);
   
   //filling the ADArray with ADDef
   CopyBuffer(ADDef,0,0,3,ADArray);
   
   //calculating current AD value
   int ADValue=NormalizeDouble(ADArray[0],5);
   
   //creating a comment with AD value
   Comment("AD Value is: ",ADValue);  
  }
//+------------------------------------------------------------------+
