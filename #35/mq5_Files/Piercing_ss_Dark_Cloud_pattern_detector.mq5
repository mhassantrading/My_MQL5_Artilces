//+------------------------------------------------------------------+
//|                      Piercing && Dark Cloud pattern detector.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
void OnTick()
  {
   getPiercing();  
  }
int getPiercing()
  {
   datetime time=iTime(_Symbol,PERIOD_CURRENT,1);
   double open=iOpen(_Symbol,PERIOD_CURRENT,1);
   double high=iHigh(_Symbol,PERIOD_CURRENT,1);
   double low=iLow(_Symbol,PERIOD_CURRENT,1);
   double close=iClose(_Symbol,PERIOD_CURRENT,1);
   double open2=iOpen(_Symbol,PERIOD_CURRENT,2);
   double high2=iHigh(_Symbol,PERIOD_CURRENT,2);
   double low2=iLow(_Symbol,PERIOD_CURRENT,2);
   double close2=iClose(_Symbol,PERIOD_CURRENT,2);
   double candleSize2=high2-low2;
   double candleMidPoint2=high2-(candleSize2/2);
   if(open<close)
     {
      if(open2>close2)
        {
         if(open<low2)
           {
            if(close>candleMidPoint2&&close<high2)
              {
               createObj(time,low,217, clrGreen,"Piercing");
                 {
                  return 1;
                 }
              }
           }
        }
     }
   if(open>close)
     {
      if(open2<close2)
        {
         if(open>high2)
           {
            if(close<candleMidPoint2&&close>low2)
              {
               createObj(time,high,218, clrRed,"Dark Cloud");
                 {
                  return -1;
                 }
              }
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