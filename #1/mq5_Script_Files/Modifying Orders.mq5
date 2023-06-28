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
   double TakeProfitLevel2 = (TakeProfitLevel+0.00100);
   double StopLossLevel2 = (StopLossLevel-0.00050);   
   
   
   trade.Buy(0.01,NULL,Ask,StopLossLevel,TakeProfitLevel,NULL);
   
   for (int i=PositionsTotal()-1; i>=0; i--)
   {
     ulong ticket = PositionGetTicket(i);
     ENUM_POSITION_TYPE position = ENUM_POSITION_TYPE(PositionGetInteger(POSITION_TYPE));

      
     Alert (" Order Ticket # ", ticket);
     Alert("TakeProfit = ", TakeProfitLevel);
     Alert("StopLoss = ", StopLossLevel);
     
     Sleep(5000);
     
     trade.PositionModify(ticket,StopLossLevel2,TakeProfitLevel2);
     Alert("Order Modified...");
     Alert("Modified TakeProfit = ", TakeProfitLevel2);
     Alert("Modified StopLoss = ", StopLossLevel2);
   }

  }
//+------------------------------------------------------------------+
