//+------------------------------------------------------------------+
//|                                       Script program example.mq5 |
//|                                   Copyright 2023, MetaQuotes Ltd.|
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//property preprocessor
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs
//inputs
input int userEntryNum1;
input int userEntryNum2;
//global variable
int result;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
//event handler
void OnStart()
  {
   result=userEntryNum1+userEntryNum2;
   Print("Result: ", result);
  }
//+------------------------------------------------------------------+
