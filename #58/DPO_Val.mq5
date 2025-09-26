//+------------------------------------------------------------------+
//|                                                      DPO_Val.mq5 |
//+------------------------------------------------------------------+
input int                 period=20; // Period
int dpo;
int OnInit()
  {
   dpo = iCustom(_Symbol,PERIOD_CURRENT,"customDPO",period);
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("EA is removed");
  }
void OnTick()
  {
    double dpoInd[];
    CopyBuffer(dpo,0,0,3,dpoInd);
    ArraySetAsSeries(dpoInd,true);
    double dpoVal = NormalizeDouble(dpoInd[0], 3);
    Comment("DPO value = ",dpoVal);
  }
