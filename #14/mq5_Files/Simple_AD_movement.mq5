//+------------------------------------------------------------------+
//|                                           Simple AD movement.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //create array for AD
   double ADArray[];
   
   //sorting array from the current data
   ArraySetAsSeries(ADArray,true);
   
   //defining AD
   int ADDef=iAD(_Symbol,_Period,VOLUME_TICK);
   
   //filling the ADArray with ADDef
   CopyBuffer(ADDef,0,0,3,ADArray);
   
   //calculating current AD and previous values
   int ADCurrrentValue=NormalizeDouble(ADArray[0],5);
   int ADPrevValue=NormalizeDouble(ADArray[1],5);
   
   //Comparing two values and giving signal
   //Rising AD
   if(ADCurrrentValue>ADPrevValue)
   {
      Comment("AD line is rising","\n","AD current value is: ",ADCurrrentValue,
      "\n","AD previous value is: ",ADPrevValue);
   }
   
   //Declining AD
   if(ADCurrrentValue<ADPrevValue)
   {
      Comment("AD line is declining","\n","AD current value is: ",ADCurrrentValue,
      "\n","AD previous value is: ",ADPrevValue);
   }  
  }
//+------------------------------------------------------------------+
