//+------------------------------------------------------------------+
//|                                               Simple Std Dev.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double StdDevArray[];

   ArraySetAsSeries(StdDevArray,true);

   int StdDevDef = iStdDev(_Symbol,_Period,20,0,MODE_SMA,PRICE_CLOSE);

   CopyBuffer(StdDevDef,0,0,3,StdDevArray);

   double StdDevVal = NormalizeDouble(StdDevArray[0],6);

   Comment("StdDev Value is",StdDevVal);

  }
//+------------------------------------------------------------------+
