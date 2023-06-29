//+------------------------------------------------------------------+
//|                          Bear's Power - Strong or Divergence.mq5 |
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
   MqlRates priceArray[];

   ArraySetAsSeries(bearpowerArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);

   int bearpowerDef = iBearsPower(_Symbol,_Period,13);

   CopyBuffer(bearpowerDef,0,0,3,bearpowerArray);

   double bearpowerVal = NormalizeDouble(bearpowerArray[0],6);
   double bearpowerPrevVal = NormalizeDouble(bearpowerArray[1],6);

   double currentLowVal=NormalizeDouble(priceArray[2].low,6);
   double prevLowVal=NormalizeDouble(priceArray[1].low,6);

   if(currentLowVal<prevLowVal && bearpowerVal<bearpowerPrevVal)
     {
      Comment("Strong Move","\n",
              "Current Low Value is ",currentLowVal,"\n",
              "Previous Low Value is ",prevLowVal,"\n",
              "Bear's Power Value is ",bearpowerVal,"\n",
              "Bear's Power Previous Value is ",bearpowerPrevVal);
     }

   if(currentLowVal<prevLowVal && bearpowerVal>bearpowerPrevVal)
     {
      Comment("Bullish divergence","\n",
              "Current Low Value is ",currentLowVal,"\n",
              "Previous Low Value is ",prevLowVal,"\n",
              "Bear's Power Value is ",bearpowerVal,"\n",
              "Bear's Power Previous Value is ",bearpowerPrevVal);
     }
  }
//+------------------------------------------------------------------+
