//+------------------------------------------------------------------+
//|                             Force Index - Down or Divergence.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double fiArray[];
   MqlRates pArray[];

   ArraySetAsSeries(fiArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,pArray);

   int fiDef = iForce(_Symbol,_Period,13,MODE_EMA,VOLUME_TICK);

   CopyBuffer(fiDef,0,0,3,fiArray);

   double fiCurrentVal = NormalizeDouble(fiArray[0],6);
   double fiPrevVal = NormalizeDouble(fiArray[1],6);

   double currentLowVal=NormalizeDouble(pArray[2].low,6);
   double prevLowVal=NormalizeDouble(pArray[1].low,6);

   if(currentLowVal<prevLowVal && fiCurrentVal<fiPrevVal)
     {
      Comment("Strong down move","\n",
      "Current Low is ",currentLowVal,"\n",
      "Previous Low is ",prevLowVal,"\n",
      "Current Force Index Value is ",fiCurrentVal,"\n",
      "Previous Force Index Value is ",fiPrevVal);
     }

   if(currentLowVal<prevLowVal && fiCurrentVal>fiPrevVal)
     {
      Comment("Bullish Divergence","\n",
      "Current Low is ",currentLowVal,"\n",
      "Previous Low is ",prevLowVal,"\n",
      "Current Force Index Value is ",fiCurrentVal,"\n",
      "Previous Force Index Value is ",fiPrevVal);
     }

  }
//+------------------------------------------------------------------+
