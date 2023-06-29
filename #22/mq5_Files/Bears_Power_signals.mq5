//+------------------------------------------------------------------+
//|                                         Bear's Power signals.mq5 |
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
   double maArray[];
   MqlRates priceArray[];

   ArraySetAsSeries(bearpowerArray,true);
   ArraySetAsSeries(maArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);

   int bearpowerDef = iBearsPower(_Symbol,_Period,13);
   int maDef = iMA(_Symbol,_Period,13,0,MODE_EMA,PRICE_CLOSE);

   CopyBuffer(bearpowerDef,0,0,3,bearpowerArray);
   CopyBuffer(maDef,0,0,3,maArray);

   double bearpowerVal = NormalizeDouble(bearpowerArray[0],6);

   double emaVal = NormalizeDouble(maArray[0],6);

   double currentClose=NormalizeDouble(priceArray[2].close,6);

   if(bearpowerVal>0 && currentClose>emaVal)
     {
      Comment("Buy Signal","\n",
              "Current Close Value is ",currentClose,"\n",
              "Current EMA Value is ",emaVal,"\n",
              "Bear's Power Value is ",bearpowerVal);
     }

   if(bearpowerVal<0 && currentClose<emaVal)
     {
      Comment("Sell Signal","\n",
              "Current Close Value is ",currentClose,"\n",
              "Current EMA Value is ",emaVal,"\n",
              "Bear's Power Value is ",bearpowerVal);
     }
  }
//+------------------------------------------------------------------+
