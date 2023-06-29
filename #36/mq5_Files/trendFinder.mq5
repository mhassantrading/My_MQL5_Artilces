//+------------------------------------------------------------------+
//|                                                  trendFinder.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   int checkBars= 5;
   int high1, high2, low1, low2;
   double highVal1, highVal2, lowVal1, lowVal2;
   high1=getmove(MODE_HIGH,checkBars,0);
   high2=getmove(MODE_HIGH,checkBars,high1+1);
   highVal1=NormalizeDouble(iHigh(_Symbol,_Period,high1),5);
   highVal2=NormalizeDouble(iHigh(_Symbol,_Period,high2),5);
   ObjectDelete(0,"topLine");
   ObjectCreate(0,"topLine",OBJ_TREND,0,iTime(Symbol(),Period(),high2),iHigh(Symbol(),Period(),high2),iTime(Symbol(),Period(),high1),iHigh(Symbol(),Period(),high1));
   ObjectSetInteger(0,"topLine",OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,"topLine",OBJPROP_WIDTH,3);
   ObjectSetInteger(0,"topLine",OBJPROP_RAY_RIGHT,true);
   low1=getmove(MODE_LOW,checkBars,0);
   low2=getmove(MODE_LOW,checkBars,low1+1);
   lowVal1=NormalizeDouble(iLow(_Symbol,_Period,low1),5);
   lowVal2=NormalizeDouble(iLow(_Symbol,_Period,low2),5);
   ObjectDelete(0,"bottomLine");
   ObjectCreate(0,"bottomLine",OBJ_TREND,0,iTime(Symbol(),Period(),low2),iLow(Symbol(),Period(),low2),iTime(Symbol(),Period(),low1),iLow(Symbol(),Period(),low1));
   ObjectSetInteger(0,"bottomLine",OBJPROP_COLOR,clrGreen);
   ObjectSetInteger(0,"bottomLine",OBJPROP_WIDTH,3);
   ObjectSetInteger(0,"bottomLine",OBJPROP_RAY_RIGHT,true);
   if(lowVal1>lowVal2&&highVal1>highVal2)
     {
      Comment("Uptrend",
              "\nCurrent High ",highVal1,"\nPrevious High ",highVal2,
              "\nCurrent Low ",lowVal1,"\nPrevious Low ",lowVal2);
     }
   else
      if(highVal1<highVal2&&lowVal1<lowVal2)
        {
         Comment("Downtrend",
              "\nCurrent High ",highVal1,"\nPrevious High ",highVal2,
              "\nCurrent Low ",lowVal1,"\nPrevious Low ",lowVal2);
        }
      else
        {
         Comment("Sideways",
              "\nCurrent High ",highVal1,"\nPrevious High ",highVal2,
              "\nCurrent Low ",lowVal1,"\nPrevious Low ",lowVal2);
        }
  }
int getmove(int move, int count, int startPos)
  {
   if(move!=MODE_HIGH && move!=MODE_LOW)
      return (-1);
   int currentBar=startPos;
   int moveReturned=getNextMove(move,count*2+1,currentBar-count);
   while(moveReturned!=currentBar)
     {
      currentBar=getNextMove(move,count,currentBar+1);
      moveReturned=getNextMove(move,count*2+1,currentBar-count);
     }
   return(currentBar);
  }
int getNextMove(int move, int count, int startPos)
  {
   if(startPos<0)
     {
      count +=startPos;
      startPos =0;
     }
   return((move==MODE_HIGH)?
          iHighest(Symbol(),Period(),(ENUM_SERIESMODE)move,count,startPos):
          iLowest(Symbol(),Period(),(ENUM_SERIESMODE)move,count,startPos));
  }