//+------------------------------------------------------------------+
//|                                      MFI - Downtrend - Short.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//Create an array for MFI
   double MFIArray[];

//sorting the array from the current data
   ArraySetAsSeries(MFIArray,true);

//defining MFI
   int MFIDef=iMFI(_Symbol,_Period,24,VOLUME_TICK);

//filling the array
   CopyBuffer(MFIDef,0,0,3,MFIArray);

//calculating current MFI value
   double MFIValue=NormalizeDouble(MFIArray[0],5);


//Sell signal
   if(MFIValue>=50)
     {
      Comment("Sell signal");
     }

//TP
   if(MFIValue<=30)
     {
      Comment("Take profit");
     }
  }
//+------------------------------------------------------------------+
