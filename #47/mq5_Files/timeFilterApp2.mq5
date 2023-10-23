//+------------------------------------------------------------------+
//|                                               timeFilterApp2.mq5 |
//+------------------------------------------------------------------+
input int TimeStartHour = 10;
input int TimeStartMin = 0;
input int TimeEndHour = 17;
input int TimeEndMin = 0;
//+------------------------------------------------------------------+
void OnTick()
  {
   MqlDateTime structTime;
   TimeCurrent(structTime);
   structTime.sec = 0;
   structTime.hour = TimeStartHour;
   structTime.min = TimeStartMin;
   datetime timeStart = StructToTime(structTime);
   structTime.hour = TimeEndHour;
   structTime.min = TimeEndMin;
   datetime timeEnd = StructToTime(structTime);
   bool isTime = TimeCurrent() >= timeStart && TimeCurrent() < timeEnd;
   if(TimeStartHour >= TimeEndHour)
     {
      Print("Error: Invalid Time input");
     }
   if(isTime==true)
     {
      Print("Trading is active based on time filter");
     }
   else
      Print("Trading is inactive based on time filter");
  }
//+------------------------------------------------------------------+
