//+------------------------------------------------------------------+
//|                                             chv_MA_Crossover.mq5 |
//+------------------------------------------------------------------+
#include <trade/trade.mqh>
enum smoothMode
  {
   SMA=0,// Simple MA
   EMA=1 // Exponential MA
  };
input int          InpSmoothPeriod=10;  // Smoothing period
input int          InpCHVPeriod=10;     // Chaikin Volatility period
input smoothMode smoothTypeInp=EMA;   // Smoothing Mode
input int InpMAPeriod=10; //MA Period
input ENUM_MA_METHOD InpMAMode=MODE_EMA; // MA Mode
input double      lotSize=1;
input double slPips = 300;
input double tpPips = 600;
int chv;
int ma;
int barsTotal;
CTrade trade;
int OnInit()
  {
   barsTotal=iBars(_Symbol,PERIOD_CURRENT);
   chv = iCustom(_Symbol,PERIOD_CURRENT,"Custom_CHV",InpSmoothPeriod,InpCHVPeriod, smoothTypeInp, lotSize, slPips, tpPips);
   ma=iMA(_Symbol,PERIOD_CURRENT, InpMAPeriod, 0, InpMAMode, PRICE_CLOSE);
   return(INIT_SUCCEEDED);
  }
void OnDeinit(const int reason)
  {
   Print("EA is removed");
  }
void OnTick()
  {
   int bars=iBars(_Symbol,PERIOD_CURRENT);
   if(barsTotal < bars)
     {
      barsTotal=bars;
      double chvInd[];
      double maInd[];
      CopyBuffer(chv,0,0,3,chvInd);
      ArraySetAsSeries(chvInd,true);
      CopyBuffer(ma,0,0,3,maInd);
      ArraySetAsSeries(maInd,true);
      double chvVal = NormalizeDouble(chvInd[0], 1);
      double chvValPrev = NormalizeDouble(chvInd[1], 1);
      double maVal = NormalizeDouble(maInd[0], 5);
      double maValPrev = NormalizeDouble(maInd[1], 5);
      double lastClose=iClose(_Symbol,PERIOD_CURRENT,1);
      double prevLastClose=iClose(_Symbol,PERIOD_CURRENT,2);

      if(prevLastClose<maValPrev && lastClose>maVal && chvVal>0)
        {
         double ask = SymbolInfoDouble(_Symbol,SYMBOL_ASK);
         double slVal = ask - slPips*_Point;
         double tpVal = ask + tpPips*_Point;
         trade.Buy(lotSize,_Symbol,ask,slVal,tpVal);
        }
      if(prevLastClose>maValPrev && lastClose<maVal && chvVal<0)
        {
         double bid = SymbolInfoDouble(_Symbol,SYMBOL_BID);
         double slVal = bid + slPips*_Point;
         double tpVal = bid - tpPips*_Point;
         trade.Sell(lotSize,_Symbol,bid,slVal,tpVal);
        }
     }
  }
//+------------------------------------------------------------------+
