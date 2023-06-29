//+------------------------------------------------------------------+
//|                               Simple Gator Oscillator System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double upGatorArray[];
   double downGatorArray[];
   ArraySetAsSeries(upGatorArray,true);
   ArraySetAsSeries(downGatorArray,true);
   int gatorDef=iGator(_Symbol,_Period,13,8,8,5,5,3,MODE_SMMA,PRICE_MEDIAN);
   CopyBuffer(gatorDef,0,0,3,upGatorArray);
   CopyBuffer(gatorDef,2,0,3,downGatorArray);
   double gatorUpValue=NormalizeDouble(upGatorArray[0],6);
   double gatorDownValue=NormalizeDouble(downGatorArray[0],6);
   Comment("gatorUpValue = ",gatorUpValue,"\n",
           "gatorDownValue = ",gatorDownValue);
  }
//+------------------------------------------------------------------+
