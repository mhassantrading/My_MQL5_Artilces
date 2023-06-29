//+------------------------------------------------------------------+
//|                                             Fractals with MA.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//creating arrays
   double fracUpArray[];
   double fracDownArray[];
   MqlRates priceArray[];
   double maArray[];
//Sorting data
   ArraySetAsSeries(fracUpArray,true);
   ArraySetAsSeries(fracDownArray,true);
   ArraySetAsSeries(priceArray,true);
   ArraySetAsSeries(maArray,true);
//define values
   int fracDef = iFractals(_Symbol,_Period);
   int Data = CopyRates(_Symbol,_Period,0,3,priceArray);
   int maDef = iMA(_Symbol,_Period,50,0,MODE_EMA,PRICE_CLOSE);
//define data and store result
   CopyBuffer(fracDef,UPPER_LINE,2,1,fracUpArray);
   CopyBuffer(fracDef,LOWER_LINE,2,1,fracDownArray);
   CopyBuffer(maDef,0,0,3,maArray);
//get values
   double fracUpValue = NormalizeDouble(fracUpArray[0],5);
   double fracDownValue = NormalizeDouble(fracDownArray[0],5);
   double closingPrice = priceArray[0].close;
   double maValue = NormalizeDouble(maArray[0],6);
   bool isBuy = false;
   bool isSell = false;
//conditions of the strategy and comment on the chart
//in case of buy
   if(closingPrice > maValue && fracDownValue != EMPTY_VALUE)
     {
      Comment("Buy","\n",
              "Current EMA: ",maValue,"\n",
              "Fractals Low around: ",fracDownValue);
      isBuy = true;
     }
//in case of sell
   if(closingPrice < maValue && fracUpValue != EMPTY_VALUE)
     {
      Comment("Sell","\n",
              "Current EMA: ",maValue,"\n",
              "Fractals High around: ",fracUpValue);
      isSell = true;
     }
  }
//+------------------------------------------------------------------+
