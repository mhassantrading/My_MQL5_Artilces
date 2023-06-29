//+------------------------------------------------------------------+
//|                                       Simple Fractals System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//creating price array
   double fracUpArray[];
   double fracDownArray[];
//Sorting data
   ArraySetAsSeries(fracUpArray,true);
   ArraySetAsSeries(fracDownArray,true);
//define frac
   int fracDef=iFractals(_Symbol,_Period);
//define data and store result
   CopyBuffer(fracDef,UPPER_LINE,2,1,fracUpArray);
   CopyBuffer(fracDef,LOWER_LINE,2,1,fracDownArray);
//get values of fracUp and fracDown
   double fracUpValue=NormalizeDouble(fracUpArray[0],5);
   double fracDownValue=NormalizeDouble(fracDownArray[0],5);
//returning zero if there is empty value of fracUp
   if(fracUpValue==EMPTY_VALUE)
      fracUpValue = 0;
//returning zero if there is empty value of fracDown
   if(fracDownValue==EMPTY_VALUE)
      fracDownValue = 0;
//comment on the chart
   Comment("Fractals Up Value = ",fracUpValue,"\n",
           "Fractals Down Value = ",fracDownValue);
  }
//+------------------------------------------------------------------+
