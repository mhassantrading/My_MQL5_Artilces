//+------------------------------------------------------------------+
//|                                               BW MFI Signals.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
void OnTick()
  {
   double BWMFIArray[];
   double volArray[];
   ArraySetAsSeries(BWMFIArray,true);
   ArraySetAsSeries(volArray,true);
   int BWMFIDef=iBWMFI(_Symbol,_Period,VOLUME_TICK);
   int volDef=iVolumes(_Symbol,_Period,VOLUME_TICK);
   CopyBuffer(BWMFIDef,0,0,3,BWMFIArray);
   CopyBuffer(volDef,0,0,3,volArray);
   double BWMFIVal=NormalizeDouble(BWMFIArray[0],5);
   double BWMFIVal1=NormalizeDouble(BWMFIArray[1],5);
   double volVal=NormalizeDouble(volArray[0],5);
   double volVal1=NormalizeDouble(volArray[1],5);
   bool greenState = BWMFIVal>BWMFIVal1&&volVal>volVal1;
   bool fadeState = BWMFIVal<BWMFIVal1&&volVal<volVal1;
   bool fakeState = BWMFIVal>BWMFIVal1&&volVal<volVal1;
   bool squatState = BWMFIVal<BWMFIVal1&&volVal>volVal1;
   
   if(greenState)
     {
      Comment("Find a good entry");
     }
   if(fadeState)
     {
      Comment("Find a good exit");
     }
   if(fakeState)
     {
      Comment("False breakout Probability");
     }
   if(squatState)
     {
      Comment("Market is Balanced");
     }
  }
//+------------------------------------------------------------------+
