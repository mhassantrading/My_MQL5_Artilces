//+------------------------------------------------------------------+
//|                          Bull's Power - Strong or Divergence.mq5 |
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
   MqlRates priceArray[];

   ArraySetAsSeries(bullpowerArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);

   int bullpowerDef = iBullsPower(_Symbol,_Period,13);

   CopyBuffer(bullpowerDef,0,0,3,bullpowerArray);

   double bullpowerVal = NormalizeDouble(bullpowerArray[0],6);
   double bullpowerPrevVal = NormalizeDouble(bullpowerArray[1],6);

   double currentHighVal=NormalizeDouble(priceArray[2].high,6);
   double prevHighVal=NormalizeDouble(priceArray[1].high,6);

   if(currentHighVal>prevHighVal && bullpowerVal>bullpowerPrevVal)
     {
      Comment("Strong Move","\n",
              "Current High Value is ",currentHighVal,"\n",
              "Previous High Value is ",prevHighVal,"\n",
              "Bull's Power Value is ",bullpowerVal,"\n",
              "Bull's Power Previous Value is ",bullpowerPrevVal);
     }

   if(currentHighVal>prevHighVal && bullpowerVal<bullpowerPrevVal)
     {
      Comment("Bearish divergence","\n",
              "Current High Value is ",currentHighVal,"\n",
              "Previous High Value is ",prevHighVal,"\n",
              "Bull's Power Value is ",bullpowerVal,"\n",
              "Bull's Power Previous Value is ",bullpowerPrevVal);
     }
  }
//+------------------------------------------------------------------+
