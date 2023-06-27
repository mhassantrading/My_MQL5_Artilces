//+------------------------------------------------------------------+
//|                                                Trader Inputs.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
input int TakeProfit = 10;
input int StopLoss = 10;

void OnStart()
  {
//---
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   double TakeProfitLevel = Bid + TakeProfit * 0.00001; // 0.00001 (5 digits broker, so multiplied by 10)
   double StopLossLevel = Bid - StopLoss * 0.00001;
   
   Alert("Price now = " + string(Bid));
   Alert ("TakeProfitLevel = ", TakeProfitLevel);
   Alert ("StopLossLevel = ", StopLossLevel);
  }
//+------------------------------------------------------------------+
