//+------------------------------------------------------------------+
//|                                            DeMarker Strength.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double deMarkerArray[];

   ArraySetAsSeries(deMarkerArray,true);

   int deMarkerDef = iDeMarker(_Symbol,_Period,14);

   CopyBuffer(deMarkerDef,0,0,6,deMarkerArray);

   double deMarkerVal = NormalizeDouble(deMarkerArray[0],4);
   double deMarkerVal1 = NormalizeDouble(deMarkerArray[1],4);
   double deMarkerVal2 = NormalizeDouble(deMarkerArray[2],4);
   double deMarkerVal3 = NormalizeDouble(deMarkerArray[3],4);
   double deMarkerVal4 = NormalizeDouble(deMarkerArray[4],4);
   double deMarkerVal5 = NormalizeDouble(deMarkerArray[5],4);

   double deMarkerAvgVal = (deMarkerVal1+deMarkerVal2+deMarkerVal3+deMarkerVal4+deMarkerVal5)/5;


   if(deMarkerVal>deMarkerAvgVal)
     {
      Comment("DeMarker is strong","\n",
              "Current DeMarker Value is ",deMarkerVal,"\n",
              "AVG DeMarker Value is ",deMarkerAvgVal);
     }

   if(deMarkerVal<deMarkerAvgVal)
     {
      Comment("DeMarker is weak","\n",
              "Current DeMarker Value is ",deMarkerVal,"\n",
              "AVG DeMarker Value is ",deMarkerAvgVal);
     }
  }
//+------------------------------------------------------------------+