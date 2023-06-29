//+------------------------------------------------------------------+
//|                                         Williams%R - OB & OS.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double WPArray[];
   
   ArraySetAsSeries(WPArray,true);
   
   int WPDef = iWPR(_Symbol,_Period,14);
   
   CopyBuffer(WPDef,0,0,3,WPArray);
   
   double WPVal = NormalizeDouble(WPArray[0],2);
   
   if(WPVal<-80)
   {
      Comment("Over Sold");
   }
   
   if(WPVal>-20)
   {
      Comment("Over Bought");
   }
   
  }
//+------------------------------------------------------------------+
