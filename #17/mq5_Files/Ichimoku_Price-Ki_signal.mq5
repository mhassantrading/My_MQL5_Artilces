//+------------------------------------------------------------------+
//|                                     Ichimoku Price-Ki signal.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <Indicators/Trend.mqh>
CiIchimoku*Ichimoku;
//+------------------------------------------------------------------+
void OnInit()
  {
   Ichimoku = new CiIchimoku();
   Ichimoku.Create(_Symbol,PERIOD_CURRENT,9,26,52);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   MqlRates PArray[];

   int Data=CopyRates(_Symbol,_Period,0,1,PArray);

   Ichimoku.Refresh(-1);
   double TenkanVal= Ichimoku.TenkanSen(0);
   double KijunVal= Ichimoku.KijunSen(0);
   double SpanAVal= Ichimoku.SenkouSpanA(-26);
   double SpanBVal= Ichimoku.SenkouSpanB(-26);
   double ChikouVal= Ichimoku.ChinkouSpan(26);

   if(PArray[0].close>KijunVal)
     {
      Comment("Bullish signal","\n",
              "Close Value is: ",PArray[0].close,"\n",
              "Kaijun Sen Value is: ",KijunVal,"\n");
     }

   if(PArray[0].close<KijunVal)
     {
      Comment("Bearish signal","\n",
              "Close Value is: ",PArray[0].close,"\n",
              "Kaijun Sen Value is: ",KijunVal,"\n");
     }
  }
//+------------------------------------------------------------------+