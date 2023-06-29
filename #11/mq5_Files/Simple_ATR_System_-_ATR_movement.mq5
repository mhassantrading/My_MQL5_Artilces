//+------------------------------------------------------------------+
//|                             Simple ATR System - ATR movement.mq5 |
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
   double PriceArray0[];
   double PriceArray1[];
   
   //sort price array from current data
   ArraySetAsSeries(PriceArray0,true);
   ArraySetAsSeries(PriceArray1,true);
   
   //define ATR
   int ATRDef=iATR(_Symbol,_Period,14); 
   
   //define data and store result
   CopyBuffer(ATRDef,0,0,3,PriceArray0);      
   CopyBuffer(ATRDef,0,0,3,PriceArray1);
   
   //get value of current data
   double ATRValue=NormalizeDouble(PriceArray0[0],5);
   double PreATRValue=NormalizeDouble(PriceArray1[1],5);

   if(ATRValue>PreATRValue)
   Comment("ATR is UP","\n","ATR Value = ",ATRValue,"\n","ATR Previous Value = ",PreATRValue);
   
   if(ATRValue<PreATRValue)
   Comment("ATR is Down","\n","ATR Value = ",ATRValue,"\n","ATR Previous Value = ",PreATRValue);
      
  }
//+------------------------------------------------------------------+
