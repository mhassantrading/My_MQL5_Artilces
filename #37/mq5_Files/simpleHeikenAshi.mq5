//+------------------------------------------------------------------+
//|                                             simpleHeikenAshi.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_separate_window
#property indicator_buffers 5
#property indicator_plots   1
#property indicator_type1   DRAW_COLOR_CANDLES
#property indicator_color1  clrBlue, clrRed
#property indicator_width1  2
#property indicator_label1  "Heiken Ashi Open;Heiken Ashi High;Heiken Ashi Low;Heiken Ashi Close"
double haOpen[];
double haHigh[];
double haLow[];
double haClose[];
double haColor[];
int OnInit()
  {
   SetIndexBuffer(0,haOpen,INDICATOR_DATA);
   SetIndexBuffer(1,haHigh,INDICATOR_DATA);
   SetIndexBuffer(2,haLow,INDICATOR_DATA);
   SetIndexBuffer(3,haClose,INDICATOR_DATA);
   SetIndexBuffer(4,haColor,INDICATOR_COLOR_INDEX);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   IndicatorSetString(INDICATOR_SHORTNAME,"Simple Heiken Ashi");
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0.0);
   return(INIT_SUCCEEDED);
  }
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   int start;
   if(prev_calculated==0)
     {
      haLow[0]=low[0];
      haHigh[0]=high[0];
      haOpen[0]=open[0];
      haClose[0]=close[0];
      start=1;
     }
   else
      start=prev_calculated-1;
   for(int i=start; i<rates_total && !IsStopped(); i++)
     {
      double haOpenVal =(haOpen[i-1]+haClose[i-1])/2;
      double haCloseVal=(open[i]+high[i]+low[i]+close[i])/4;
      double haHighVal =MathMax(high[i],MathMax(haOpenVal,haCloseVal));
      double haLowVal  =MathMin(low[i],MathMin(haOpenVal,haCloseVal));

      haLow[i]=haLowVal;
      haHigh[i]=haHighVal;
      haOpen[i]=haOpenVal;
      haClose[i]=haCloseVal;
      if(haOpenVal<haCloseVal)
         haColor[i]=0.0;
      else
         haColor[i]=1.0;
     }
   return(rates_total);
  }