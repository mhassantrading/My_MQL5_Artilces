//+------------------------------------------------------------------+
//|                                          Simple Envelopes EA.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   //Creating an array for price info
   MqlRates PriceInfo[];
   
   //Sorting it from current data to old data
   ArraySetAsSeries(PriceInfo, true);
   
   //Copy prices data to array
   int Data = CopyRates(Symbol(), Period (), 0, Bars(Symbol(), Period()), PriceInfo);
   
   //Creating two arrays for prices of upper and lower band
   double UpperBandArray[];
   double LowerBandArray[];
   
   //Identify Envelopes indicator
   int EnvelopesIdentify = iEnvelopes(_Symbol,_Period,14,0,MODE_SMA,PRICE_CLOSE,0.100);
   
   //Copying prices data to arrays
   CopyBuffer(EnvelopesIdentify,0,0,1,UpperBandArray);
   CopyBuffer(EnvelopesIdentify,1,0,1,LowerBandArray);
   
   //Calculation for the current data
   double UpperBandValue=NormalizeDouble(UpperBandArray[0],6);
   double LowerBandValue=NormalizeDouble(LowerBandArray[0],6);
   
   //Comments on the chart with values of Band of Envelopes
   Comment("Envelopes Upper Band =",UpperBandValue,"\n" "Envelopes Lower Band =",LowerBandValue,"\n");
   
  }
//+------------------------------------------------------------------+
