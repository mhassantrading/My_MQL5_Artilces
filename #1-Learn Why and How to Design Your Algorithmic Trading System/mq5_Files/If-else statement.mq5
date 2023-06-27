//+------------------------------------------------------------------+
//|                                            If-else statement.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   double level = 1.146600;
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   Alert("Bid Price = " + string(Bid));

  if(Bid > level)
  {
  Alert ("The price is above " + string(level) + " -> BUY");
  }
// What if the condition is false and we need to take an action also here we can use else function instead of writing another if code
   else
   {
   Alert ("The price is below " + string(level) + " -> SELL");
   } 
    
  }
//+------------------------------------------------------------------+
