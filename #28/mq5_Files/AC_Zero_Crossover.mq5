//+------------------------------------------------------------------+
//|                                            AC Zero Crossover.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
  void OnTick()
  {
   double acArray[];
   ArraySetAsSeries(acArray,true);
   int acDef = iAC(_Symbol,_Period);
   CopyBuffer(acDef,0,0,3,acArray);
   double acVal = NormalizeDouble(acArray[0],7);
   if(acVal > 0)
     {
      Comment("Bullish","\n"
              "AC Value is ",acVal);
     }
   if(acVal < 0)
     {
      Comment("Bearish","\n"
              "AC Value is ",acVal);
     }
  }
//+------------------------------------------------------------------+
