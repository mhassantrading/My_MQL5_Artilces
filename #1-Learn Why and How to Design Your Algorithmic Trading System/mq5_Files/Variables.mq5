//+------------------------------------------------------------------+
//|                                                    Variables.mq5 |
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
    int myInteger = 5;
    double myDouble = 10.56;
    string myString = "My name is Mohamed";
    bool myBoolean = true;
    
    Alert(myInteger);
    Alert(myDouble);
    Alert(myString);
    Alert(myBoolean); 
  }
//+------------------------------------------------------------------+
