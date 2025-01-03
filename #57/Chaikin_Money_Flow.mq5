//+------------------------------------------------------------------+
//|                                           Chaikin_Money_Flow.mq5 |
//+------------------------------------------------------------------+
#property description "Chaikin Money Flow"
#property indicator_separate_window
#property indicator_buffers 4
#property indicator_plots   1
#property indicator_width1  3
#property indicator_level1  0
#property indicator_level2  0.20
#property indicator_level3  -0.20
#property indicator_levelstyle STYLE_DOT
#property indicator_levelwidth 0
#property indicator_levelcolor clrBlack
#property indicator_type1   DRAW_HISTOGRAM
#property indicator_color1  clrBlue
input int                 periods=20; // Periods
input ENUM_APPLIED_VOLUME volumeTypeInp=VOLUME_TICK;  // Volume Type
double                    cmfBuffer[];
void OnInit()
{
   SetIndexBuffer(0,cmfBuffer,INDICATOR_DATA);
   IndicatorSetInteger(INDICATOR_DIGITS,5);
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,0);
   IndicatorSetString(INDICATOR_SHORTNAME,"Chaikin Money Flow("+string(periods)+")");
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
   if(rates_total<periods)
      return(0);
   int initPos = prev_calculated -1;
   if(initPos<0) initPos = 0;
   if(volumeTypeInp==VOLUME_TICK)
   {
      for(int pos = initPos;pos<=rates_total-periods;pos++)
      {
         double sumAccDis = 0;
         long sumVol = 0;
         
         for(int i = 0; i < periods && !IsStopped(); ++i)
         {
            long thisTickVolume = tick_volume[pos+i];
            sumVol += thisTickVolume;
            sumAccDis += AccDis(high[pos+i], low[pos+i], close[pos+i], thisTickVolume);
         }
         cmfBuffer[pos+periods-1] = sumAccDis/sumVol;
      }
   }
   else
   {
      for(int pos = initPos;pos<=rates_total-periods;pos++)
      {
         double sumAccDis = 0;
         long sumVol = 0;
         
         for(int i = 0; i < periods && !IsStopped(); ++i)
         {
            long thisTickVolume = volume[pos+i];
            sumVol += thisTickVolume;
            sumAccDis += AccDis(high[pos+i], low[pos+i], close[pos+i], thisTickVolume);
         }
         
         cmfBuffer[pos+periods-1] = sumAccDis/sumVol;
      }
   }
   return (rates_total-periods-10);
}
double AccDis(double high,double low,double close,long volume)
{
   double res=0;
   
   if(high!=low)
      res=(2*close-high-low)/(high-low)*volume;
   
   return(res);
}
