//+------------------------------------------------------------------+
//|                                               Simple Volumes.mq5 |
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

//calculating current vol value
   int VolValue=NormalizeDouble(VolArray[0],5);

//creating a comment with current vol value
   Comment("Volumes Value is: ",VolValue);
  }
//+------------------------------------------------------------------+
