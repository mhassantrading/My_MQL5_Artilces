//+------------------------------------------------------------------+
//|                                        Price&Vol - Downtrend.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//Create arrays for price & Volume
   MqlRates PriceArray[];
   double VolArray[];

//filling price array with data
   int Data=CopyRates(_Symbol,_Period,0,3,PriceArray);

//sorting arrays from the current data
   ArraySetAsSeries(VolArray,true);

//defining Volume
   int VolDef=iVolumes(_Symbol,_Period,VOLUME_TICK);

//filling the array
   CopyBuffer(VolDef,0,0,3,VolArray);

//calculating current and previous of lows and volume
   double CurrentLowValue=NormalizeDouble(PriceArray[2].low,5);
   double PrevLowValue=NormalizeDouble(PriceArray[1].low,5);
   double VolCurrentValue=NormalizeDouble(VolArray[0],5);
   double VolPrevValue=NormalizeDouble(VolArray[1],5);

//Conditions of short signal
//short signal
   if(CurrentLowValue<PrevLowValue&&VolCurrentValue>VolPrevValue)
     {
      Comment("Short Signal during downtrend",
              "\n","Current low is: ",CurrentLowValue,"\n","Previous low is: ",PrevLowValue,
              "\n","Volume current value is: ",VolCurrentValue,"\n","Volumes previous value is: ",VolPrevValue);
     }

//no signal
   if(CurrentLowValue<PrevLowValue&&VolCurrentValue<VolPrevValue)
     {
      Comment("Current low is: ",CurrentLowValue,"\n","Previous low is: ",PrevLowValue,
              "\n","Volume current value is: ",VolCurrentValue,"\n","Volumes previous value is: ",VolPrevValue);
     }
  }
//+------------------------------------------------------------------+
