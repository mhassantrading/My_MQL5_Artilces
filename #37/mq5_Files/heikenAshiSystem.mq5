//+------------------------------------------------------------------+
//|                                             heikenAshiSystem.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
int heikenAshi;
int OnInit()
  {
   heikenAshi=iCustom(_Symbol,_Period,"My Files\\Heiken Ashi\\simpleHeikenAshi");
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("Heiken Ashi System Removed");
  }
void OnTick()
  {
   double heikenAshiOpen[], heikenAshiHigh[], heikenAshiLow[], heikenAshiClose[];
   CopyBuffer(heikenAshi,0,0,1,heikenAshiOpen);
   CopyBuffer(heikenAshi,1,0,1,heikenAshiHigh);
   CopyBuffer(heikenAshi,2,0,1,heikenAshiLow);
   CopyBuffer(heikenAshi,3,0,1,heikenAshiClose);
   Comment("heikenAshiOpen ",DoubleToString(heikenAshiOpen[0],_Digits),
           "\n heikenAshiHigh ",DoubleToString(heikenAshiHigh[0],_Digits),
           "\n heikenAshiLow ",DoubleToString(heikenAshiLow[0],_Digits),
           "\n heikenAshiClose ",DoubleToString(heikenAshiClose[0],_Digits));
  }