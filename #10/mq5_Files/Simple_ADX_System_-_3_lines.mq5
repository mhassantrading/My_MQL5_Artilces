//+------------------------------------------------------------------+
//|                                  Simple ADX System - 3 lines.mq5 |
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
   double ADXArray[];
   double PDIArray[];
   double NDIArray[];
   
   //sort price array from current data
   ArraySetAsSeries(ADXArray,true);
   ArraySetAsSeries(PDIArray,true);
   ArraySetAsSeries(NDIArray,true);

   //identify ADX
   int ADXDef = iADX(_Symbol,_Period,14);
   
   
   //Filling data according to created ADX
   CopyBuffer(ADXDef,0,0,3,ADXArray);
   CopyBuffer(ADXDef,1,0,3,PDIArray);
   CopyBuffer(ADXDef,2,0,3,NDIArray);
   
   //Getting value of current data
   double ADXValue=NormalizeDouble(ADXArray[0],2);
   double PDIValue=NormalizeDouble(PDIArray[0],2);
   double NDIValue=NormalizeDouble(NDIArray[0],2);
   
   //Comment with ADX value
   Comment("ADX Value is ", ADXValue,"\n""+DI Value is ", 
   PDIValue,"\n""-DI Value is ", NDIValue);
  }
//+------------------------------------------------------------------+
