//+------------------------------------------------------------------+
//|                                     BW MFI - Movement Status.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
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
   if(BWMFIVal>BWMFIVal1&&volVal>volVal1)
     {
      Comment("Green State - Green Bar");
     }
   if(BWMFIVal<BWMFIVal1&&volVal<volVal1)
     {
      Comment("Fade State - Brown Bar");
     }
   if(BWMFIVal>BWMFIVal1&&volVal<volVal1)
     {
      Comment("Fake State - Blue Bar");
     }
   if(BWMFIVal<BWMFIVal1&&volVal>volVal1)
     {
      Comment("Squat State - Pink Bar");
     }
  }
//+------------------------------------------------------------------+
