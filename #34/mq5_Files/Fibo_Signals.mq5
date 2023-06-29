//+------------------------------------------------------------------+
//|                                         Simple Fibo System#2.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#define FIB_OBJ "Fibonacci Retracement"
#property script_show_inputs
input double fibRetracLvl = 38.2;
int barsTotal;
//+------------------------------------------------------------------+
void OnTick()
  {

   int bars = iBars(_Symbol, PERIOD_D1);
   if(barsTotal != bars  && TimeCurrent() > StringToTime("00:05"))
     {
      barsTotal=bars;
      ObjectDelete(0,FIB_OBJ);
      double open = iOpen(_Symbol,PERIOD_D1,1);
      double close = iClose(_Symbol,PERIOD_D1,1);
      double closeCandle = iClose(_Symbol,_Period,1);
      double high = iHigh(_Symbol,PERIOD_D1,1);
      double low = iLow(_Symbol,PERIOD_D1,1);
      datetime startingTime = iTime(_Symbol,PERIOD_D1,1);
      datetime endingTime = iTime(_Symbol,PERIOD_D1,0)-1;
      if(close>open)
        {
         ObjectCreate(0,FIB_OBJ,OBJ_FIBO,0,startingTime,low,endingTime,high);
         ObjectSetInteger(0,FIB_OBJ,OBJPROP_COLOR,clrGreen);
         for(int i = 0; i < ObjectGetInteger(0,FIB_OBJ,OBJPROP_LEVELS); i++)
           {
            ObjectSetInteger(0,FIB_OBJ,OBJPROP_LEVELCOLOR,i,clrGreen);
           }
         double fibRetracLvl1 = NormalizeDouble(high - (high-low) * 23.6 / 100,_Digits);
         double fibRetracLvl2 = NormalizeDouble(high - (high-low) * 38.2 / 100,_Digits);
         double fibRetracLvl3 = NormalizeDouble(high - (high-low) * 50 / 100,_Digits);
         double fibRetracLvl4 = NormalizeDouble(high - (high-low) * 61.8 / 100,_Digits);
         double fibRetracLvl5 = NormalizeDouble(high - (high-low) * 100 / 100,_Digits);
         double entryLvl = NormalizeDouble(high - (high-low) * fibRetracLvl /100,_Digits);
         Comment("Last Day Open = ",open,"\n",
                 "Last Day Close = ",close,"\n",
                 "Buy Entry Price: ",entryLvl);
        }
      else
        {
         ObjectCreate(0,FIB_OBJ,OBJ_FIBO,0,startingTime,high,endingTime,low);
         ObjectSetInteger(0,FIB_OBJ,OBJPROP_COLOR,clrRed);
         for(int i = 0; i < ObjectGetInteger(0,FIB_OBJ,OBJPROP_LEVELS); i++)
           {
            ObjectSetInteger(0,FIB_OBJ,OBJPROP_LEVELCOLOR,i,clrRed);
           }
         double fibRetracLvl1 = NormalizeDouble(low + (high-low) * 23.6 / 100,_Digits);
         double fibRetracLvl2 = NormalizeDouble(low + (high-low) * 38.2 / 100,_Digits);
         double fibRetracLvl3 = NormalizeDouble(low + (high-low) * 50 / 100,_Digits);
         double fibRetracLvl4 = NormalizeDouble(low + (high-low) * 61.8 / 100,_Digits);
         double fibRetracLvl5 = NormalizeDouble(low + (high-low) * 100 / 100,_Digits);
         double entryLvl = NormalizeDouble(low + (high-low) * fibRetracLvl /100,_Digits);
           {
            Comment("Last Day Open = ",open,"\n",
                    "Last Day Close = ",close,"\n",
                    "Sell Entry Price: ",entryLvl);
           }
        }
     }
  }
//+------------------------------------------------------------------+
