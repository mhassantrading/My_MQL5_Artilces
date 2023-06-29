//+------------------------------------------------------------------+
//|                             Simple ATR System - SL&TP levels.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //define Ask price
   double Ask=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   
   //creating price array
   double PriceArray[];
   
   //Sorting data
   ArraySetAsSeries(PriceArray,true);

   //define ATR
   int ATRDef=iATR(_Symbol,_Period,14);
   
   
   //define data and store result
   CopyBuffer(ATRDef,0,0,3,PriceArray);
   
   //get value of current data
   double ATRValue=NormalizeDouble(PriceArray[0],5);
   
   //Calculate SL&TP for buy position
   double StopLossBuy=Bid-(ATRValue*2);
   double TakeProfitBuy=Ask+((ATRValue*2)*2);
   
   //Calculate SL&TP for sell position
   double StopLossSell=Ask+(ATRValue*2);
   double TakeProfitSell=Bid-((ATRValue*2)*2);
   
   //comment on the chart
   Comment("BUY POSITION","\n","Current Ask = ",Ask,"\n","Current Bid = ",Bid,"\n","ATR Value = ",ATRValue,
   "\n","Stop Loss = ",StopLossBuy,"\n","Take Profit = ",TakeProfitBuy,"\n",
   "SELL POSITION","\n","Current Ask = ",Ask,"\n","Current Bid = ",Bid,"\n","ATR Value = ",ATRValue,
   "\n","Stop Loss = ",StopLossSell,"\n","Take Profit = ",TakeProfitSell);
   
  }
//+------------------------------------------------------------------+
