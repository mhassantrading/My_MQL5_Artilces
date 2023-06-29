input int indPeriod=20; //Period
input int maPeriod=200; //Moving Average Period
int donchianChannel;
int EMA;
double emaArray[];
int OnInit()
  {
   donchianChannel=iCustom(_Symbol,PERIOD_CURRENT,"My Files\\Donchian_Channel\\Donchian_Channel",indPeriod);
   EMA = iMA(_Symbol,_Period,maPeriod,0,MODE_EMA,PRICE_CLOSE);
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("Donchian Channel EA Removed");
  }
void OnTick()
  {
   double channelBuff[],channelBuff1[], middleBuff[];
   CopyBuffer(donchianChannel,0,0,3,channelBuff);
   CopyBuffer(donchianChannel,1,0,3,channelBuff1);
   CopyBuffer(donchianChannel,2,0,3,middleBuff);
   ArraySetAsSeries(emaArray,true);
   CopyBuffer(EMA,0,0,3,emaArray);
   double channelHigh=channelBuff1[0];
   double channelMiddle=middleBuff[0];
   double channelLow=channelBuff[0];
   double EMAValue=NormalizeDouble(emaArray[0],_Digits);
   double ask=SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   double bid=SymbolInfoDouble(_Symbol,SYMBOL_BID);
   if(ask>channelHigh&&ask>EMAValue)
     {
      Comment("Buy Signal","\nAsk above Channel High","\nAsk above (",maPeriod,") EMA");
     }
     else if(bid<channelLow&&bid<EMAValue)
     {
      Comment("Sell Signal","\nBid below Channel Low","\nBid Below (",maPeriod,") EMA");
     }
     else Comment(" ");
  }