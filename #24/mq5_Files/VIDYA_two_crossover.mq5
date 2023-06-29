//+------------------------------------------------------------------+
//|                                          VIDYA two crossover.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
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
   double vidyaArray1[];

   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);
   ArraySetAsSeries(vidyaArray,true);
   ArraySetAsSeries(vidyaArray1,true);

   int vidyaDef = iVIDyA(_Symbol,_Period,9,12,0,PRICE_CLOSE);
   int vidyaDef1 = iVIDyA(_Symbol,_Period,20,50,0,PRICE_CLOSE);

   CopyBuffer(vidyaDef,0,0,3,vidyaArray);
   CopyBuffer(vidyaDef1,0,0,3,vidyaArray1);

   double currentClose=NormalizeDouble(priceArray[2].close,6);
   double vidyaVal = NormalizeDouble(vidyaArray[0],6);
   double vidyaVal1 = NormalizeDouble(vidyaArray1[0],6);

   if(vidyaVal>vidyaVal1)
     {
      Comment("Buy signal","\n",
              "Current Close Value is ",currentClose,"\n",
              "Current VIDYA (9,12) Value is ",vidyaVal,"\n",
              "Current VIDYA (20,50) Value is ",vidyaVal1);
     }

   if(vidyaVal<vidyaVal1)
     {
      Comment("Sell signal","\n",
              "Current Close Value is ",currentClose,"\n",
              "Current VIDYA (9,12) Value is ",vidyaVal,"\n",
              "Current VIDYA (20,50) Value is ",vidyaVal1);
     }


  }
//+------------------------------------------------------------------+

