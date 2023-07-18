//+------------------------------------------------------------------+
//| News Alert Function                                              |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(isNewsComing())
     {
      Print("News is comming...!");
     }
  }
//+------------------------------------------------------------------+
bool isNewsComing()
  {
   MqlCalendarValue values[];
   datetime startTime=iTime(_Symbol,PERIOD_D1,0);
   datetime endTime=startTime+PeriodSeconds(PERIOD_D1);
   CalendarValueHistory(values,startTime,endTime,NULL,NULL);
   for(int i=0; i<ArraySize(values); i++)
     {
      MqlCalendarEvent event;
      CalendarEventById(values[i].event_id,event);
      MqlCalendarCountry country;
      CalendarCountryById(event.country_id,country);
      if(StringFind(_Symbol,country.currency)<0)
         continue;
      if(event.importance==CALENDAR_IMPORTANCE_NONE)
         continue;
      if(event.importance==CALENDAR_IMPORTANCE_LOW)
         continue;
      if(TimeCurrent()>=values[i].time-30*PeriodSeconds(PERIOD_M1) &&
         TimeCurrent()<values[i].time+30*PeriodSeconds(PERIOD_M1))
        {
         Print(event.name, " is coming! Stop Trading...");
         return true;
        }
     }
   return false;
  }
//+------------------------------------------------------------------+
