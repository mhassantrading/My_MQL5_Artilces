//+------------------------------------------------------------------+
//|                                                    customDPO.mq5 |
//+------------------------------------------------------------------+
#property description "Custom Detrended Price Oscillator"
#include <MovingAverages.mqh>
#property indicator_separate_window
#property indicator_buffers 2
#property indicator_plots   1
#property indicator_label1 "DPO"
#property indicator_type1   DRAW_HISTOGRAM
#property indicator_color1  clrRoyalBlue
#property indicator_width1  2
#property indicator_level1 0
input int detrendPeriodInp=20; // Period
double    dpoBuffer[];
double    maBuffer[];
int       maPeriod;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
void OnInit()
  {
   maPeriod=detrendPeriodInp/2+1;
   SetIndexBuffer(0,dpoBuffer,INDICATOR_DATA);
   SetIndexBuffer(1,maBuffer,INDICATOR_CALCULATIONS);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits+1);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,maPeriod-1);
   string indShortName=StringFormat("Custom DPO(%d)",detrendPeriodInp);
   IndicatorSetString(INDICATOR_SHORTNAME,indShortName);
  }
//+------------------------------------------------------------------+
//| Detrended Price Oscillator                                       |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const int begin,
                const double &price[])
  {
   int start;
   int index1=begin+maPeriod-1;
   if(prev_calculated<index1)
     {
      ArrayInitialize(dpoBuffer,0.0);
      start=index1;
      if(begin>0)
         PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,index1);
     }
   else
      start=prev_calculated-1;
   SimpleMAOnBuffer(rates_total,prev_calculated,begin,maPeriod,price,maBuffer);
   for(int i=start; i<rates_total && !IsStopped(); i++)
      dpoBuffer[i]=price[i]-maBuffer[i];
   return(rates_total);
  }
//+------------------------------------------------------------------+
