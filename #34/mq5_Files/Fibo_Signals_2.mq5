//+------------------------------------------------------------------+
//|                                               Fibo Signals 2.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#define FIB_OBJ "Fibonacci Retracement"
#property script_show_inputs
input double fibRetracLvl = 38.2;
//+------------------------------------------------------------------+
void OnTick()
  {
   int highestCandle, lowestCandle;
   double high[],low[];
   ArraySetAsSeries(high,true);
   ArraySetAsSeries(low,true);
   CopyHigh(_Symbol,_Period,0,100,high);
   CopyLow(_Symbol,_Period,0,100,low);
   double openCandle = iOpen(_Symbol,_Period,100);
   double closeCandle = iClose(_Symbol,_Period,1);
   highestCandle=ArrayMaximum(high,0,100);
   lowestCandle=ArrayMinimum(low,0,100);
   MqlRates pArray[];
   ArraySetAsSeries(pArray,true);
   int pData=CopyRates(_Symbol,_Period,0,Bars(_Symbol,_Period),pArray);
   datetime dTlvl0 = ObjectGetInteger(0,"Fibonacci Retracement",OBJPROP_TIME,0);
   double PriceFibLvl00 = ObjectGetDouble(0,"Fibonacci Retracement",OBJPROP_PRICE,0);
   datetime dTlvl1 = ObjectGetInteger(0,"Fibonacci Retracement",OBJPROP_TIME,1);
   double PriceFibLvl0 = ObjectGetDouble(0,"Fibonacci Retracement",OBJPROP_PRICE,1);
   if
   (closeCandle>openCandle)
     {
      ObjectDelete(_Symbol, "Fibonacci Retracement");
      ObjectCreate(_Symbol, "Fibonacci Retracement",OBJ_FIBO,0,pArray[100].time,
                   pArray[lowestCandle].low,pArray[0].time,pArray[highestCandle].high);
      ObjectSetInteger(0,FIB_OBJ,OBJPROP_COLOR,clrGreen);
      for(int i = 0; i < ObjectGetInteger(0,FIB_OBJ,OBJPROP_LEVELS); i++)
        {
         ObjectSetInteger(0,FIB_OBJ,OBJPROP_LEVELCOLOR,i,clrGreen);
        }
      double pRange =  PriceFibLvl0 - PriceFibLvl00;
      double PriceFibLvl1 = NormalizeDouble(PriceFibLvl0 - pRange * 23.6/100,_Digits);
      double PriceFibLvl2 = NormalizeDouble(PriceFibLvl0 - pRange * 38.2/100,_Digits);
      double PriceFibLvl3 = NormalizeDouble(PriceFibLvl0 - pRange * 50/100,_Digits);
      double PriceFibLvl4 = NormalizeDouble(PriceFibLvl0 - pRange * 61.8/100,_Digits);
      double entryLvl = NormalizeDouble(PriceFibLvl0 - pRange * fibRetracLvl/100,_Digits);
      Comment("Array Open: ",openCandle,"\n",
              "Array Close: ",closeCandle,"\n",
              "Buy Entry Price: ",entryLvl);
     }
   else
     {
      ObjectDelete(_Symbol, "Fibonacci Retracement");
      ObjectCreate(_Symbol, "Fibonacci Retracement",OBJ_FIBO,0,pArray[100].time,
                   pArray[highestCandle].high,pArray[0].time,pArray[lowestCandle].low);
      ObjectSetInteger(0,FIB_OBJ,OBJPROP_COLOR,clrRed);
      for(int i = 0; i < ObjectGetInteger(0,FIB_OBJ,OBJPROP_LEVELS); i++)
        {
         ObjectSetInteger(0,FIB_OBJ,OBJPROP_LEVELCOLOR,i,clrRed);
        }
      double pRange =  PriceFibLvl00 - PriceFibLvl0;
      double PriceFibLvl1 = NormalizeDouble(PriceFibLvl0 + pRange * 23.6/100,_Digits);
      double PriceFibLvl2 = NormalizeDouble(PriceFibLvl0 + pRange * 38.2/100,_Digits);
      double PriceFibLvl3 = NormalizeDouble(PriceFibLvl0 + pRange * 50/100,_Digits);
      double PriceFibLvl4 = NormalizeDouble(PriceFibLvl0 + pRange * 61.8/100,_Digits);
      double entryLvl = NormalizeDouble(PriceFibLvl0 + pRange * fibRetracLvl/100,_Digits);
      Comment("Array Open: ",openCandle,"\n",
              "Array Close: ",closeCandle,"\n",
              "Sell Entry Price: ",entryLvl);
     }
  }
//+------------------------------------------------------------------+
