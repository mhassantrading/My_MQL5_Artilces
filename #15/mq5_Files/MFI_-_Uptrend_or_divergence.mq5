//+------------------------------------------------------------------+
//|                                  MFI - Uptrend or divergence.mq5 |
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

//filling the MFI array
   CopyBuffer(MFIDef,0,0,3,MFIArray);

//calculating current and previous MFI values
   double MFICurrentValue=NormalizeDouble(MFIArray[0],5);
   double MFIPrevValue=NormalizeDouble(MFIArray[1],5);

//calculating current and previous highs
   double CurrentHighValue=NormalizeDouble(PriceArray[2].high,5);
   double PrevHighValue=NormalizeDouble(PriceArray[1].high,5);

//conditions of strong move or divergence
//strong up
   if(MFICurrentValue>MFIPrevValue&&CurrentHighValue>PrevHighValue)
     {
      Comment("Strong up move");
     }

//bearish divergence
   if(MFICurrentValue<MFIPrevValue&&CurrentHighValue>PrevHighValue)
     {
      Comment("Bearish divergence");
     }
  }
//+------------------------------------------------------------------+
