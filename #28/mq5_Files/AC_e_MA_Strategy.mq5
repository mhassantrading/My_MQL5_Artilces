//+------------------------------------------------------------------+
//|                                             AC & MA Strategy.mq5 |
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
   double acArray[];
   double maArray[];
   int Data=CopyRates(_Symbol,_Period,0,1,pArray);
   ArraySetAsSeries(acArray,true);
   ArraySetAsSeries(maArray,true);
   int acDef = iAC(_Symbol,_Period);
   int maDef = iMA(_Symbol,_Period,50,0,MODE_EMA,PRICE_CLOSE);
   CopyBuffer(acDef,0,0,3,acArray);
   CopyBuffer(maDef,0,0,3,maArray);
   int acMaxArray = ArrayMaximum(acArray,1,WHOLE_ARRAY);
   int acMinArray = ArrayMinimum(acArray,1,WHOLE_ARRAY);
   double closingPrice = pArray[0].close;
   double acVal = NormalizeDouble(acArray[0],7);
   double acMaxVal = NormalizeDouble(acArray[acMaxArray],7);
   double acMinVal = NormalizeDouble(acArray[acMinArray],7);
   double maVal = NormalizeDouble(maArray[0],7);
   if(acVal > acMaxVal && closingPrice > maVal)
     {
      Comment("Buy","\n"
              "Closing Price is ",closingPrice,"\n",
              "Ac Value is ",acVal,"\n",
              "AC Max is ",acMaxVal,"\n",
              "AC Min is ",acMinVal,"\n",
              "MA Value is ",maVal);
     }
   if(acVal < acMinVal && closingPrice < maVal)
     {
      Comment("Sell","\n"
              "Closing Price is ",closingPrice,"\n",
              "Ac Value is ",acVal,"\n",
              "AC Max is ",acMaxVal,"\n",
              "AC Min is ",acMinVal,"\n",
              "MA Value is ",maVal);
     }
  }
//+------------------------------------------------------------------+
