//+------------------------------------------------------------------+
//|                                    Simple Chaikin Oscillator.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double chaiArray[];

   ArraySetAsSeries(chaiArray,true);

   int chaiDef = iChaikin(_Symbol,_Period,3,10,MODE_EMA,VOLUME_TICK);

   CopyBuffer(chaiDef,0,0,3,chaiArray);

   int chaiVal = NormalizeDouble(chaiArray[0],6);

   Comment("Chaikin Oscillator Value is ",chaiVal);

  }
//+------------------------------------------------------------------+
