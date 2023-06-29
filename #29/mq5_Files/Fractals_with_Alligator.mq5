//+------------------------------------------------------------------+
//|                                      Fractals with Alligator.mq5 |
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
   double jawsArray[];
   double teethArray[];
   double lipsArray[];
//Sorting data
   ArraySetAsSeries(fracUpArray,true);
   ArraySetAsSeries(fracDownArray,true);
   ArraySetAsSeries(jawsArray,true);
   ArraySetAsSeries(teethArray,true);
   ArraySetAsSeries(lipsArray,true);
//define values
   int fracDef=iFractals(_Symbol,_Period);
   int Data = CopyRates(_Symbol,_Period,0,3,priceArray);
   int alligatorDef=iAlligator(_Symbol,_Period,13,8,8,5,5,3,MODE_SMMA,PRICE_MEDIAN);
//define data and store result
   CopyBuffer(fracDef,UPPER_LINE,2,1,fracUpArray);
   CopyBuffer(fracDef,LOWER_LINE,2,1,fracDownArray);
   CopyBuffer(alligatorDef,0,0,3,jawsArray);
   CopyBuffer(alligatorDef,1,0,3,teethArray);
   CopyBuffer(alligatorDef,2,0,3,lipsArray);
//get values
   double fracUpValue=NormalizeDouble(fracUpArray[0],5);
   double fracDownValue=NormalizeDouble(fracDownArray[0],5);
   double closingPrice = priceArray[0].close;
   double jawsValue=NormalizeDouble(jawsArray[0],5);
   double teethValue=NormalizeDouble(teethArray[0],5);
   double lipsValue=NormalizeDouble(lipsArray[0],5);
//creating bool variables to aviod buy ans sell signals at the same time
   bool isBuy = false;
   bool isSell = false;
//conditions of the strategy and comment on the chart
//in case of buy
   if(lipsValue>teethValue && lipsValue>jawsValue && teethValue>jawsValue
   && closingPrice > teethValue && fracDownValue != EMPTY_VALUE)
     {
      Comment("Buy","\n",
              "jawsValue = ",jawsValue,"\n",
              "teethValue = ",teethValue,"\n",
              "lipsValue = ",lipsValue,"\n",
              "Fractals Low around: ",fracDownValue);
      isBuy = true;
     }
//in case of sell
   if(lipsValue<teethValue && lipsValue<jawsValue && teethValue<jawsValue
   && closingPrice < teethValue && fracUpValue != EMPTY_VALUE)
     {
      Comment("Sell","\n",
              "jawsValue = ",jawsValue,"\n",
              "teethValue = ",teethValue,"\n",
              "lipsValue = ",lipsValue,"\n",
              "Fractals High around: ",fracUpValue);
      isSell = true;
     }
  }
//+------------------------------------------------------------------+
