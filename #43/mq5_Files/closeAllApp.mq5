//+------------------------------------------------------------------+
//| closeAll Function                                                |
//+------------------------------------------------------------------+
#include <Trade/Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
void OnStart()
  {
   closeAll();
  }
//+------------------------------------------------------------------+
void closeAll()
  {
//close all open positions
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong posTicket=PositionGetTicket(i);
      trade.PositionClose(posTicket);
     }
//delete all pending orders
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      ulong posTicket=OrderGetTicket(i);
      trade.OrderDelete(posTicket);
     }
  }
//+------------------------------------------------------------------+