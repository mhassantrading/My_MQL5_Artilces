//+------------------------------------------------------------------+
//|                                          Simple Bull's Power.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double bullpowerArray[];

   ArraySetAsSeries(bullpowerArray,true);

   int bullpowerDef = iBullsPower(_Symbol,_Period,13);

   CopyBuffer(bullpowerDef,0,0,3,bullpowerArray);

   double bullpowerVal = NormalizeDouble(bullpowerArray[0],6);

   Comment("Bull's Power Value is ",bullpowerVal);

  }
//+------------------------------------------------------------------+
