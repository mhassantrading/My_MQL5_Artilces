//+------------------------------------------------------------------+
//|                                          Price&Vol - Uptrend.mq5 |
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

//calculating the current and previous values of highs and volume
   double CurrentHighValue=NormalizeDouble(PriceArray[2].high,5);
   double PrevHighValue=NormalizeDouble(PriceArray[1].high,5);
   double VolCurrentValue=NormalizeDouble(VolArray[0],5);
   double VolPrevValue=NormalizeDouble(VolArray[1],5);

//Conditions of buy signal
//Buy signal
   if(CurrentHighValue>PrevHighValue&&VolCurrentValue>VolPrevValue)
     {
      Comment("Buy Signal during uptrend",
              "\n","Current high is: ",CurrentHighValue,"\n","Previous high is: ",PrevHighValue,
              "\n","Volume current value is: ",VolCurrentValue,"\n","Volumes previous value is: ",VolPrevValue);
     }

//no signal
   if(CurrentHighValue>PrevHighValue&&VolCurrentValue<VolPrevValue)
     {
      Comment("Current high is: ",CurrentHighValue,"\n","Previous high is: ",PrevHighValue,
              "\n","Volume current value is: ",VolCurrentValue,"\n","Volumes previous value is: ",VolPrevValue);
     }
  }
//+------------------------------------------------------------------+
