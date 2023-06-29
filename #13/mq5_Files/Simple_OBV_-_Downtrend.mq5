//+------------------------------------------------------------------+
//|                                       Simple OBV - Downtrend.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   //create a string variable for signal
   string signal="";
   
   //creating two OBV arrays
   double OBVArray0[];
   double OBVArray1[];
   
   //creating two price arrays
   MqlRates PriceArray0[];
   MqlRates PriceArray1[];
   
   //sorting OBV arrays from the current data
   ArraySetAsSeries(OBVArray0,true);   
   ArraySetAsSeries(OBVArray1,true);   
   
   //sorting Price arrays from the current data
   ArraySetAsSeries(PriceArray0,true);
   ArraySetAsSeries(PriceArray1,true);     
      
   //fill price arrays with price data
   int Data0=CopyRates(_Symbol,_Period,0,3,PriceArray0);
   int Data1=CopyRates(_Symbol,_Period,0,3,PriceArray1);
   
   //defining OBV
   int OBVDef =iOBV(_Symbol, _Period,VOLUME_TICK);

   //defining EA, buffer, sorting in arrays
   CopyBuffer(OBVDef,0,0,3,OBVArray0);
   CopyBuffer(OBVDef,0,0,3,OBVArray1);
            
   //getting the value of current OBV & the previous value
   double OBVCurrentValue=NormalizeDouble(OBVArray0[0],5);         
   double OBVPrevValue=NormalizeDouble(OBVArray1[1],5);
    
   //getting the value of current OBV & the previous value
   double CurrentLowValue=NormalizeDouble(PriceArray0[0].low,5);         
   double PrevLowValue=NormalizeDouble(PriceArray1[1].low,5); 
       
   //strong move signal
   //if OBVCurrentValue>OBVPrevValue && current low> previous low
   if(OBVCurrentValue < OBVPrevValue && PriceArray0[0].low<PriceArray0[1].low)
   {
      signal="Strong move during downtrend";
   }

   //comment with the signal
   Comment("The signal is ",signal,"\n","OBVCurrentValue is :",OBVCurrentValue,
   "\n","OBVPrevValue is :", OBVPrevValue,"\n","Current low is :",CurrentLowValue,"\n","Previous low is :",PrevLowValue);            
  }
//+------------------------------------------------------------------+
