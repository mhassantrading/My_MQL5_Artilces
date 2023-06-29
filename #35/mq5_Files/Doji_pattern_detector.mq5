//+------------------------------------------------------------------+
//|                                        Doji pattern detector.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
void OnTick()
  {
   getDoji();
  }
int getDoji()
  {
   datetime time=iTime(_Symbol,PERIOD_CURRENT,1);
   double open=iOpen(_Symbol,PERIOD_CURRENT,1);
   double high=iHigh(_Symbol,PERIOD_CURRENT,1);
   double low=iLow(_Symbol,PERIOD_CURRENT,1);
   double close=iClose(_Symbol,PERIOD_CURRENT,1);
//Doji
   if(open==close)
     {
      createObj(time,low,217, clrBlack,"Doji");
        {
         return 1;
        }
     }
   return 0;
  }
void createObj(datetime time, double price, int arrawCode, color clr, string txt)
  {
   string objName=" ";
   StringConcatenate(objName, "Signal at ",time, " at ",DoubleToString(price,_Digits)," (",arrawCode,")");
   if(ObjectCreate(0,objName,OBJ_ARROW,0,time,price))
     {
      ObjectSetInteger(0,objName,OBJPROP_ARROWCODE,arrawCode);
      ObjectSetInteger(0,objName,OBJPROP_COLOR,clr);
     }
   string candleName=objName+txt;
   if(ObjectCreate(0,candleName,OBJ_TEXT,0,time,price))
     {
      ObjectSetString(0,candleName,OBJPROP_TEXT," "+txt);
      ObjectSetInteger(0,candleName,OBJPROP_COLOR,clr);
     }
  }