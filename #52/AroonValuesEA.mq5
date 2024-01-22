//+------------------------------------------------------------------+
//|                                                AroonValuesEA.mq5 |
//+------------------------------------------------------------------+
input int         periodInp = 25; // Period
input int         shiftInp  = 0; // Shift
int aroon;
int OnInit()
  {
   aroon = iCustom(_Symbol,PERIOD_CURRENT,"Aroon",periodInp,shiftInp);
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("EA is removed");
  }
void OnTick()
  {
   double upBuffer[], downBuffer[];
   CopyBuffer(aroon,0,0,3,upBuffer);
   CopyBuffer(aroon,1,0,3,downBuffer);
   ArraySetAsSeries(upBuffer,true);
   ArraySetAsSeries(downBuffer,true);
   double upValue = upBuffer[0];
   double downValue = downBuffer[0];
   Comment("upValue: ",upValue,"\ndownValue: ",downValue);
  }
//+------------------------------------------------------------------+
