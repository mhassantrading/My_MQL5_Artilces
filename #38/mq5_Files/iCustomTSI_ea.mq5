//+------------------------------------------------------------------+
//|                                           customSimpleTSI-EA.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
int TSI;
int OnInit()
  {
   TSI=iCustom(_Symbol,_Period,"My Files\\TSI\\simpleTSI");
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("TSI System Removed");
  }
void OnTick()
  {
   double tsiVal[];
   CopyBuffer(TSI,0,0,1,tsiVal);
   Comment("TSI Value ",DoubleToString(tsiVal[0],_Digits));
  }