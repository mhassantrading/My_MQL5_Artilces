//+------------------------------------------------------------------+
//|                             Simple ADX System - ADX Movement.mq5 |
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
   double ADXArray0[];
   double ADXArray1[];

   //sort price array from current data
   ArraySetAsSeries(ADXArray0,true);
   ArraySetAsSeries(ADXArray1,true);
      
   //identify ADX
   int ADXDef = iADX(_Symbol,_Period,14);
   
   //Filling data according to created ADX
   CopyBuffer(ADXDef,0,0,3,ADXArray0);
   CopyBuffer(ADXDef,0,0,2,ADXArray1);
   
   //Getting value of current data
   double ADXValue=NormalizeDouble(ADXArray0[0],2);
   double ADXValuelast=NormalizeDouble(ADXArray1[1],2);
   
   //ADX movement signal
   if (ADXValue>ADXValuelast)
      {
         Comment("ADX is rising","\n""ADX Value is ", ADXValue,"\n""ADX Value last is ", 
   ADXValuelast);
      }
   
   if (ADXValue<ADXValuelast)
     {
         Comment("ADX is falling","\n""ADX Value is ", ADXValue,"\n""ADX Value last is ", 
   ADXValuelast);
      }
   
   
  }
//+------------------------------------------------------------------+
