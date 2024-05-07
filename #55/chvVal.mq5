//+------------------------------------------------------------------+
//|                                                       chvVal.mq5 |
//+------------------------------------------------------------------+
enum smoothMode
  {
   SMA=0,// Simple MA
   EMA=1 // Exponential MA
  };
input int          smoothPeriodInp=10;  // Smoothing Period
input int          chvPeriodInp=10;     // Chaikin Volatility Period
input smoothMode smoothTypeInp=EMA;   // Smoothing Mode
int chv;
int OnInit()
  {
   chv = iCustom(_Symbol,PERIOD_CURRENT,"Custom_CHV",smoothPeriodInp,chvPeriodInp, smoothTypeInp);
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("EA is removed");
  }
void OnTick()
  {
    double chvInd[];
    CopyBuffer(chv,0,0,3,chvInd);
    ArraySetAsSeries(chvInd,true);
    double chvVal = NormalizeDouble(chvInd[0], 1);
    Comment("CHV value = ",chvVal);
  }
//+------------------------------------------------------------------+
