//+------------------------------------------------------------------+
//|                                          DeMarker Divergence.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double deMarkerArray[];
   MqlRates pArray[];


   ArraySetAsSeries(deMarkerArray,true);
   ArraySetAsSeries(pArray,true);

   int deMarkerDef = iDeMarker(_Symbol,_Period,14);
   int pData = CopyRates(_Symbol,_Period,0,14,pArray);

   CopyBuffer(deMarkerDef,0,0,14,deMarkerArray);

   double deMarkerVal = NormalizeDouble(deMarkerArray[0],4);
   double deMarkerPrevVal = NormalizeDouble(deMarkerArray[1],4);

   double currentHigh = NormalizeDouble(pArray[0].high,6);
   double currentLow = NormalizeDouble(pArray[0].low,6);
   double prevHigh = NormalizeDouble(pArray[1].high,6);
   double prevLow = NormalizeDouble(pArray[1].low,6);

   if(currentHigh>prevHigh && deMarkerVal<deMarkerPrevVal)
     {
      Comment("Bearish divergence","\n",
              "Current High is ",currentHigh,"\n",
              "Prev. High Value is ",prevHigh,"\n",
              "Current DeMarker Value is ",deMarkerVal,"\n",
              "Prev. DeMarker Value is ",deMarkerPrevVal);
     }
   if(currentLow<prevLow && deMarkerVal>deMarkerPrevVal)
     {
      Comment("Bullish divergence","\n",
              "Current Low is ",currentLow,"\n",
              "Prev. Low Value is ",prevLow,"\n",
              "Current DeMarker Value is ",deMarkerVal,"\n",
              "Prev. DeMarker Value is ",deMarkerPrevVal);
     }

  }
//+------------------------------------------------------------------+
