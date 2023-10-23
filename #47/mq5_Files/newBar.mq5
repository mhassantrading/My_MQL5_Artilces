//+------------------------------------------------------------------+
//|                                                       newBar.mq5 |
//+------------------------------------------------------------------+
#include <dateTime.mqh>
CNewBar NewBar;
bool newBarTrade=true;
//+------------------------------------------------------------------+
void OnTick()
  {
   bool newBar=true;
   int barShift=0;
   if(newBarTrade==true)
     {
      newBar = NewBar.newBarCheck(Symbol(),Period());
      barShift=1;
     }
   if(newBar==true)
     {
      Print("A new bar painted, you can trade");
     }
  }
//+------------------------------------------------------------------+
