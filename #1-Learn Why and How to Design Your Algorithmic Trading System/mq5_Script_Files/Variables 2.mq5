//+------------------------------------------------------------------+
//|                                                  Variables 2.mq5 |
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
   int A = 10;
   int B = 5;
   int C;
 
   double var1 = 2.5;
   double var2 = 4;
   double result = var1 / var2;
   
   string greeting = "Hello";
   string space = " ";
   string name = "Mohamed";
   string message1;
   string message2;
   
   C = A + B;
   message1 = greeting + space + name;  
   message2 = "Value of A is: " + string(A);
   
   Alert(message1);
   Alert(C);
   Alert(result);
   Alert(message2);
  }
//+------------------------------------------------------------------+
