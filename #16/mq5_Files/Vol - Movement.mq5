//+------------------------------------------------------------------+
//|                                               Vol - Movement.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//Create an array for Volume
   double VolArray[];

//sorting the array from the current data
   ArraySetAsSeries(VolArray,true);

//defining Volume
   int VolDef=iVolumes(_Symbol,_Period,VOLUME_TICK);

//filling the array
   CopyBuffer(VolDef,0,0,3,VolArray);

//calculating current and previous vol value
   double VolCurrentValue=NormalizeDouble(VolArray[0],5);
   double VolPrevValue=NormalizeDouble(VolArray[1],5);

//Conditions of vol movements
//Volume increasing
   if(VolCurrentValue>VolPrevValue)
     {
      Comment("Volumes increased","\n","Volumes current value is: ",VolCurrentValue,
              "\n","Volumes previous value is: ",VolPrevValue);
     }

//Volume decreasing
   if(VolCurrentValue<VolPrevValue)
     {
      Comment("Volumes decreased","\n","Volumes current value is: ",VolCurrentValue,
              "\n","Volumes previous value is: ",VolPrevValue);
     }
  }
//+------------------------------------------------------------------+
