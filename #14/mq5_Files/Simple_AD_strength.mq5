//+------------------------------------------------------------------+
//|                                           Simple AD strength.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
void OnTick()
  {
   //Create array for AD
   double ADArray[];
   
   //sorting the array from the current data
   ArraySetAsSeries(ADArray,true);
  
   //defining AD
   int ADDef=iAD(_Symbol,_Period,VOLUME_TICK);
   
   //filling the ADArray with ADDef
   CopyBuffer(ADDef,0,0,10,ADArray);
 
   //calculating current AD and previous values
   int ADCurrrentValue=NormalizeDouble(ADArray[0],5);
  
   //Defining Max and Min values from the last 10 AD values
   int ADMax =ArrayMaximum(ADArray,1,10);
   int ADMin =ArrayMinimum(ADArray,1,10);
   
   //Calculating Max and Min values
   int ADMaxValue=ADArray[ADMax];
   int ADMinValue=ADArray[ADMin];

   //Comparing two values and giving signal
   //AD current is strong
   if(ADCurrrentValue>ADMaxValue)
   {
      Comment("AD Current value is strong","\n","AD current value is: ,",ADCurrrentValue,
   "\n","AD Max is: ",ADMaxValue,"\n","AD Min is: ",ADMinValue);
   }
   
   //AD current is weak
   if(ADCurrrentValue<ADMinValue)
   {
      Comment("AD Current value is weak","\n","AD current value is: ,",ADCurrrentValue,
   "\n","AD Max is: ",ADMaxValue,"\n","AD Min is: ",ADMinValue);
   }
  }
//+------------------------------------------------------------------+
