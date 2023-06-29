//+------------------------------------------------------------------+
//|                                        Simple AD - downtrend.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //creating a string variable for signal
   string signal="";
   
   //Create two arrays for AD and price
   double ADArray[];
   MqlRates PriceArray[];
   
   //sorting the two arrays
   ArraySetAsSeries(ADArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,PriceArray);
   
   //defining AD
   int ADDef=iAD(_Symbol,_Period,VOLUME_TICK);
   
   //filling the ADArray with ADDef
   CopyBuffer(ADDef,0,0,3,ADArray);
   
   //calculating current AD and previous values
   int ADCurrrentValue=NormalizeDouble(ADArray[0],5);
   int ADPrevValue=NormalizeDouble(ADArray[1],5);
   
   double CurrentLowValue=NormalizeDouble(PriceArray[2].low,5);         
   double PrevLowValue=NormalizeDouble(PriceArray[1].low,5); 
   
   //Comparing two values and giving signal
   //Strong down move
   if(ADCurrrentValue < ADPrevValue && CurrentLowValue<PrevLowValue)
   {
      Comment("Strong Down Move During The Downtrend","\n","AD current value is: ",ADCurrrentValue,
      "\n","AD previous value is: ",ADPrevValue,
      "\n","Current low value is: ",CurrentLowValue,
      "\n","Previous low value is: ",PrevLowValue);      
   }
   
   //in case of divergence
   if(ADCurrrentValue > ADPrevValue && CurrentLowValue<PrevLowValue)
   {
      Comment("Bullish Divergence","\n","AD current value is: ",ADCurrrentValue,
      "\n","AD previous value is: ",ADPrevValue,
      "\n","Current low value is: ",CurrentLowValue,
      "\n","Previous low value is: ",PrevLowValue);      
   }  
  }
//+------------------------------------------------------------------+
