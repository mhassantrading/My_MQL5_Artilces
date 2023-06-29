//+------------------------------------------------------------------+
//|                                                  MFI - OB&OS.mq5 |
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


//Conditions of OS&OS
//OS
   if(MFIValue<=20)
     {
      Comment("Oversold","\n","MFI value is : ",MFIValue);
     }

//OB
   if(MFIValue>=80)
     {
      Comment("Overbought","\n","MFI value is : ",MFIValue);
     }

//no signal
   if(MFIValue>20 && MFIValue<80)
     {
      Comment("MFI value is : ",MFIValue);
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
