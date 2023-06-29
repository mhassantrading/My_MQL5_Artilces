//+------------------------------------------------------------------+
//|                                      Gator Status Identifier.mq5 |
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
   ArraySetAsSeries(upGatorArray,true);
   ArraySetAsSeries(downGatorArray,true);
   int gatorDef=iGator(_Symbol,_Period,13,8,8,5,5,3,MODE_SMMA,PRICE_MEDIAN);
   CopyBuffer(gatorDef,0,0,5,upGatorArray);
   CopyBuffer(gatorDef,2,0,5,downGatorArray);
   double gatorUpValue=NormalizeDouble(upGatorArray[0],6);
   double gatorUpPreValue1=NormalizeDouble(upGatorArray[1],6);
   double gatorUpPreValue2=NormalizeDouble(upGatorArray[2],6);
   double gatorDownValue=NormalizeDouble(downGatorArray[0],6);
   double gatorDownPreValue1=NormalizeDouble(downGatorArray[1],6);
   double gatorDownPreValue2=NormalizeDouble(downGatorArray[2],6);
   if(gatorUpValue<gatorUpPreValue1&&gatorDownValue>gatorDownPreValue1)
     {
      Comment("Sleeping Phase");
     }
   else
      if(gatorUpValue>gatorUpPreValue1&&gatorDownValue<gatorDownPreValue1)
        {
         Comment("Eating Phase");
        }
   if(gatorUpPreValue1<gatorUpPreValue2&&gatorDownPreValue1>gatorDownPreValue2&&
      gatorUpValue>gatorUpPreValue1&&gatorDownValue<gatorDownPreValue1)
     {
      Comment("Awakening Phase");
     }
   else
      if(
         gatorUpPreValue1>gatorUpPreValue2&&gatorDownPreValue1<gatorDownPreValue2&&
         gatorUpValue<gatorUpPreValue1&&gatorDownValue>gatorDownPreValue1)
        {
         Comment("Sated Phase");
        }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
