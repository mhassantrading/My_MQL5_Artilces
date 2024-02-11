//+------------------------------------------------------------------+
//|                                       Keltner_Trading_System.mq5 |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
input int      maPeriod            = 10;           // Moving Average Period
input double   multiInp             = 2.0;          // Channel multiplier
input bool     isAtr                 = false;        // ATR
input ENUM_MA_METHOD     maMode       = MODE_EMA;     // Moving Average Mode
input ENUM_APPLIED_PRICE priceType = PRICE_TYPICAL;// Price Type
input double      lotSize=1;
input double slPips = 150;
input double tpPips = 300; 
int keltner;
int barsTotal;
CTrade trade;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   keltner = iCustom(_Symbol,PERIOD_CURRENT,"Custom_Keltner_Channel",maPeriod,multiInp, isAtr, maMode, priceType);
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Print("EA is removed");
  }
//+------------------------------------------------------------------+
void OnTick()
  {
   int bars=iBars(_Symbol,PERIOD_CURRENT);
   if(barsTotal < bars)
     {
      barsTotal=bars;
      double upper[], middle[], lower[];
      CopyBuffer(keltner,0,0,3,upper);
      CopyBuffer(keltner,1,0,3,middle);
      CopyBuffer(keltner,2,0,3,lower);
      ArraySetAsSeries(upper,true);
      ArraySetAsSeries(middle,true);
      ArraySetAsSeries(lower,true);
      double prevUpperValue = NormalizeDouble(upper[2], 5);
      double prevMiddleValue = NormalizeDouble(middle[2], 5);
      double prevLowerValue = NormalizeDouble(lower[2], 5);
      double upperValue = NormalizeDouble(upper[1], 5);
      double middleValue = NormalizeDouble(middle[1], 5);
      double lowerValue = NormalizeDouble(lower[1], 5);
      double lastClose=iClose(_Symbol,PERIOD_CURRENT,1);
      double prevLastClose=iClose(_Symbol,PERIOD_CURRENT,2);
      if(prevLastClose<prevLowerValue && lastClose>lowerValue)
        {
         double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
         double slVal = lowerValue - slPips*_Point;
         double tpVal = middleValue + tpPips*_Point;
         trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
        }
      if(prevLastClose>prevUpperValue && lastClose<upperValue)
        {
         double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
         double slVal = upperValue + slPips*_Point;
         double tpVal = middleValue - tpPips*_Point;
         trade.Sell(lotSize,_Symbol,bid,upperValue,tpVal);
        }
     }
  }
//+------------------------------------------------------------------+
