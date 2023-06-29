//+------------------------------------------------------------------+
//|                                      RVI Crossover - Uptrend.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double rviArray[];
   double rviSignalArray[];

   ArraySetAsSeries(rviArray,true);
   ArraySetAsSeries(rviSignalArray,true);

   int rviDef = iRVI(_Symbol,_Period,10);

   CopyBuffer(rviDef,0,0,3,rviArray);
   CopyBuffer(rviDef,1,0,3,rviSignalArray);

   double rviVal = NormalizeDouble(rviArray[0],3);
   double rviSignalVal = NormalizeDouble(rviSignalArray[0],3);

   if(rviVal>0 && rviSignalVal>0 && rviVal>rviSignalVal)
     {
      Comment("Buy Signal","\n",
              "Relative Vigor Index Value is ",rviVal,"\n",
              "RVI Signal Value is ",rviSignalVal);
     }
   if(rviVal<0 && rviSignalVal<0 && rviVal<rviSignalVal)
     {
      Comment("Close","\n",
              "Relative Vigor Index Value is ",rviVal,"\n",
              "RVI Signal Value is ",rviSignalVal);
     }


  }
//+------------------------------------------------------------------+
