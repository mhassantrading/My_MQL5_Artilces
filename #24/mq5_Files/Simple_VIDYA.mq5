//+------------------------------------------------------------------+
//|                                                 Simple VIDYA.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double vidyaArray[];

   ArraySetAsSeries(vidyaArray,true);

   int vidyaDef = iVIDyA(_Symbol,_Period,9,12,0,PRICE_CLOSE);

   CopyBuffer(vidyaDef,0,0,3,vidyaArray);

   double vidyaVal = NormalizeDouble(vidyaArray[0],6);

   Comment("VIDYA Value is ",vidyaVal);

  }
//+------------------------------------------------------------------+

