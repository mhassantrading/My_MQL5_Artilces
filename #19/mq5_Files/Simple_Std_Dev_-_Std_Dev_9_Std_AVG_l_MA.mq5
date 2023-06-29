//+------------------------------------------------------------------+
//|                  Simple Std Dev - Std Dev & AVG Std Dev & MA.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);

   double StdDevArray[];
   double PArray[];

   ArraySetAsSeries(StdDevArray,true);
   ArraySetAsSeries(PArray,true);

   int StdDevDef = iStdDev(_Symbol,_Period,20,0,MODE_SMA,PRICE_CLOSE);
   int MADef = iMA(_Symbol,_Period,10,0,MODE_SMA,PRICE_CLOSE);

   CopyBuffer(StdDevDef,0,0,6,StdDevArray);
   CopyBuffer(MADef,0,0,10,PArray);

   double StdDevVal = NormalizeDouble(StdDevArray[0],6);
   double StdDevVal1 = NormalizeDouble(StdDevArray[1],6);
   double StdDevVal2 = NormalizeDouble(StdDevArray[2],6);
   double StdDevVal3 = NormalizeDouble(StdDevArray[3],6);
   double StdDevVal4 = NormalizeDouble(StdDevArray[4],6);
   double StdDevVal5 = NormalizeDouble(StdDevArray[5],6);
   double StdDevAVGVal = ((StdDevVal1+StdDevVal2+StdDevVal3+StdDevVal4+StdDevVal5)/5);
   double MAValue = NormalizeDouble(PArray[0],6);

   if(StdDevVal>StdDevAVGVal&&Ask>MAValue)
     {
      Comment("Buy signal","\n",
              "Current Std Dev value is ",StdDevVal,"\n",
              "Std Dev Avg value is ",StdDevAVGVal,"\n",
              "Ask value is ",Ask,"\n",
              "MA value is ",MAValue);
     }

   if(StdDevVal>StdDevAVGVal&&Bid<MAValue)
     {
      Comment("Sell signal","\n",
              "Current Std Dev value is ",StdDevVal,"\n",
              "Std Dev Avg value is ",StdDevAVGVal,"\n",
              "Bid value is ",Bid,"\n",
              "MA value is ",MAValue);
     }

  }

//+------------------------------------------------------------------+
