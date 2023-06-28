//+------------------------------------------------------------------+
//|                                                   While Loop.mq5 |
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
   //While (Loop)
   Alert("Start of script");
   
   int counter = 1;
   
   while(counter < 3) //true?
    {
      Alert(counter);
      counter = counter + 1;
    }
    
    Alert("Loop has finished");
  }
//+------------------------------------------------------------------+
