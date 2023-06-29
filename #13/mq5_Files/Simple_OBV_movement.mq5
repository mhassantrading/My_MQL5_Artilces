//+------------------------------------------------------------------+
//|                                          Simple OBV movement.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//creating two arrays for OBV
   double OBVArray1[];
   double OBVArray2[];

//sorting the array from the current data
   ArraySetAsSeries(OBVArray1,true);
   ArraySetAsSeries(OBVArray2,true);

//defining OBV
   int OBVDef =iOBV(_Symbol, _Period,VOLUME_TICK);

//defining EA, buffer, sorting in array
   CopyBuffer(OBVDef,0,0,3,OBVArray1);
   CopyBuffer(OBVDef,0,0,3,OBVArray2);

//getting the value of current and previous OBV
   double OBVCurrentValue=NormalizeDouble(OBVArray1[0],5);
   double OBVPrevValue=NormalizeDouble(OBVArray2[1],5);

//creating conditions of rising and declining OBV based on its values   
   if(OBVCurrentValue>OBVPrevValue)
     {
      Comment("OBV is rising","\n","OBV current is ",OBVCurrentValue,"\n","OBV previous is ",OBVPrevValue);
     }

   if(OBVCurrentValue<OBVPrevValue)
     {
      Comment("OBV is declining","\n","OBV current is ",OBVCurrentValue,"\n","OBV previous is ",OBVPrevValue);
     }

  }
//+------------------------------------------------------------------+
