//+------------------------------------------------------------------+
//|                                        Bear's Power Movement.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double bearpowerArray[];

   ArraySetAsSeries(bearpowerArray,true);

   int bearpowerDef = iBearsPower(_Symbol,_Period,13);

   CopyBuffer(bearpowerDef,0,0,3,bearpowerArray);

   double bearpowerVal = NormalizeDouble(bearpowerArray[0],6);
   double bearpowerPrevVal = NormalizeDouble(bearpowerArray[1],6);

   if(bearpowerVal>bearpowerPrevVal)
     {
      Comment("Bear's Power is rising","\n",
              "Bear's Power Value is ",bearpowerVal,"\n",
              "Bear's Power Previous Value is ",bearpowerPrevVal);
     }

   if(bearpowerVal<bearpowerPrevVal)
     {
      Comment("Bear's Power is declining","\n",
              "Bear's Power Value is ",bearpowerVal,"\n",
              "Bear's Power Previous Value is ",bearpowerPrevVal);
     }
  }
//+------------------------------------------------------------------+
