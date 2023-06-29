//+------------------------------------------------------------------+
//|          Simple Stochastic System - Sideways - Sell Strategy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   string signal="";
   
   double Karray[];
   double Darray[];
   
   ArraySetAsSeries(Karray, true);
   ArraySetAsSeries(Darray, true);
   
   int StochDef = iStochastic(_Symbol,_Period,5,3,3,MODE_SMA,STO_LOWHIGH);
   
   CopyBuffer(StochDef,0,0,3,Karray);
   CopyBuffer(StochDef,1,0,3,Darray);
   
   double KValue0 = Karray[0];
   double DValue0 = Darray[0];
   
   double KValue1 = Karray[1];
   double DValue1 = Darray[1];  
   
    if (KValue0>80&&DValue0>80)
      if ((KValue0<DValue0) && (KValue1>DValue1))
      {
         signal = "SELL";
      }
      
   Comment("SSS - Sideways - Sell Strategy - Signal is ",signal);  
   
   if (KValue0<20&&DValue0<20)
      if ((KValue0>DValue0) && (KValue1<DValue1))
      {
         signal = "TAKE PROFIT";
      }         
   Comment("SSS - Sideways - Sell Strategy - Signal is ",signal);  
  }
//+------------------------------------------------------------------+

