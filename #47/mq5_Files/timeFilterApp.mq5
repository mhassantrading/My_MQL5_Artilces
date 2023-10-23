//+------------------------------------------------------------------+
//|                                                timeFilterApp.mq5 |
//+------------------------------------------------------------------+
#include <dateTime.mqh>
input datetime StartTime = D'2023.10.10 10:00';
input datetime EndTime = D'2023.10.10 17:00';
CTimeFilter filter;
void OnTick()
  {
   bool timeFilterActive = filter.timeCheck(StartTime,EndTime,false);
   if(timeFilterActive == true)
     {
      Print("Trading is active based on time filter");
     }
     else Print("Trading is inactive based on time filter");
  }
