//+------------------------------------------------------------------+
//|                                     OrderSend_Trading_system.mq5 |
//+------------------------------------------------------------------+
int simpleMA;
int barsTotal;
int OnInit()
  {
   simpleMA = iMA(_Symbol, PERIOD_H1, 50, 0, MODE_SMA, PRICE_CLOSE);
   barsTotal=iBars(_Symbol,PERIOD_H1);
   return(INIT_SUCCEEDED);
  }
void OnTick()
  {
   MqlRates priceArray[];
   double mySMAArray[];
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   MqlTradeRequest request;
   MqlTradeResult result;
   ZeroMemory(request);
   ArraySetAsSeries(priceArray,true);
   ArraySetAsSeries(mySMAArray,true);
   int Data=CopyRates(_Symbol,_Period,0,3,priceArray);
   CopyBuffer(simpleMA,0,0,3,mySMAArray);
   double lastClose=(priceArray[1].close);
   double prevClose=(priceArray[2].close);
   double SMAVal = NormalizeDouble(mySMAArray[1],_Digits);
   double prevSMAVal = NormalizeDouble(mySMAArray[2],_Digits);
   int bars=iBars(_Symbol,PERIOD_H1);
   if(barsTotal != bars)
     {
      barsTotal=bars;
      if(prevClose<prevSMAVal && lastClose>SMAVal)
        {
         request.action = TRADE_ACTION_DEAL;
         request.type = ORDER_TYPE_BUY;
         request.symbol = _Symbol;
         request.volume = 0.1;
         request.type_filling = ORDER_FILLING_FOK;
         request.price = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
         request.sl = Ask-(500*_Point);
         request.tp = Ask+(1000*_Point);
         request.deviation = 50;
         OrderSend(request, result);
        }
      if(prevClose>prevSMAVal && lastClose<SMAVal)
        {
         request.action = TRADE_ACTION_DEAL;
         request.type = ORDER_TYPE_SELL;
         request.symbol = _Symbol;
         request.volume = 0.1;
         request.type_filling = ORDER_FILLING_FOK;
         request.price = SymbolInfoDouble(_Symbol,SYMBOL_BID);
         request.sl = Bid+(500*_Point);
         request.tp = Bid-(1000*_Point);
         request.deviation = 50;
         OrderSend(request, result);
        }
     }
  }