input int indPeriod=20; //Period
int donchianChannel;
int OnInit()
  {
   donchianChannel=iCustom(_Symbol,PERIOD_CURRENT,"My Files\\Donchian_Channel\\Donchian_Channel",indPeriod);
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
   double channelHigh=channelBuff1[0];
   double channelMiddle=middleBuff[0];
   double channelLow=channelBuff[0];
   Comment("Channel High: ",channelHigh,"\nChannel Middle: ",channelMiddle,"\nChannel Low: ",channelLow);
  }