//+------------------------------------------------------------------+
//|                                                       newBar.mqh |
//+------------------------------------------------------------------+

//newBarApp
class CNewBar
  {
private:
   datetime          time[], lastTime;
public:
   void              CNewBar();
   bool              newBarCheck(string symbol, ENUM_TIMEFRAMES timeFrame);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CNewBar::CNewBar(void)
  {
   ArraySetAsSeries(time,true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CNewBar::newBarCheck(string symbol, ENUM_TIMEFRAMES timeFrame)
  {
   bool firstCheck = false;
   bool newBar = false;
   CopyTime(symbol,timeFrame,0,2,time);
   if(lastTime == 0)
     {
      firstCheck = true;
     }
   if(time[0] > lastTime)
     {
      if(firstCheck == false)
        {
         newBar = true;
        }
      lastTime = time[0];
     }
   return(newBar);
  }
//+------------------------------------------------------------------+
//timeFilterApp
class CTimeFilter
  {
public:
   bool timeCheck(datetime startTime, datetime endTime, bool localTime = false);
  };
bool CTimeFilter::timeCheck(datetime startTime, datetime endTime, bool localTime = false)
  {
   if(startTime >= endTime)
     {
      Print("Error: Invalid Time input");
      return(false);
     }
   datetime currentTime;
   if(localTime == true)
     {
      currentTime = TimeLocal();
     }
   else
      currentTime = TimeCurrent();
   bool timeFilterActive = false;
   if(currentTime >= startTime && currentTime < endTime)
     {
      timeFilterActive = true;
     }
   return(timeFilterActive);
  }
//+------------------------------------------------------------------+
