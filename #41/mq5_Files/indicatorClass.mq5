//+------------------------------------------------------------------+
//declare the class
class CiMA
  {
public:
   string            MAType;
   double            MAArray[];
   int               MAHandle;
   double            MAValue;
   void              valuePrint()
     {
      Print(MAType, " Current Value: ", MAValue);
     };
  };
//objects
//--- SMA
CiMA CSma;
CiMA CSmaHandle;
CiMA CSmaArray;
//--- EMA
CiMA CEma;
CiMA CEmaHandle;
CiMA CEmaArray;
//--- SMMA
CiMA CSmma;
CiMA CSmmaHandle;
CiMA CSmmaArray;
//--- LWMA
CiMA CLwma;
CiMA CLwmaHandle;
CiMA CLwmaArray;
//+------------------------------------------------------------------+
int OnInit()
  {
//--- SMA
   CSma.MAType="Simple MA";
   CSmaHandle.MAHandle=iMA(_Symbol, PERIOD_CURRENT, 10, 0, MODE_SMA, PRICE_CLOSE);
   ArraySetAsSeries(CSmaArray.MAArray, true);
   CopyBuffer(CSmaHandle.MAHandle, 0, 0, 3, CSmaArray.MAArray);
   CSma.MAValue=NormalizeDouble(CSmaArray.MAArray[1], _Digits);
   CSma.valuePrint();
//--- EMA
   CEma.MAType="Exponential MA";
   CEmaHandle.MAHandle=iMA(_Symbol, PERIOD_CURRENT, 10, 0, MODE_EMA, PRICE_CLOSE);
   ArraySetAsSeries(CEmaArray.MAArray, true);
   CopyBuffer(CEmaHandle.MAHandle, 0, 0, 3, CEmaArray.MAArray);
   CEma.MAValue=NormalizeDouble(CEmaArray.MAArray[1], _Digits);
   CEma.valuePrint();
//--- SMMA
   CSmma.MAType="Smoothed MA";
   CSmmaHandle.MAHandle=iMA(_Symbol, PERIOD_CURRENT, 10, 0, MODE_SMMA, PRICE_CLOSE);
   ArraySetAsSeries(CSmmaArray.MAArray, true);
   CopyBuffer(CSmmaHandle.MAHandle, 0, 0, 3, CSmmaArray.MAArray);
   CSmma.MAValue=NormalizeDouble(CSmmaArray.MAArray[1], _Digits);
   CSmma.valuePrint();
//---- LWMA
   CLwma.MAType="Linear-weighted MA";
   CLwmaHandle.MAHandle=iMA(_Symbol, PERIOD_CURRENT, 10, 0, MODE_LWMA, PRICE_CLOSE);
   ArraySetAsSeries(CLwmaArray.MAArray, true);
   CopyBuffer(CLwmaHandle.MAHandle, 0, 0, 3, CLwmaArray.MAArray);
   CLwma.MAValue=NormalizeDouble(CLwmaArray.MAArray[1], _Digits);
   CLwma.valuePrint();
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+

