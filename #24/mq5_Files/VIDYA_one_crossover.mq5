//+------------------------------------------------------------------+
//|                                          VIDYA one crossover.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   MqlRates priceArray[];
   double vidyaArray[];

   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);
   ArraySetAsSeries(vidyaArray,true);

   int vidyaDef = iVIDyA(_Symbol,_Period,9,12,0,PRICE_CLOSE);

   CopyBuffer(vidyaDef,0,0,3,vidyaArray);

   double currentClose=NormalizeDouble(priceArray[2].close,6);
   double vidyaVal = NormalizeDouble(vidyaArray[0],6);

   if(currentClose>vidyaVal)
     {
      Comment("Buy signal","\n",
              "Current Close Value is ",currentClose,"\n",
              "Current VIDYA Value is ",vidyaVal);
     }

   if(currentClose<vidyaVal)
     {
      Comment("Sell signal","\n",
              "Current Close Value is ",currentClose,"\n",
              "Current VIDYA Value is ",vidyaVal);
     }


  }
//+------------------------------------------------------------------+

