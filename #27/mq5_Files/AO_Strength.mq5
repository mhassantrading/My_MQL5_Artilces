//+------------------------------------------------------------------+
//|                                                  AO Strength.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
void OnTick()
  {
   double aoArray[];

   ArraySetAsSeries(aoArray,true);

   int aoDef = iAO(_Symbol,_Period);

   CopyBuffer(aoDef,0,0,6,aoArray);


   double aoCurrVal = NormalizeDouble(aoArray[0],6);
   double aoFifthVal = NormalizeDouble(aoArray[1],6);
   double aoFourthVal = NormalizeDouble(aoArray[2],6);
   double aoThirdVal = NormalizeDouble(aoArray[3],6);
   double aoSecondVal = NormalizeDouble(aoArray[4],6);
   double aoFirstVal = NormalizeDouble(aoArray[5],6);

   double aoAvgVal = NormalizeDouble((aoFifthVal+aoFourthVal+aoThirdVal+aoSecondVal+aoFirstVal)/5,6);

   if(aoCurrVal > aoAvgVal)
     {
      Comment("AO Movement is strong","\n",
              "AO CurrVal : ",aoCurrVal,"\n",
              "AO FirstVal : ",aoFifthVal,"\n",
              "AO SecondVal : ",aoFourthVal,"\n",
              "AO ThirdVal : ",aoThirdVal,"\n",
              "AO FourthVal : ",aoSecondVal,"\n",
              "AO FifthVal : ",aoFirstVal,"\n",
              "AO AvgVal : ",aoAvgVal
             );
     }

   if(aoCurrVal < aoAvgVal)
     {
      Comment("AO Movement is Weak","\n",
              "AO CurrVal : ",aoCurrVal,"\n",
              "AO FirstVal : ",aoFifthVal,"\n",
              "AO SecondVal : ",aoFourthVal,"\n",
              "AO ThirdVal : ",aoThirdVal,"\n",
              "AO FourthVal : ",aoSecondVal,"\n",
              "AO FifthVal : ",aoFirstVal,"\n",
              "AO AvgVal : ",aoAvgVal
             );
     }

  }
//+------------------------------------------------------------------+