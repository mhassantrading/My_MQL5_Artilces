//+------------------------------------------------------------------+
//|                                             simpleOrderPanel.mq5 |
//+------------------------------------------------------------------+
#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Trade\Trade.mqh>
#define PANEL_NAME "Order Panel"
#define PANEL_WIDTH 116
#define PANEL_HIEIGHT 100
#define ROW_HEIGHT 20
#define BUY_BTN_NAME "Buy BTN"
#define SELL_BTN_NAME "Sell BTN"
#define CLOSE_BTN_NAME "Close BTN"
#define EDIT_NAME "Lot Size"
CAppDialog panel;
CButton buyBtn;
CButton sellBtn;
CButton closeBtn;
CEdit lotSize;
CTrade trade;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- buy button
   panel.Create(0, PANEL_NAME, 0, 10, 20, 10+PANEL_WIDTH+8, 20+PANEL_HIEIGHT);
   buyBtn.Create(0, BUY_BTN_NAME, 0, 3, 40, 0, 0);
   buyBtn.Width(50);
   buyBtn.Height(ROW_HEIGHT);
   buyBtn.ColorBackground(clrGreen);
   buyBtn.Text("Buy");
   buyBtn.Font("Arial");
   buyBtn.FontSize(10);
   buyBtn.Color(clrBlack);
   buyBtn.ColorBorder(clrBlack);
   panel.Add(buyBtn);
//--- sell button
   sellBtn.Create(0, SELL_BTN_NAME, 0, 63, 40, 0, 0);
   sellBtn.Width(50);
   sellBtn.Height(ROW_HEIGHT);
   sellBtn.ColorBackground(clrRed);
   sellBtn.Text("Sell");
   sellBtn.Font("Arial");
   sellBtn.FontSize(10);
   sellBtn.Color(clrBlack);
   sellBtn.ColorBorder(clrBlack);
   panel.Add(sellBtn);
//--- lotSize
   lotSize.Create(0, EDIT_NAME, 0, 4, 10, 0, 0);
   lotSize.Width(108);
   lotSize.Height(ROW_HEIGHT);
   lotSize.Text("0.01");
   lotSize.Font("Arial");
   lotSize.FontSize(10);
   lotSize.ColorBackground(clrWhite);
   lotSize.Color(clrBlack);
   lotSize.ColorBorder(clrBlack);
   panel.Add(lotSize);
//run the panel
   panel.Run();
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   panel.Destroy();
  }
//+------------------------------------------------------------------+
void  OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
  {
   panel.ChartEvent(id, lparam, dparam, sparam);
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      if(sparam==buyBtn.Name())
        {
         double lot=StringToDouble(lotSize.Text());
         trade.Buy(lot);
        }
      else
         if(sparam==sellBtn.Name())
           {
            double lot=StringToDouble(lotSize.Text());
            trade.Sell(lot);
           }
     }
  }
//+------------------------------------------------------------------+
