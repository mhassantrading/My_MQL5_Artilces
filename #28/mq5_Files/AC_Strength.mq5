//+------------------------------------------------------------------+
//|                                                  AC Strength.mq5 |
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
   CopyBuffer(acDef,0,0,11,acArray);
   double acCurrVal = NormalizeDouble(acArray[0],7);
   int acMaxArray = ArrayMaximum(acArray,1,WHOLE_ARRAY);
   int acMinArray = ArrayMinimum(acArray,1,WHOLE_ARRAY);
   double acMaxVal = NormalizeDouble(acArray[acMaxArray],7);
   double acMinVal = NormalizeDouble(acArray[acMinArray],7);
   if(acCurrVal>acMaxVal)
     {
      Comment("AC is strong ","\n",
              "AC Value is ",acCurrVal,"\n",
              "AC Max is ",acMaxVal,"\n",
              "AC Min is ",acMinVal);
     }
   if(acCurrVal<acMinVal)
     {
      Comment("AC is weak ","\n",
              "AC Value is ",acCurrVal,"\n",
              "AC Max is ",acMaxVal,"\n",
              "AC Min is ",acMinVal);
     }
  }
//+------------------------------------------------------------------+
