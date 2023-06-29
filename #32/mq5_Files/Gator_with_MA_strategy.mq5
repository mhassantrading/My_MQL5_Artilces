//+------------------------------------------------------------------+
//|                                       Gator with MA strategy.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double upGatorArray[];
   double downGatorArray[];
   MqlRates pArray[];
   double maArray[];
   ArraySetAsSeries(upGatorArray,true);
   ArraySetAsSeries(downGatorArray,true);
   ArraySetAsSeries(maArray,true);
   int gatorDef=iGator(_Symbol,_Period,13,8,8,5,5,3,MODE_SMMA,PRICE_MEDIAN);
   int maDef=iMA(_Symbol,_Period,13,0,MODE_EMA,PRICE_CLOSE);
   int data=CopyRates(_Symbol,_Period,0,13,pArray);
   CopyBuffer(gatorDef,0,0,3,upGatorArray);
   CopyBuffer(gatorDef,2,0,3,downGatorArray);
   CopyBuffer(maDef,0,0,3,maArray);
   double gatorUpValue=NormalizeDouble(upGatorArray[0],6);
   double gatorUpPreValue1=NormalizeDouble(upGatorArray[1],6);
   double gatorUpPreValue2=NormalizeDouble(upGatorArray[2],6);
   double gatorDownValue=NormalizeDouble(downGatorArray[0],6);
   double gatorDownPreValue1=NormalizeDouble(downGatorArray[1],6);
   double gatorDownPreValue2=NormalizeDouble(downGatorArray[2],6);
   double maValue=NormalizeDouble(maArray[0],5);
   double closingPrice=pArray[0].close;
   bool douleGreen = gatorUpValue>gatorUpPreValue1&&gatorUpPreValue1>gatorUpPreValue2&&
                     gatorDownValue<gatorDownPreValue1&&gatorDownPreValue1<gatorDownPreValue2;
   bool douleRed = gatorUpValue<gatorUpPreValue1&&gatorUpPreValue1<gatorUpPreValue2&&
                   gatorDownValue>gatorDownPreValue1&&gatorDownPreValue1>gatorDownPreValue2;  
   if(douleGreen&&closingPrice>maValue)
     {
      Comment("Find a good buy position");
     }
   else
      if(douleRed&&closingPrice<maValue)
        {
         Comment("Find a good sell position");
        }
      else
         Comment("");
  }
//+------------------------------------------------------------------+
