//+------------------------------------------------------------------+
//|                                       Simple DeMarker System.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+void OnTick()
void OnTick()
  {
   double deMarkerArray[];

   ArraySetAsSeries(deMarkerArray,true);

   int deMarkerDef = iDeMarker(_Symbol,_Period,14);

   CopyBuffer(deMarkerDef,0,0,3,deMarkerArray);

   double deMarkerVal = NormalizeDouble(deMarkerArray[0],4);


   if(deMarkerVal<=0.30)
     {
      Comment("Oversold","\n",
              "DeMarker Value is ",deMarkerVal);
     }

   if(deMarkerVal>=0.70)
     {
      Comment("Overbought","\n",
              "DeMarker Value is ",deMarkerVal);
     }
   if(deMarkerVal>0.30 && deMarkerVal<0.70)
     {
      Comment("DeMarker Value is ",deMarkerVal);
     }

  }
//+------------------------------------------------------------------+
