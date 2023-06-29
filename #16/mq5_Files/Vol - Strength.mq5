//+------------------------------------------------------------------+
//|                                               Vol - Strength.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
//Create an array for Volume
   double VolArray[];

//sorting the array from the current data
   ArraySetAsSeries(VolArray,true);

//defining Volume
   int VolDef=iVolumes(_Symbol,_Period,VOLUME_TICK);

//filling the array
   CopyBuffer(VolDef,0,0,11,VolArray);

//calculating current vol && 5 previous volume values
   double VolCurrentValue=NormalizeDouble(VolArray[0],5);
   double VolPrevValue1=NormalizeDouble(VolArray[1],5);
   double VolPrevValue2=NormalizeDouble(VolArray[2],5);
   double VolPrevValue3=NormalizeDouble(VolArray[3],5);
   double VolPrevValue4=NormalizeDouble(VolArray[4],5);
   double VolPrevValue5=NormalizeDouble(VolArray[5],5);


//calculating AVG of 5 previous volume values
   double VolAVGVal=((VolPrevValue1+VolPrevValue2+VolPrevValue3+VolPrevValue4+VolPrevValue5)/5);

//conditions of Volume strength based on comparing current to AVG
//strong volume
   if(VolCurrentValue>VolAVGVal)
     {
      Comment("Strong volume","\n","Current volume is : ",VolCurrentValue,"\n",
              "Volume prev 1 is : ",VolPrevValue1,"\n",
              "Volume prev 2 is : ",VolPrevValue2,"\n",
              "Volume prev 3 is : ",VolPrevValue3,"\n",
              "Volume prev 4 is : ",VolPrevValue4,"\n",
              "Volume prev 5 is : ",VolPrevValue5,"\n",
              "AVG volume is : ",VolAVGVal);
     }

//weak volume
   if(VolCurrentValue<VolAVGVal)
     {
      Comment("Weak volume","\n","Current volume is : ",VolCurrentValue,"\n",
              "Volume prev 1 is : ",VolPrevValue1,"\n",
              "Volume prev 2 is : ",VolPrevValue2,"\n",
              "Volume prev 3 is : ",VolPrevValue3,"\n",
              "Volume prev 4 is : ",VolPrevValue4,"\n",
              "Volume prev 5 is : ",VolPrevValue5,"\n",
              "AVG volume is : ",VolAVGVal);
     }
  }
//+------------------------------------------------------------------+
