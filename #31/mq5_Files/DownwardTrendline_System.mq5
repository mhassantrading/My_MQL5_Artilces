//+------------------------------------------------------------------+
//|                                     DownwardTrendline System.mq5 |
//+------------------------------------------------------------------+
void OnTick()
  {
   int candles=ChartGetInteger(0,CHART_FIRST_VISIBLE_BAR,0);
   double pHigh[];
   ArraySetAsSeries(pHigh,true);
   CopyHigh(_Symbol,_Period,0,candles,pHigh);
   int candleHigh = ArrayMaximum(pHigh,0,candles);
   MqlRates pArray[];
   ArraySetAsSeries(pArray,true);
   int Data = CopyRates(_Symbol,_Period,0,candles,pArray);
   ObjectDelete(_Symbol,"DnwardTrendline");
   ObjectCreate(_Symbol,"DnwardTrendline",OBJ_TREND,0,pArray[candleHigh].time,pArray[candleHigh].high,
                pArray[0].time,pArray[0].high);
   ObjectSetInteger(0,"DnwardTrendline",OBJPROP_COLOR,Blue);
   ObjectSetInteger(0,"DnwardTrendline",OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,"DnwardTrendline",OBJPROP_WIDTH,3);
   ObjectSetInteger(0,"DnwardTrendline",OBJPROP_RAY_RIGHT,true);
  }
//+------------------------------------------------------------------+
