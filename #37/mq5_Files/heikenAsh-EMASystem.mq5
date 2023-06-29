//+------------------------------------------------------------------+
//|                                          heikenAsh-EMASystem.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
input int fastEMASmoothing=9; // Fast EMA Period
input int slowEMASmoothing=18; // Slow EMA Period
int heikenAshi;
double fastEMAarray[], slowEMAarray[];
int OnInit()
  {
   heikenAshi=iCustom(_Symbol,_Period,"My Files\\Heiken Ashi\\simpleHeikenAshi");
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("Heiken Ashi-EMA System Removed");
  }
void OnTick()
  {
   double heikenAshiOpen[], heikenAshiHigh[], heikenAshiLow[], heikenAshiClose[];
   CopyBuffer(heikenAshi,0,0,3,heikenAshiOpen);
   CopyBuffer(heikenAshi,1,0,3,heikenAshiHigh);
   CopyBuffer(heikenAshi,2,0,3,heikenAshiLow);
   CopyBuffer(heikenAshi,3,0,3,heikenAshiClose);
   int fastEMA = iMA(_Symbol,_Period,fastEMASmoothing,0,MODE_SMA,PRICE_CLOSE);
   int slowEMA = iMA(_Symbol,_Period,slowEMASmoothing,0,MODE_SMA,PRICE_CLOSE);
   ArraySetAsSeries(fastEMAarray,true);
   ArraySetAsSeries(slowEMAarray,true);
   CopyBuffer(fastEMA,0,0,3,fastEMAarray);
   CopyBuffer(slowEMA,0,0,3,slowEMAarray);
   if(heikenAshiClose[1]>fastEMAarray[1])
     {
      if(fastEMAarray[0]>slowEMAarray[0])
        {
         Comment("Buy Signal",
                 "\nfastEMA ",DoubleToString(fastEMAarray[0],_Digits),
                 "\nslowEMA ",DoubleToString(slowEMAarray[0],_Digits),
                 "\nprevFastEMA ",DoubleToString(fastEMAarray[1],_Digits),
                 "\nprevHeikenAshiClose ",DoubleToString(heikenAshiClose[0],_Digits));
        }
     }
   if(heikenAshiClose[1]<fastEMAarray[1])
     {
      if(fastEMAarray[0]<slowEMAarray[0])
        {
         Comment("Sell Signal",
                 "\nfastEMA ",DoubleToString(fastEMAarray[0],_Digits),
                 "\nslowEMA ",DoubleToString(slowEMAarray[0],_Digits),
                 "\nprevFastEMA ",DoubleToString(fastEMAarray[1],_Digits),
                 "\nheikenAshiClose ",DoubleToString(heikenAshiClose[0],_Digits));
        }
     }
  }