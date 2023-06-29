//+------------------------------------------------------------------+
//|                                          Simple OBV Strength.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //creating an five arrays for OBV
   double OBVArray0[];
   double OBVArray1[];
   double OBVArray2[];
   double OBVArray3[];
   double OBVArray4[];
   
   //sorting arrays from the current data
   ArraySetAsSeries(OBVArray0,true);   
   ArraySetAsSeries(OBVArray1,true);
   ArraySetAsSeries(OBVArray2,true);
   ArraySetAsSeries(OBVArray3,true);
   ArraySetAsSeries(OBVArray4,true);
   
   //defining OBV
   int OBVDef =iOBV(_Symbol, _Period,VOLUME_TICK);
   
   //defining EA, buffer, sorting in arrays
   CopyBuffer(OBVDef,0,0,5,OBVArray0);
   CopyBuffer(OBVDef,0,0,5,OBVArray1);
   CopyBuffer(OBVDef,0,0,5,OBVArray2);
   CopyBuffer(OBVDef,0,0,5,OBVArray3);
   CopyBuffer(OBVDef,0,0,5,OBVArray4);
   
   //getting the value of current OBV & previous 4 values
   double OBVCurrentValue=NormalizeDouble(OBVArray0[0],5);         
   double OBVPrevValue1=NormalizeDouble(OBVArray1[1],5);
   double OBVPrevValue2=NormalizeDouble(OBVArray2[2],5);
   double OBVPrevValue3=NormalizeDouble(OBVArray3[3],5);
   double OBVPrevValue4=NormalizeDouble(OBVArray4[4],5);
   
   //calculating average of previous OBV value
   double OBVAVG=((OBVPrevValue1+OBVPrevValue2+OBVPrevValue3+OBVPrevValue4)/4);
   
   if(OBVCurrentValue>OBVAVG)
   {
      Comment("OBV is strong","\n","OBV current is ",OBVCurrentValue,"\n","OBV Average is ",OBVAVG,"\n","Previous four OBV Values: ", 
      "\n", "1= ",OBVPrevValue1,"\n", "2= ",OBVPrevValue2,"\n", "3= ",OBVPrevValue3,"\n", "4= ",OBVPrevValue4);
   }
   
   if(OBVCurrentValue<OBVAVG)
   {
      Comment("OBV is weak","\n","OBV current is ",OBVCurrentValue,"\n","OBV Average is ",OBVAVG,"\n","Previous four OBV Values: ",
      "\n", "1= ",OBVPrevValue1,"\n", "2= ",OBVPrevValue2,"\n", "3= ",OBVPrevValue3,"\n", "4= ",OBVPrevValue4);
   }
   
  }
//+------------------------------------------------------------------+
