//+------------------------------------------------------------------+
//|                                          Force Index signals.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
void OnTick()
  {
   double fiArray[];
   double maArray[];
   MqlRates pArray[];



   ArraySetAsSeries(fiArray,true);
   ArraySetAsSeries(maArray,true);


   int fiDef = iForce(_Symbol,_Period,13,MODE_EMA,VOLUME_TICK);
   int maDef = iMA(_Symbol,_Period,50,0,MODE_EMA,PRICE_CLOSE);
   int Data=CopyRates(_Symbol,_Period,0,3,pArray);

   CopyBuffer(fiDef,0,0,3,fiArray);
   CopyBuffer(maDef,0,0,3,maArray);

   double fiCurrentVal = NormalizeDouble(fiArray[0],6);
   double fiPrevVal = NormalizeDouble(fiArray[1],6);

   double maCurrentVal = NormalizeDouble(maArray[0],6);
   double closePrice = NormalizeDouble(pArray[2].close,6);


   if(closePrice>maCurrentVal && fiPrevVal<0 && fiCurrentVal>0)
     {
      Comment("Buy Signal","\n",
              "Current Closing Price ",closePrice,"\n",
              "EMA is ",maCurrentVal,"\n",
              "Current Force Index Value is ",fiCurrentVal,"\n",
              "Previous Force Index Value is ",fiPrevVal);
     }

   if(closePrice<maCurrentVal && fiPrevVal>0 && fiCurrentVal<0)
     {
      Comment("Sell Signal","\n",
              "Current Closing Price ",closePrice,"\n",
              "EMA is ",maCurrentVal,"\n",
              "Current Force Index Value is ",fiCurrentVal,"\n",
              "Previous Force Index Value is ",fiPrevVal);
     }

  }
//+------------------------------------------------------------------+
