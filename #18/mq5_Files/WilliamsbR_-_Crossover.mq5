//+------------------------------------------------------------------+
//|                                       Williams%R - Crossover.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double WPArray[];

   ArraySetAsSeries(WPArray,true);

   int WPDef = iWPR(_Symbol,_Period,14);

   CopyBuffer(WPDef,0,0,3,WPArray);

   double WPVal = NormalizeDouble(WPArray[0],2);
   double WPPrevVal = NormalizeDouble(WPArray[1],2);

   if(WPPrevVal<-50 && WPVal>-50)
     {
      Comment("Buy signal","\n",
              "Williams % R Value is",WPVal,"\n",
              "Williams % R Previous Value is",WPPrevVal);
     }

   if(WPPrevVal>-50 && WPVal<-50)
     {
      Comment("Sell signal","\n",
              "Williams % R Value is",WPVal,"\n",
              "Williams % R Previous Value is",WPPrevVal);
     }

  }
//+------------------------------------------------------------------+
