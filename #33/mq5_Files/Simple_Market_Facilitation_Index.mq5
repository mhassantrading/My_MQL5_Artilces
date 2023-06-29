//+------------------------------------------------------------------+
//|                             Simple Market Facilitation Index.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double BWMFIArray[];
   ArraySetAsSeries(BWMFIArray,true);
   int BWMFIDef=iBWMFI(_Symbol,_Period,VOLUME_TICK);
   CopyBuffer(BWMFIDef,0,0,3,BWMFIArray);
   double BWMFIVal=NormalizeDouble(BWMFIArray[0],5);
   Comment("BW MFI Value = ",BWMFIVal);
  }
//+------------------------------------------------------------------+