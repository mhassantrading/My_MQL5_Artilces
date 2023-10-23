//+------------------------------------------------------------------+
//|                                                  tradeAtTime.mq5 |
//+------------------------------------------------------------------+
input string openTime="10:00";
datetime lastTime;
//+------------------------------------------------------------------+
void OnTick()
  {
   datetime dtOpenTime=StringToTime(openTime);
   if(lastTime !=dtOpenTime && TimeCurrent()>dtOpenTime)
     {
      lastTime=dtOpenTime;
      Print("Now is the allowed time to trade");
     }

  }
//+------------------------------------------------------------------+
