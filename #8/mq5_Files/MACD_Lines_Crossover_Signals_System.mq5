//+------------------------------------------------------------------+
//|                          MACD Lines Crossover Signals System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //cretaing an array for prices for MACD main line, MACD signal line
   double MACDMainLine[];
   double MACDSignalLine[];
   
   //Defining MACD and its parameters
   int MACDDef = iMACD(_Symbol,_Period,12,26,9,PRICE_CLOSE);
   
   //Sorting price array from current data for MACD main line, MACD signal line
   ArraySetAsSeries(MACDMainLine,true);
   ArraySetAsSeries(MACDSignalLine,true);
   
   //Storing results after defining MA, line, current data for MACD main line, MACD signal line
   CopyBuffer(MACDDef,0,0,3,MACDMainLine);
   CopyBuffer(MACDDef,1,0,3,MACDSignalLine);
   
   //Get values of current data for MACD main line, MACD signal line
   float MACDMainLineVal = (MACDMainLine[0]);
   float MACDSignalLineVal = (MACDSignalLine[0]);
   
   
   //Commenting on the chart the value of MACD
   if (MACDMainLineVal>MACDSignalLineVal)
   Comment("Buying Signal As MACD MainLine is Above MACD SignalLine","\n"
   "MACD Main Line Value is ",MACDMainLineVal,"\n" 
   "MACD Signal Line Value is ",MACDSignalLineVal);
   
   if (MACDMainLineVal<MACDSignalLineVal)
   Comment("Shorting Signal As MACD MainLine is Below MACD SignalLine","\n"
   "MACD Main Line Value is ",MACDMainLineVal,"\n" 
   "MACD Signal Line Value is ",MACDSignalLineVal);
  }
//+------------------------------------------------------------------+
