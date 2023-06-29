//+------------------------------------------------------------------+
//|                                                Gator signals.mq5 |
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
   CopyBuffer(gatorDef,0,0,3,upGatorArray);
   CopyBuffer(gatorDef,2,0,3,downGatorArray);
   double gatorUpValue=NormalizeDouble(upGatorArray[0],6);
   double gatorUpPreValue1=NormalizeDouble(upGatorArray[1],6);
   double gatorUpPreValue2=NormalizeDouble(upGatorArray[2],6);
   double gatorDownValue=NormalizeDouble(downGatorArray[0],6);
   double gatorDownPreValue1=NormalizeDouble(downGatorArray[1],6);
   double gatorDownPreValue2=NormalizeDouble(downGatorArray[2],6);
   bool awakeningPhase = gatorUpPreValue1<gatorUpPreValue2&&gatorDownPreValue1>gatorDownPreValue2&&
                         gatorUpValue>gatorUpPreValue1&&gatorDownValue<gatorDownPreValue1;
   bool eatingPhase = gatorUpValue>gatorUpPreValue1&&gatorDownValue<gatorDownPreValue1;
   bool satedPhase = gatorUpPreValue1>gatorUpPreValue2&&gatorDownPreValue1<gatorDownPreValue2&&
                     gatorUpValue<gatorUpPreValue1&&gatorDownValue>gatorDownPreValue1;
   if(awakeningPhase)
     {
      Comment("Find a good entry");
     }
   else
      if(eatingPhase)
        {
         Comment("Hold current position");
        }
      else
         if(satedPhase)
           {
            Comment("Find a good exit");
           }
         else
            Comment("");
  }
//+------------------------------------------------------------------+
