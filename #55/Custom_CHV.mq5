//+------------------------------------------------------------------+
//|                                           Chaikin Volatility.mq5 |
//+------------------------------------------------------------------+
#include <MovingAverages.mqh>
#property description "Chaikin Volatility"
#property indicator_separate_window
#property indicator_buffers 3
#property indicator_plots   1
#property indicator_type1   DRAW_HISTOGRAM
#property indicator_color1  MediumBlue
#property indicator_width1  3
enum smoothMode
  {
   SMA=0,// Simple MA
   EMA=1 // Exponential MA
  };
input int          smoothPeriodInp=10;  // Smoothing Period
input int          chvPeriodInp=10;     // Chaikin Volatility Period
input smoothMode smoothTypeInp=EMA;   // Smoothing Mode
double             chvBuffer[];
double             hlBuffer[];
double             shlBuffer[];
int                smoothPeriod,chvPeriod;
void OnInit()
  {
   string maName;
   if(smoothTypeInp==SMA)
      maName="SMA";
   else
      maName="EMA";
   if(smoothPeriodInp<=0)
     {
      smoothPeriod=10;
      printf("Incorrect value for Smoothing Period input = %d. Default value = %d.",smoothPeriodInp,smoothPeriod);
     }
   else
      smoothPeriod=smoothPeriodInp;
   if(chvPeriodInp<=0)
     {
      chvPeriod=10;
      printf("Incorrect value for Chaikin Volatility Period input = %d. Default value = %d.",chvPeriodInp,chvPeriod);
     }
   else
      chvPeriod=chvPeriodInp;
   SetIndexBuffer(0,chvBuffer);
   SetIndexBuffer(1,hlBuffer,INDICATOR_CALCULATIONS);
   SetIndexBuffer(2,shlBuffer,INDICATOR_CALCULATIONS);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,smoothPeriod+chvPeriod-1);
   PlotIndexSetString(0,PLOT_LABEL,"CHV("+string(smoothPeriod)+","+maName+")");
   IndicatorSetString(INDICATOR_SHORTNAME,"Chaikin Volatility("+string(smoothPeriod)+","+maName+")");
   IndicatorSetInteger(INDICATOR_DIGITS,1);
  }
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &Time[],
                const double &Open[],
                const double &High[],
                const double &Low[],
                const double &Close[],
                const long &TickVolume[],
                const long &Volume[],
                const int &Spread[])
  {
   int    i,pos,posCHV;
   posCHV=chvPeriod+smoothPeriod-2;
   if(rates_total<posCHV)
      return(0);
   if(prev_calculated<1)
      pos=0;
   else
      pos=prev_calculated-1;
   for(i=pos;i<rates_total && !IsStopped();i++)
     {
      hlBuffer[i]=High[i]-Low[i];
     }
   if(pos<smoothPeriod-1)
     {
      pos=smoothPeriod-1;
      for(i=0;i<pos;i++)
        {
         shlBuffer[i]=0.0;
        }
     }
   if(smoothTypeInp==SMA)
     {
      SimpleMAOnBuffer(rates_total,prev_calculated,0,smoothPeriod,hlBuffer,shlBuffer);
     }
   else
      ExponentialMAOnBuffer(rates_total,prev_calculated,0,smoothPeriod,hlBuffer,shlBuffer);
   if(pos<posCHV)
     {
      pos=posCHV;
     }
   for(i=pos;i<rates_total && !IsStopped();i++)
     {
      if(shlBuffer[i-chvPeriod]!=0.0)
         chvBuffer[i]=100.0*(shlBuffer[i]-shlBuffer[i-chvPeriod])/shlBuffer[i-chvPeriod];
      else
         chvBuffer[i]=0.0;
     }
   return(rates_total);
  }
