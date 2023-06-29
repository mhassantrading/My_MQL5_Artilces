//+------------------------------------------------------------------+
//|                                             AO & MA Strategy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   MqlRates pArray[];
   double aoArray[];
   double maArray[];

   int Data=CopyRates(_Symbol,_Period,0,1,pArray);
   ArraySetAsSeries(aoArray,true);
   ArraySetAsSeries(maArray,true);
   

   int aoDef = iAO(_Symbol,_Period);
   int maDef = iMA(_Symbol,_Period,50,0,MODE_EMA,PRICE_CLOSE);

   CopyBuffer(aoDef,0,0,3,aoArray);
   CopyBuffer(maDef,0,0,3,maArray);

   double closingPrice = pArray[0].close;
   double aoVal = NormalizeDouble(aoArray[0],7);
   double maVal = NormalizeDouble(maArray[0],7);

   if(aoVal > 0 && closingPrice > maVal)
     {
      Comment("Buy","\n"
              "Closing Price is ",closingPrice,"\n",
              "AO Value is ",aoVal,"\n",
              "MA Value is ",maVal);
     }

   if(aoVal < 0 && closingPrice < maVal)
     {
      Comment("Sell","\n"
              "Closing Price is ",closingPrice,"\n",
              "AO Value is ",aoVal,"\n",
              "MA Value is ",maVal);
     }

  }
//+------------------------------------------------------------------+
