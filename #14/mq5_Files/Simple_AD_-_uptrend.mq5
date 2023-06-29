//+------------------------------------------------------------------+
//|                                          Simple AD - uptrend.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {  
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
   
   //calculating current and previous highs
   double CurrentHighValue=NormalizeDouble(PriceArray[2].high,5);         
   double PrevHighValue=NormalizeDouble(PriceArray[1].high,5); 
   
   //Comparing two values and giving signal
   //Strong Up move
   if(ADCurrrentValue > ADPrevValue && CurrentHighValue>PrevHighValue)
   {
      Comment("Strong Up Move During The Uptrend","\n","AD current value is: ",ADCurrrentValue,
      "\n","AD previous value is: ",ADPrevValue,
      "\n","Current high value is: ",CurrentHighValue,
      "\n","Previous high value is: ",PrevHighValue);    
   }   
   
   //in case of divergence
   if(ADCurrrentValue < ADPrevValue && CurrentHighValue>PrevHighValue)
   {
      Comment("Bearish Divergence","\n","AD current value is: ",ADCurrrentValue,
      "\n","AD previous value is: ",ADPrevValue,
      "\n","Current low value is: ",CurrentHighValue,
      "\n","Previous low value is: ",PrevHighValue);      
   }   
  }
//+------------------------------------------------------------------+
