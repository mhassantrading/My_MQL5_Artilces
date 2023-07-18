//+------------------------------------------------------------------+
//| lotSize Calc Function                                            |
//+------------------------------------------------------------------+
void OnStart()
  {
   OptimalLotSize(0.01, 1.12303, 1.11920);
  }
//+------------------------------------------------------------------+
double OptimalLotSize(double maxRiskPrc, double maxLossInPips)
  {
   double accEquity = AccountInfoDouble(ACCOUNT_EQUITY);
   Alert("accEquity: ", accEquity);
   double lotSize = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_CONTRACT_SIZE);
   Alert("lotSize: ", lotSize);
   double tickValue = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_VALUE);
   Alert("tickValue: ", tickValue);
   double maxLossDollar = accEquity * maxRiskPrc;
   Alert("maxLossDollar: ", maxLossDollar);
   double maxLossInQuoteCurr = maxLossDollar / tickValue;
   Alert("maxLossInQuoteCurr: ", maxLossInQuoteCurr);
   double OptimalLotSize = NormalizeDouble(maxLossInQuoteCurr / (maxLossInPips * 0.0001)/ lotSize,2);
   Alert("OptimalLotSize: ", OptimalLotSize);
   return OptimalLotSize;
  }
//+------------------------------------------------------------------+
double OptimalLotSize(double maxRiskPrc, double entryPrice, double stopLoss)
  {
   double maxLossInPips = MathAbs(entryPrice - stopLoss)/0.0001;
   return OptimalLotSize(maxRiskPrc,maxLossInPips);
  }
//+------------------------------------------------------------------+