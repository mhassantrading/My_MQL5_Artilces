//+------------------------------------------------------------------+
//|                                       Custom_Keltner_Channel.mq5 |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 3
#property indicator_plots 3
#property indicator_type1 DRAW_LINE
#property indicator_style1 STYLE_SOLID
#property indicator_width1 2
#property indicator_color1 clrRed
#property indicator_label1 "Keltner Upper Band"
#property indicator_type2 DRAW_LINE
#property indicator_style2 STYLE_SOLID
#property indicator_width2 1
#property indicator_color2 clrBlue
#property indicator_label2 "Keltner Middle Line"
#property indicator_type3 DRAW_LINE
#property indicator_style3 STYLE_SOLID
#property indicator_width3 2
#property indicator_color3 clrGreen
#property indicator_label3 "Keltner Lower Band"
input int      maPeriod            = 10;           // Moving Average Period
input double   multiInp             = 2.0;          // Channel multiplier
input bool     isAtr                 = false;        // ATR
input ENUM_MA_METHOD     maMode       = MODE_EMA;     // Moving Average Mode
input ENUM_APPLIED_PRICE priceType = PRICE_TYPICAL;// Price Type
double upper[], middle[], lower[];
int maHandle, atrHandle;
static int minBars = maPeriod + 1;
//+------------------------------------------------------------------+
int OnInit()
  {
   SetIndexBuffer(0,upper, INDICATOR_DATA);
   SetIndexBuffer(1,middle, INDICATOR_DATA);
   SetIndexBuffer(2,lower, INDICATOR_DATA);
   ArraySetAsSeries(upper, true);
   ArraySetAsSeries(middle, true);
   ArraySetAsSeries(lower, true);
   IndicatorSetString(INDICATOR_SHORTNAME,"Custom Keltner Channel " + IntegerToString(maPeriod));
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   maHandle = iMA(NULL, 0, maPeriod, 0, maMode, priceType);
   if(isAtr)
     {
      atrHandle = iATR(NULL, 0, maPeriod);
      if(atrHandle == INVALID_HANDLE)
        {
         Print("Handle Error");
         return(INIT_FAILED);
        }
     }
   else
      atrHandle = INVALID_HANDLE;
   return INIT_SUCCEEDED;
  }
void indValue(const double& h[], const double& l[], int shift)
  {
   double ma[1];
   if(CopyBuffer(maHandle, 0, shift, 1, ma) <= 0)
      return;
   middle[shift] = ma[0];
   double average = AVG(h, l, shift);
   upper[shift]    = middle[shift] + average * multiInp;
   lower[shift] = middle[shift] - average * multiInp;
  }
double AVG(const double& High[],const double& Low[], int shift)
  {
   double sum = 0.0;
   if(atrHandle == INVALID_HANDLE)
     {
      for(int i = shift; i < shift + maPeriod; i++)
         sum += High[i] - Low[i];
     }
   else
     {
      double t[];
      ArrayResize(t, maPeriod);
      ArrayInitialize(t, 0);
      if(CopyBuffer(atrHandle, 0, shift, maPeriod, t) <= 0)
         return sum;
      for(int i = 0; i < maPeriod; i++)
         sum += t[i];
     }
   return sum / maPeriod;
  }
//+------------------------------------------------------------------+
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
   if(rates_total <= minBars)
      return 0;
   ArraySetAsSeries(close,true);
   ArraySetAsSeries(high, true);
   ArraySetAsSeries(low,  true);
   int limit = rates_total - prev_calculated;
   if(limit == 0)             
     {
     }
   else
      if(limit == 1)      
        {
         indValue(high, low, 1);
         return(rates_total);
        }
      else
         if(limit > 1)       
           {
            ArrayInitialize(middle, EMPTY_VALUE);
            ArrayInitialize(upper,    EMPTY_VALUE);
            ArrayInitialize(lower, EMPTY_VALUE);
            limit = rates_total - minBars;
            for(int i = limit; i >= 1 && !IsStopped(); i--)
               indValue(high, low, i);
            return(rates_total);
           }
   indValue(high, low, 0);
   return(rates_total);
  }
//+------------------------------------------------------------------+
