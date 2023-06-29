//+------------------------------------------------------------------+
//|                               Chaikin Oscillator - Downtrend.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double chaiArray[];
   MqlRates priceArray[];

   ArraySetAsSeries(chaiArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);

   int chaiDef = iChaikin(_Symbol,_Period,3,10,MODE_EMA,VOLUME_TICK);

   CopyBuffer(chaiDef,0,0,3,chaiArray);

   int chaiCurrentVal = NormalizeDouble(chaiArray[0],6);
   int chaiPrevVal = NormalizeDouble(chaiArray[1],6);


   double currentLowVal=NormalizeDouble(priceArray[2].low,6);
   double prevLowVal=NormalizeDouble(priceArray[1].low,6);

   if(currentLowVal<prevLowVal&&chaiCurrentVal<chaiPrevVal)
     {
      Comment("Strong Down Move During The Downtrend","\n",
              "Current Low Value is: ",currentLowVal,"\n",
              "Previous Low Value is: ",prevLowVal,"\n",
              "Chaikin Oscillator Cuurent Value is ",chaiCurrentVal,"\n",
              "Chaikin Oscillator Previous Value is ",chaiPrevVal);
     }


   if(currentLowVal<prevLowVal&&chaiCurrentVal>chaiPrevVal)
     {
      Comment("Bullish Divergence","\n",
              "Current Low Value is: ",currentLowVal,"\n",
              "Previous Low Value is: ",prevLowVal,"\n",
              "Chaikin Oscillator Current Value is ",chaiCurrentVal,"\n",
              "Chaikin Oscillator Previous Value is ",chaiPrevVal);
     }

  }
//+------------------------------------------------------------------+
