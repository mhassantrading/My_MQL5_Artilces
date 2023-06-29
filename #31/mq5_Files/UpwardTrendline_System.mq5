//+------------------------------------------------------------------+
//|                                       UpwardTrendline System.mq5 |
//+------------------------------------------------------------------+
void OnTick()
  {
   int candles=ChartGetInteger(0,CHART_FIRST_VISIBLE_BAR,0);
   double pLow[];
   ArraySetAsSeries(pLow,true);
   CopyLow(_Symbol,_Period,0,candles,pLow);
   int candleLow = ArrayMinimum(pLow,0,candles);
   MqlRates pArray[];
   ArraySetAsSeries(pArray,true);
   int Data = CopyRates(_Symbol,_Period,0,candles,pArray);
   ObjectDelete(_Symbol,"UpwardTrendline");
   ObjectCreate(_Symbol,"UpwardTrendline",OBJ_TREND,0,pArray[candleLow].time,pArray[candleLow].low,
                pArray[0].time,pArray[0].low);
   ObjectSetInteger(0,"UpwardTrendline",OBJPROP_COLOR,Blue);
   ObjectSetInteger(0,"UpwardTrendline",OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,"UpwardTrendline",OBJPROP_WIDTH,3);
   ObjectSetInteger(0,"UpwardTrendline",OBJPROP_RAY_RIGHT,true);
  }
//+------------------------------------------------------------------+
