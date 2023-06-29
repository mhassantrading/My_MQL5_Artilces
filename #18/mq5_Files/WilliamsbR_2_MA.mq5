//+------------------------------------------------------------------+
//|                                              Williams%R & MA.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double WPArray[];
   double MAArray[];

   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);

   ArraySetAsSeries(WPArray,true);
   ArraySetAsSeries(MAArray,true);

   int WPDef = iWPR(_Symbol,_Period,14);
   int MADef = iMA(_Symbol,_Period,100,0,MODE_EMA,PRICE_CLOSE);

   CopyBuffer(WPDef,0,0,3,WPArray);
   CopyBuffer(MADef,0,0,3,MAArray);

   double WPVal = NormalizeDouble(WPArray[0],2);
   double MAVal = NormalizeDouble(MAArray[0],2);

   if(Ask>MAVal && WPVal>-50)
     {
      Comment("Buy signal","\n",
              "Williams % R Value is",WPVal,"\n",
              "EMA Value is",MAVal);
     }

   if(Bid<MAVal && WPVal<-50)
     {
      Comment("Sell signal","\n",
              "Williams % R Value is",WPVal,"\n",
              "EMA Value is",MAVal);
     }

  }
//+------------------------------------------------------------------+
