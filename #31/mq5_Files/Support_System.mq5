//+------------------------------------------------------------------+
//|                                          Support Line System.mq5 |
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
   ObjectDelete(_Symbol,"supportLine");
   ObjectCreate(_Symbol,"supportLine",OBJ_HLINE,0,pArray[candleLow].time,pArray[candleLow].low,
                pArray[0].time,pArray[0].low);
   ObjectSetInteger(0,"supportLine",OBJPROP_COLOR,Green);
   ObjectSetInteger(0,"supportLine",OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,"supportLine",OBJPROP_WIDTH,3);
   ObjectSetInteger(0,"supportLine",OBJPROP_RAY,true);
  }
//+------------------------------------------------------------------+
