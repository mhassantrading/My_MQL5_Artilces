//+------------------------------------------------------------------+
//|                                                         TEST.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs
#include <Trade\Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
input int TakeProfit = 150;
input int StopLoss = 100;

void OnStart()
  {
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY); 
   double TakeProfitLevel = (Ask+TakeProfit*0.00001);
   double StopLossLevel = (Ask-StopLoss*0.00001);
   
   
   if(Equity >= Balance)
   trade.Buy(0.01,NULL,Ask,StopLossLevel,TakeProfitLevel,NULL);
   
      for (int i=PositionsTotal()-1; i>=0; i--)
      {
         ulong ticket = PositionGetTicket(i);
         ENUM_POSITION_TYPE position = ENUM_POSITION_TYPE(PositionGetInteger(POSITION_TYPE));
        
       if (ticket <= 0)
        {
         Alert("Error!");  //in Case of error and the order did not open, appears "Error!"
   
        }
      else
        {
         Alert("Your ticket # is: " + string(ticket));
         Alert("TakeProfit = ", TakeProfitLevel);
         Alert("StopLoss = ", StopLossLevel);
        }
      }
  }
//+------------------------------------------------------------------+
