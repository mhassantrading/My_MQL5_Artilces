//+------------------------------------------------------------------+
//|                    Parabolic SAR System - Downtrend Strategy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {  
   //create an string variable for signal
   string signal="";
   
   //create a price array
   MqlRates PriceArray[];
   
   //sort array from the current data
   ArraySetAsSeries(PriceArray,true);
   
   //fill array with price data
   int Data=CopyRates(_Symbol,_Period,0,3,PriceArray);
   
   //create a SAR array
   double SARArray[];
   
   //define SAR EA
   int SARDef=iSAR(_Symbol,_Period,0.02,0.2);
   
   //sort array from current data
   ArraySetAsSeries(SARArray,true);
   
   //fill SARArray with SARDef 
   CopyBuffer(SARDef,0,0,3,SARArray);
   
   //calculate value of last data
   double SARValue=NormalizeDouble(SARArray[0],5);
   
   //buy signal
   //if current SAR value below candle 1 low
   if(SARValue > PriceArray[1].high)
   {
      signal="Sell";
   }
   
   //take profit signal
   //if current SAR value above candle 1 high
   if(SARValue < PriceArray[1].low)
   {
      signal="Take Profit";
   }
   
   //chart comment with the signal
   Comment("The signal is ",signal);
  }
//+------------------------------------------------------------------+
