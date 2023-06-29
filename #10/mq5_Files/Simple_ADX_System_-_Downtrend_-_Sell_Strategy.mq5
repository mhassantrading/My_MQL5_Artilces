//+------------------------------------------------------------------+
//|                Simple ADX System - Downtrend - Sell Strategy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
  
   // creating a variable for signal
   string signal="";
   
   //creating an array for prices
   double ADXArray0[];
   double ADXArray1[];
   double PDIArray[];
   double NDIArray[];
   
   //identify ADX, positive DI, negative DI
   int ADXDef = iADX(_Symbol,_Period,14);
   
   
   //sort price array from current data
   ArraySetAsSeries(ADXArray0,true);
   ArraySetAsSeries(ADXArray1,true);
   ArraySetAsSeries(PDIArray,true);
   ArraySetAsSeries(NDIArray,true);
   
   //Filling data according to created ADX
   CopyBuffer(ADXDef,0,0,3,ADXArray0);
   CopyBuffer(ADXDef,0,0,2,ADXArray1);
   CopyBuffer(ADXDef,1,0,3,PDIArray);
   CopyBuffer(ADXDef,2,0,3,NDIArray);
   
   //Getting value of current data
   double ADXValue=NormalizeDouble(ADXArray0[0],2);
   double ADXValueLast=NormalizeDouble(ADXArray1[1],2);
   double PDIValue=NormalizeDouble(PDIArray[0],2);
   double NDIValue=NormalizeDouble(NDIArray[0],2);
   
   //Comment with Buy signal according to Buy Strategy
    if (ADXValue>25&&ADXValue>ADXValueLast)
      if(PDIValue<NDIValue)
      {
         signal = "SELL";
      }
      
   Comment("Simple ADX System - Signal is ",signal,"\n""ADX Value is ", ADXValue,
   "\n""ADX Value Last is ", ADXValueLast, "\n""+DI Value is ", PDIValue,
   "\n""-DI Value is ", NDIValue);
  }
//+------------------------------------------------------------------+
