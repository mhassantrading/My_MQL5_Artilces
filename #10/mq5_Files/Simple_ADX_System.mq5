//+------------------------------------------------------------------+
//|                                            Simple ADX System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//creating an array for prices
   double PriceArray[];

//sort price array from current data
   ArraySetAsSeries(PriceArray,true);

//identify ADX
   int ADXDef = iADX(_Symbol,_Period,14);

//Filling data according to created ADX
   CopyBuffer(ADXDef,0,0,3,PriceArray);

//Getting value of current data
   double ADXValue=NormalizeDouble(PriceArray[0],2);

//Comment with ADX value
   Comment("ADX Value is ", ADXValue);
  }
//+------------------------------------------------------------------+
