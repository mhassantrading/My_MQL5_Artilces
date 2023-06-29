//+------------------------------------------------------------------+
//|                                                   moveFinder.mq5 |
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
   int move1;
   int move2;
   move1=getmove(MODE_HIGH,checkBars,0);
   move2=getmove(MODE_HIGH,checkBars,move1+1);
   ObjectDelete(0,"topLine");
   ObjectCreate(0,"topLine",OBJ_TREND,0,iTime(Symbol(),Period(),move2),iHigh(Symbol(),Period(),move2),iTime(Symbol(),Period(),move1),iHigh(Symbol(),Period(),move1));
   ObjectSetInteger(0,"topLine",OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,"topLine",OBJPROP_WIDTH,3);
   ObjectSetInteger(0,"topLine",OBJPROP_RAY_RIGHT,true);
   move1=getmove(MODE_LOW,checkBars,0);
   move2=getmove(MODE_LOW,checkBars,move1+1);
   ObjectDelete(0,"bottomLine");
   ObjectCreate(0,"bottomLine",OBJ_TREND,0,iTime(Symbol(),Period(),move2),iLow(Symbol(),Period(),move2),iTime(Symbol(),Period(),move1),iLow(Symbol(),Period(),move1));
   ObjectSetInteger(0,"bottomLine",OBJPROP_COLOR,clrGreen);
   ObjectSetInteger(0,"bottomLine",OBJPROP_WIDTH,3);
   ObjectSetInteger(0,"bottomLine",OBJPROP_RAY_RIGHT,true);
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