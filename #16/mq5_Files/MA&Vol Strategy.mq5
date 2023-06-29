//+------------------------------------------------------------------+
//|                                              MA&Vol Strategy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//Create arrays for MA & Volume
   double MAShortArray[],MALongArray[];
   double VolArray[];

//sorting arrays from the current data
   ArraySetAsSeries(MAShortArray,true);
   ArraySetAsSeries(MALongArray,true);
   ArraySetAsSeries(VolArray,true);

//defining MA & Volume
   int MAShortDef = iMA(_Symbol, _Period, 10, 0, MODE_SMA, PRICE_CLOSE);
   int MALongDef = iMA(_Symbol, _Period, 24, 0, MODE_SMA, PRICE_CLOSE);
   int VolDef=iVolumes(_Symbol,_Period,VOLUME_TICK);

//filling arrays
   CopyBuffer(MAShortDef,0,0,3,MAShortArray);
   CopyBuffer(MALongDef,0,0,3,MALongArray);
   CopyBuffer(VolDef,0,0,3,VolArray);

//calculating MA && current volume values
   double MAShortCurrentValue=NormalizeDouble(MAShortArray[0],6);
   double MAShortPrevValue=NormalizeDouble(MAShortArray[1],6);
   double MALongCurrentValue=NormalizeDouble(MALongArray[0],6);
   double MALongPrevValue=NormalizeDouble(MALongArray[1],6);
   double VolCurrentValue=NormalizeDouble(VolArray[0],5);
   double VolPrevValue=NormalizeDouble(VolArray[1],5);

//conditions of buy and short signals
//buy signal
   if(MAShortCurrentValue>MALongCurrentValue&&MAShortPrevValue<MALongPrevValue
      &&VolCurrentValue>VolPrevValue)
     {
      Comment("Buy signal");
     }

//short signal
   if(MAShortCurrentValue<MALongCurrentValue&&MAShortPrevValue>MALongPrevValue
      &&VolCurrentValue>VolPrevValue)
     {
      Comment("Short signal");
     }
  }
//+------------------------------------------------------------------+
