//+------------------------------------------------------------------+
//|                                 Chaikin Oscillator - Uptrend.mq5 |
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


   double currentHighVal=NormalizeDouble(priceArray[2].high,6);
   double prevHighVal=NormalizeDouble(priceArray[1].high,6);

   if(currentHighVal>prevHighVal&&chaiCurrentVal>chaiPrevVal)
     {
      Comment("Strong Up Move During The Uptrend","\n",
              "Current High Value is: ",currentHighVal,"\n",
              "Previous High Value is: ",prevHighVal,"\n",
              "Chaikin Oscillator Cuurent Value is ",chaiCurrentVal,"\n",
              "Chaikin Oscillator Previous Value is ",chaiPrevVal);
     }


   if(currentHighVal>prevHighVal&&chaiCurrentVal<chaiPrevVal)
     {
      Comment("Bearish Divergence","\n",
              "Current High Value is: ",currentHighVal,"\n",
              "Previous High Value is: ",prevHighVal,"\n",
              "Chaikin Oscillator Current Value is ",chaiCurrentVal,"\n",
              "Chaikin Oscillator Previous Value is ",chaiPrevVal);
     }

  }
//+------------------------------------------------------------------+
