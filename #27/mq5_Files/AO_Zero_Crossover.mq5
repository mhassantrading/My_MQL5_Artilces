//+------------------------------------------------------------------+
//|                                            AO Zero Crossover.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double aoArray[];

   ArraySetAsSeries(aoArray,true);

   int aoDef = iAO(_Symbol,_Period);

   CopyBuffer(aoDef,0,0,3,aoArray);

   double aoVal = NormalizeDouble(aoArray[0],7);

   if(aoVal > 0)
     {
      Comment("Bullish","\n"
              "AO Value is ",aoVal);
     }

   if(aoVal < 0)
     {
      Comment("Bearish","\n"
              "AO Value is ",aoVal);
     }

  }
//+------------------------------------------------------------------+