//+------------------------------------------------------------------+
//|                       Simple Stochastic System - Lines Value.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//creating arrays for %K line and %D line   
   double Karray[];
   double Darray[];
   
//sorting arrays from the current data   
   ArraySetAsSeries(Karray, true);
   ArraySetAsSeries(Darray, true);

//defining the stochastic indicator   
   int StochDef = iStochastic(_Symbol,_Period,14,3,3,MODE_SMA,STO_LOWHIGH);

//filling arrays with price data   
   CopyBuffer(StochDef,0,0,3,Karray);
   CopyBuffer(StochDef,1,0,3,Darray);

//calculating value of %K and %D line of cuurent data  
   float KValue = Karray[0];
   float DValue = Darray[0];
   
//commenting calcualted values on the chart   
   Comment("%K value is ",KValue,"\n"
   "%D Value is ",DValue);
      
  }
//+------------------------------------------------------------------+