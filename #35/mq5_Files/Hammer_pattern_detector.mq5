//+------------------------------------------------------------------+
//|                                      Hammer pattern detector.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
void OnTick()
  {
   getHammer(0.07,0.7);
  }
int getHammer(double smallShadowRatio, double longShadowRatio)
  {
//creating variables for prices data - open,  high, low, close
   datetime time=iTime(_Symbol,PERIOD_CURRENT,1);
   double open=iOpen(_Symbol,PERIOD_CURRENT,1);
   double high=iHigh(_Symbol,PERIOD_CURRENT,1);
   double low=iLow(_Symbol,PERIOD_CURRENT,1);
   double close=iClose(_Symbol,PERIOD_CURRENT,1);
   double candleSize=high-low;
//green hammer
   if(open<close)
     {
      if(high-close < candleSize*smallShadowRatio)
        {
         if(open-low>candleSize*longShadowRatio)
            createObj(time,low,217, clrGreen,"Hammer");
           {
            return 1;
           }
        }
     }
//red hammer
   if(open>close)
     {
      if(high-open<candleSize*smallShadowRatio)
        {
         if(close-low>candleSize*longShadowRatio)
            createObj(time,high,218,clrRed,"Hammer");
           {
            return 1;
           }
        }
     }
//green inverse hammer
   if(open<close)
     {
      if(open-low < candleSize*smallShadowRatio)
        {
         if(high-close>candleSize*longShadowRatio)
            createObj(time,low,217, clrGreen,"Inverted Hammer");
           {
            return -1;
           }
        }
     }
//red inverse hammer
   if(open>close)
     {
      if(close-low < candleSize*smallShadowRatio)
        {
         if(high-open>candleSize*longShadowRatio)
            createObj(time,high,218, clrRed,"Inverted Hammer");
           {
            return -1;
           }
        }
     }
   return 0;
  }
void createObj(datetime time, double price, int arrawCode, color clr, string txt)
  {
   string objName=" ";
   StringConcatenate(objName, "Signal@",time, "at",DoubleToString(price,_Digits),"(",arrawCode,")");
   if(ObjectCreate(0,objName,OBJ_ARROW,0,time,price))
     {
      ObjectSetInteger(0,objName,OBJPROP_ARROWCODE,arrawCode);
      ObjectSetInteger(0,objName,OBJPROP_COLOR,clr);
      if(clr==clrGreen)
         ObjectSetInteger(0,objName,OBJPROP_ANCHOR,ANCHOR_TOP);
      if(clr==clrRed)
         ObjectSetInteger(0,objName,OBJPROP_ANCHOR,ANCHOR_BOTTOM);
     }
   string candleName=objName+txt;
   if(ObjectCreate(0,candleName,OBJ_TEXT,0,time,price))
     {
      ObjectSetString(0,candleName,OBJPROP_TEXT," "+txt);
      ObjectSetInteger(0,candleName,OBJPROP_COLOR,clr);
     }
  }