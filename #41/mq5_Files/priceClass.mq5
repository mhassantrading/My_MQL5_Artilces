//+------------------------------------------------------------------+
//class declare
class CPrices
  {
public:
   string            timeFrame;
   double            open;
   double            high;
   double            low;
   double            close;
   void              pricesPrint()
     {
      Print(timeFrame, " Prices = Open: ", open, " - ", "High: ", high, "-", "Low: ", low, "-", "Close: ", close);
     }
  };
//+------------------------------------------------------------------+
//objects
CPrices CDailyPrices;
CPrices CWeeklyPrices;
CPrices CMonthlyPrices;
//+------------------------------------------------------------------+
int OnInit()
  {
//Daily time frame
   CDailyPrices.timeFrame="Daily";
   CDailyPrices.open=(iOpen(Symbol(), PERIOD_D1, 1));
   CDailyPrices.high=(iHigh(Symbol(), PERIOD_D1, 1));
   CDailyPrices.low=(iLow(Symbol(), PERIOD_D1, 1));
   CDailyPrices.close=(iClose(Symbol(), PERIOD_D1, 1));
   CDailyPrices.pricesPrint();
//Weekly time frame
   CWeeklyPrices.timeFrame="Weekly";
   CWeeklyPrices.open=(iOpen(Symbol(), PERIOD_W1, 1));
   CWeeklyPrices.high=(iHigh(Symbol(), PERIOD_W1, 1));
   CWeeklyPrices.low=(iLow(Symbol(), PERIOD_W1, 1));
   CWeeklyPrices.close=(iClose(Symbol(), PERIOD_W1, 1));
   CWeeklyPrices.pricesPrint();
//Monthly time frame
   CMonthlyPrices.timeFrame="Monthly";
   CMonthlyPrices.open=(iOpen(Symbol(), PERIOD_MN1, 1));
   CMonthlyPrices.high=(iHigh(Symbol(), PERIOD_MN1, 1));
   CMonthlyPrices.low=(iLow(Symbol(), PERIOD_MN1, 1));
   CMonthlyPrices.close=(iClose(Symbol(), PERIOD_MN1, 1));
   CMonthlyPrices.pricesPrint();
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
