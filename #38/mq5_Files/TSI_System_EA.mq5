//+------------------------------------------------------------------+
//|                                                TSI System EA.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
input ENUM_MA_METHOD inpMAType = MODE_SMA; //Moving Average Type
input ENUM_APPLIED_PRICE inpPriceType = PRICE_CLOSE; //Price type
input int inpFastMAPeriod = 10; // Fast moving average period
input int inpSlowMAPeriod = 20; //Slow moving average period
int tsi;
double fastMAarray[], slowMAarray[];
int OnInit()
  {
   tsi=iCustom(_Symbol,_Period,"My Files\\TSI\\simpleTSI");
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("TSI System Removed");
  }
void OnTick()
  {
   double tsiVal[];
   CopyBuffer(tsi,0,0,1,tsiVal);
   int fastMA =iMA(_Symbol,_Period,inpFastMAPeriod,0,inpMAType,inpPriceType);
   int slowMA =iMA(_Symbol,_Period,inpSlowMAPeriod,0,inpMAType,inpPriceType);
   ArraySetAsSeries(fastMAarray,true);
   ArraySetAsSeries(slowMAarray,true);
   CopyBuffer(fastMA,0,0,3,fastMAarray);
   CopyBuffer(slowMA,0,0,3,slowMAarray);
   if(fastMAarray[1]<slowMAarray[1]&&fastMAarray[0]>slowMAarray[0])
     {
      if(tsiVal[0]>0)
        {

         Comment("Buy Signal",
                 "\nTSI Value ",DoubleToString(tsiVal[0],_Digits),
                 "\nfastMA ",DoubleToString(fastMAarray[0],_Digits),
                 "\nslowMA ",DoubleToString(slowMAarray[0],_Digits));
        }
     }
   if(fastMAarray[1]>slowMAarray[1]&&fastMAarray[0]<slowMAarray[0]&&tsiVal[0]<0)
     {
      if(tsiVal[0]<0)
        {
         Comment("Sell Signal",
                 "\nTSI Value ",DoubleToString(tsiVal[0],_Digits),
                 "\nfastMA ",DoubleToString(fastMAarray[0],_Digits),
                 "\nslowMA ",DoubleToString(slowMAarray[0],_Digits));
        }
     }
  }