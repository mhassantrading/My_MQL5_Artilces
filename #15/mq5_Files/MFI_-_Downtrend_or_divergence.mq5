//+------------------------------------------------------------------+
//|                                MFI - Downtrend or divergence.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//Create arrays for MFI and price
   double MFIArray[];
   MqlRates PriceArray[];

//sorting arrays from the current data
   ArraySetAsSeries(MFIArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,PriceArray);

//defining MFI
   int MFIDef=iMFI(_Symbol,_Period,24,VOLUME_TICK);

//filling the array
   CopyBuffer(MFIDef,0,0,3,MFIArray);

//calculating current and previous MFI values
   double MFICurrentValue=NormalizeDouble(MFIArray[0],5);
   double MFIPrevValue=NormalizeDouble(MFIArray[1],5);

//calculating current and previous highs
   double CurrentLowValue=NormalizeDouble(PriceArray[2].low,5);
   double PrevLowValue=NormalizeDouble(PriceArray[1].low,5);

//conditions of strong move or divergence
//strong down
   if(MFICurrentValue<MFIPrevValue&&CurrentLowValue<PrevLowValue)
     {
      Comment("Strong down move");
     }

//bullish divergence
   if(MFICurrentValue>MFIPrevValue&&CurrentLowValue<PrevLowValue)
     {
      Comment("Bullish divergence");
     }
  }
//+------------------------------------------------------------------+
