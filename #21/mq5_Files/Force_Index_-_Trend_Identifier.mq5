//+------------------------------------------------------------------+
//|                               Force Index - Trend Identifier.mq5 |
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

   ArraySetAsSeries(fiArray,true);

   int fiDef = iForce(_Symbol,_Period,100,MODE_EMA,VOLUME_TICK);

   CopyBuffer(fiDef,0,0,3,fiArray);

   double fiVal = NormalizeDouble(fiArray[0],6);

   if(fiVal>0)
     {
      Comment("Bullish Movement","\n","Force Index Value is ",fiVal);
     }

   if(fiVal<0)
     {
      Comment("Bearish Movement","\n","Force Index Value is ",fiVal);
     }

  }
//+------------------------------------------------------------------+
