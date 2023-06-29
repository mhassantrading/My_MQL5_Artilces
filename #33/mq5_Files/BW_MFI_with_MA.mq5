//+------------------------------------------------------------------+
//|                                               BW MFI with MA.mq5 |
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
   double maArray[];
   MqlRates pArray[];
   ArraySetAsSeries(BWMFIArray,true);
   ArraySetAsSeries(volArray,true);
   ArraySetAsSeries(maArray,true);
   int BWMFIDef=iBWMFI(_Symbol,_Period,VOLUME_TICK);
   int volDef=iVolumes(_Symbol,_Period,VOLUME_TICK);
   int maDef=iMA(_Symbol,_Period,10,0,MODE_SMA,PRICE_CLOSE);
   int data=CopyRates(_Symbol,_Period,0,10,pArray);
   CopyBuffer(BWMFIDef,0,0,3,BWMFIArray);
   CopyBuffer(volDef,0,0,3,volArray);
   CopyBuffer(maDef,0,0,3,maArray);
   double BWMFIVal=NormalizeDouble(BWMFIArray[0],5);
   double BWMFIVal1=NormalizeDouble(BWMFIArray[1],5);
   double volVal=NormalizeDouble(volArray[0],5);
   double volVal1=NormalizeDouble(volArray[1],5);
   double maVal=NormalizeDouble(maArray[0],5);
   double closingPrice=pArray[0].close;
   bool greenState = BWMFIVal>BWMFIVal1&&volVal>volVal1;
   bool fadeState = BWMFIVal<BWMFIVal1&&volVal<volVal1;
   bool fakeState = BWMFIVal>BWMFIVal1&&volVal<volVal1;
   bool squatState = BWMFIVal<BWMFIVal1&&volVal>volVal1;
   if(closingPrice>maVal&&greenState)
     {
      Comment("Buy Signal");
     }
   else
      if(closingPrice<maVal&&greenState)
        {
         Comment("Sell signal");
        }
      else
         Comment("");
  }
//+------------------------------------------------------------------+
