//+------------------------------------------------------------------+
//|                                  Simple Std Dev - Volatility.mq5 |
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

   CopyBuffer(StdDevDef,0,0,6,StdDevArray);

   double StdDevVal = NormalizeDouble(StdDevArray[0],6);
   double StdDevVal1 = NormalizeDouble(StdDevArray[1],6);
   double StdDevVal2 = NormalizeDouble(StdDevArray[2],6);
   double StdDevVal3 = NormalizeDouble(StdDevArray[3],6);
   double StdDevVal4 = NormalizeDouble(StdDevArray[4],6);
   double StdDevVal5 = NormalizeDouble(StdDevArray[5],6);
   double StdDevAVGVal = ((StdDevVal1+StdDevVal2+StdDevVal3+StdDevVal4+StdDevVal5)/5);

   if(StdDevVal>StdDevAVGVal)
     {
      Comment("High volatility","\n",
              "Current Std Dev value is ",StdDevVal,"\n",
              "Std Dev Avg value is ",StdDevAVGVal);
     }

   if(StdDevVal<StdDevAVGVal)
     {
      Comment("Low volatility","\n",
              "Current Std Dev value is ",StdDevVal,"\n",
              "Std Dev Avg value is ",StdDevAVGVal);
     }

  }
//+------------------------------------------------------------------+
