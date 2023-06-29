//+------------------------------------------------------------------+
//|                                           RVI & MA Crossover.mq5 |
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
   double maArray[];
   double rviArray[];
   double rviSignalArray[];

   int Data=CopyRates(_Symbol,_Period,0,1,pArray);
   ArraySetAsSeries(maArray,true);
   ArraySetAsSeries(rviArray,true);
   ArraySetAsSeries(rviSignalArray,true);

   int rviDef = iRVI(_Symbol,_Period,10);
   int maDef = iMA(_Symbol,_Period,100,0,MODE_EMA,PRICE_CLOSE);

   CopyBuffer(rviDef,0,0,3,rviArray);
   CopyBuffer(rviDef,1,0,3,rviSignalArray);
   CopyBuffer(maDef,0,0,3,maArray);

   double rviVal = NormalizeDouble(rviArray[0],3);
   double rviSignalVal = NormalizeDouble(rviSignalArray[0],3);
   double maVal = NormalizeDouble(maArray[0],3);

   if(pArray[0].close>maVal && rviVal>rviSignalVal)
     {
      Comment("Buy Signal","\n",
              "Closing price is ",pArray[0].close,"\n",
              "MA Value is ",maVal,"\n",
              "Relative Vigor Index Value is ",rviVal,"\n",
              "RVI Signal Value is ",rviSignalVal);
     }
   if(pArray[0].close<maVal && rviVal<rviSignalVal)
     {
      Comment("Sell Signal","\n",
              "Closing price is ",pArray[0].close,"\n",
              "MA Value is ",maVal,"\n",
              "Relative Vigor Index Value is ",rviVal,"\n",
              "RVI Signal Value is ",rviSignalVal);
     }


  }
//+------------------------------------------------------------------+
