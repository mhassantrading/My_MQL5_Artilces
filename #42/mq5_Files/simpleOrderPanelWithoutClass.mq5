//+------------------------------------------------------------------+
//|                                             simpleOrderPanel.mq5 |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
CTrade trade;
//+------------------------------------------------------------------+
//|Open trade function creation                                      |
//+------------------------------------------------------------------+
bool openTrade(ENUM_ORDER_TYPE type, double vol)
  {
   double price;
   if(type==ORDER_TYPE_BUY)
     {
      price=SymbolInfoDouble(Symbol(), SYMBOL_ASK);
     }
   else
      price=SymbolInfoDouble(Symbol(), SYMBOL_BID);
   return trade.PositionOpen(Symbol(), type, vol, price, 0, 0, "");
  }
//   set the panel location
const ENUM_BASE_CORNER panelLoc=CORNER_LEFT_UPPER;
//--- setting x and y
const int xMargin=20;
const int yMargin=20;
//--- setting space between elements
const int xSpace=10;
const int ySpace=10;
//--- setting size of elements
const int btnWidth=50;
const int btnHeight=20;
const int txtWidth=(btnWidth*2)+xSpace;
const int txtHeight=20;
//--- setting locations of txt and btn
const int txtX=3;
const int txtY=yMargin+txtHeight;
const int buyX=3;
const int buyY=txtY+ySpace+btnHeight;
//--- sell btn
const int sellX=buyX+xSpace+btnWidth;
const int sellY=txtY+ySpace+btnHeight;
//--- setting name of elements
const string txtName="txttVol";
const string buyName="buyBtn";
const string sellName="sellBtn";
//--- setting initial lot size
double lotSize=0.01;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- call createPanel function
   createPanel();
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- delete objcets
   ObjectDelete(0, txtName);
   ObjectDelete(0, buyName);
   ObjectDelete(0, sellName);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
  }
//+------------------------------------------------------------------+
//| Interaction function                                             |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
  {
//--- If the event id is equal to the end of text editing in the panel and the string type event is equal to the text name
   if(id==CHARTEVENT_OBJECT_ENDEDIT && sparam==txtName)
     {
      //--- lotTxt string variable will be equal to the returned property value by using the ObjectGetString function
      string lotTxt=ObjectGetString(0, txtName, OBJPROP_TEXT);
      //--- call setLot function that we will create later with the lotTxt value
      setLot(lotTxt);
      //Setting the property value by using the ObjectSetString
      ObjectSetString(0, txtName, OBJPROP_TEXT, string(lotSize));
      //--- Use return
      return;
     }
//--- If the event id is equal to the object click to check if we click the buy button
   else
      if(id==CHARTEVENT_OBJECT_CLICK)
        {
         //We will check if the string param is equal to buyname
         if(sparam==buyName)
           {
            //--- Setting the value of the property by using the ObjectSetInteger
            ObjectSetInteger(0, buyName, OBJPROP_STATE, false);
            //Calling the created openTrade to open a buy order.
            openTrade(ORDER_TYPE_BUY, lotSize);
            //--- Use return
            return;
           }
         //--- If the event id is equal to the object click to check if we click the sell button
         //--- We will check if the string param is equal to sellname
         else
            if(sparam==sellName)
              {
               //--- Setting the value of the property by using the ObjectSetInteger
               ObjectSetInteger(0, sellName, OBJPROP_STATE, false);
               //Calling the created openTrade to open a sell order
               openTrade(ORDER_TYPE_SELL, lotSize);
               //--- Use return
               return;
              }
        }
  }
//+------------------------------------------------------------------+
//|createPanel function                                              |
//+------------------------------------------------------------------+
void createPanel()
  {
//--- Delete objects of txtName, buyName, and sellName
   ObjectDelete(0, txtName);
   ObjectDelete(0, buyName);
   ObjectDelete(0, sellName);
//--- calling the EditCreate function
   EditCreate(             // Parameters:
      0,                   // const long (chart_ID): to specify the chart's ID, we will use (0).
      txtName,             // const string (name): to specify the button name,  we will use (txtName)
      0,                   // const int (sub_window): to specify the subwindow index, we will use (0) for the main window
      txtX,                // const int (x): to specify the X coordinate, we will use (txtX)
      txtY,                // const int (y): to specify the Y coordinate, we will use (txtY)
      txtWidth,            // const int (width):to specify the button width, we will use (txtWidth)
      txtHeight,           // const int (height): to specify the button height, we will use (txtHeight)
      string(lotSize),     // const string (text): to specify the text, we will use (lotSize)
      "Arial",             // const string (font): to specify the font, we will use "Arial"
      10,                  // const int (font_size): to specify the font size, we will use (10)
      ALIGN_LEFT,          // const ENUM_ALIGN_MODE (align_mode): to specify the position of text, we will use (ALIGN_LEFT)
      false,               // const bool (read_only=false): to specify the ability to edit, we will be (false)
      panelLoc,            // const ENUM_BASE_CORNER (corner): to specify the chart corner for anchoring, we will call panelLoc function
      clrBlack,            // const color (clr): to specify the text color, we will specify clrBlack
      clrWhite,            // const color (back_clr): to specify the background color, we will specify clrWhite
      clrBlack,            // const color (border_clr): to specify the border color, we will specify clrBlack
      false,               // const bool (back=false): in the background, we will set false
      false,               // const bool (selection=false): highlight to move, we will set false
      false,               // const bool (hidden): hidden in the object list, we will set false
      0);                  // const long (z_order=0): priority for a mouse click, we will use (0)
//--- calling the ButtonCreate function for the buy
   ButtonCreate(           // Parameters:
      0,                   // const long (chart_ID): to specify the chart's ID, we will use (0)
      buyName,             // const string (name): to specify the button name, we will use (buyName) for the buy button
      0,                   // const int (sub_window): to specify the subwindow index, we will use (0) for the main window
      buyX,                // const int (x): to specify the X coordinate, we will use (buyX) for buy
      buyY,                // const int (y): to specify the Y coordinate, we will use (buyY) for buy
      btnWidth,            // const int (width): to specify the button width, we will use (btnWidth) for buy
      btnHeight,           // const int (height): to specify the button height, we will use (btnHeight) for buy
      panelLoc,            // const ENUM_BASE_CORNER (corner): to specify the chart corner for anchoring, we will call panelLoc function for buy button
      "Buy",               // const string (text): to specify the text, we will use ("Buy") for the buy button
      "Arial",             // const string (font): to specify the font, we will use "Arial"
      10,                  // const int (font_size): to specify the font size, we will use (10)
      clrBlack,            // const color (clr): to specify the text color, we will specify clrBlack
      clrGreen,            // const color (back_clr): to specify the background color, we will specify clrGreen for the buy button
      clrBlack,            // const color (border_clr): to specify the border color, we will specify clrBlack
      false,               // const bool (state): to specify if the object is pressed or released, we will specify false
      false,               // const bool (back=false): in the background, we will set false
      false,               // const bool (selection=false): highlight to move, we will set false
      false,               // const bool (hidden): hidden in the object list, we will set false
      0);                  // const long (z_order=0): priority for mouse click, we will use (0) for buy button
//--- calling the ButtonCreate function for the sell
   ButtonCreate(          //Parameters:
      0,                   //const long (chart_ID): to specify the chart's ID, we will use (0)
      sellName,            //const string (name): to specify the button name, we will use (sellName) for the sell button
      0,                   //const int (sub_window): to specify the subwindow index, we will use (0) for the main window
      sellX,               //const int (x): to specify the X coordinate, we will use (sellX) for sell
      sellY,               //const int (y): to specify the Y coordinate, we will use (sellY)
      btnWidth,            //const int (width): to specify the button width, we will use (btnWidth) for sell
      btnHeight,           //const int (height): to specify the button height, we will use (btnHeight) for sell
      panelLoc,            //const ENUM_BASE_CORNER (corner): to specify the chart corner for anchoring, we will call panelLoc function for sell button
      "Sell",              //const string (text): to specify the text, we will use ("Sell") for the sell button
      "Arial",             //const string (font): to specify the font, we will use "Arial"
      10,                  //const int (font_size): to specify the font size, we will use (10)
      clrBlack,            //const color (clr): to specify the text color, we will specify clrBlack
      clrRed,              //const color (back_clr): to specify the background color, we will specify clrRed for the sell button
      clrBlack,            //const color (border_clr): to specify the border color, we will specify clrBlack
      false,               //const bool (state): to specify if the object is pressed or released, we will specify false
      false,               //const bool (back=false): in the background, we will set false
      false,               //const bool (selection=false): highlight to move, we will set false
      false,               //const bool (hidden): hidden in the object list, we will set false
      0);                  //const long (z_order=0): priority for mouse click, we will use (0) for sell button
  }
//+------------------------------------------------------------------+
//| setLot function                                                  |
//+------------------------------------------------------------------+
void setLot(string lotTxt)
  {
   double newLot=StringToDouble(lotTxt);
   if(newLot<0)
     {
      Print("Invaid Volume Specified");
      return;
     }
   lotSize=newLot;
  }
//+------------------------------------------------------------------+
//|EditCreate function                                               |
//+------------------------------------------------------------------+
bool EditCreate(const long             chart_ID=0,
                const string           name="Edit",
                const int              sub_window=0,
                const int              x=0,
                const int              y=0,
                const int              width=50,
                const int              height=18,
                const string           text="Text",
                const string           font="Arial",
                const int              font_size=10,
                const ENUM_ALIGN_MODE  align=ALIGN_CENTER,
                const bool             read_only=false,
                const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER,
                const color            clr=clrBlack,
                const color            back_clr=clrWhite,
                const color            border_clr=clrNONE,
                const bool             back=false,
                const bool             selection=false,
                const bool             hidden=true,
                const long             z_order=0)
  {
//--- Reset the error value by using ResetLastError()
   ResetLastError();
//--- Create an edit field
   if(!ObjectCreate(chart_ID, name, OBJ_EDIT, sub_window, 0, 0))
     {
      Print(__FUNCTION__,
            ": failed to create \"Edit\" object! Error code = ", GetLastError());
      return(false);
     }
//--- Setting the object coordinates x and y by using the ObjectSetInteger
   ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
//--- Setting the object size by using the ObjectSetInteger function also
   ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width);
   ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height);
//--- Setting the text by using ObjectSetString function
   ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
//--- Setting the text font by using the ObjectSetString function also
   ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
//--- Setting the font size by using the ObjectSetInteger function
   ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
//--- Setting the type of text alignment in the object
   ObjectSetInteger(chart_ID, name, OBJPROP_ALIGN, align);
//--- Setting the ability to edit, enable if it is (true) or cancel (false) if you need a read-only mode
   ObjectSetInteger(chart_ID, name, OBJPROP_READONLY, read_only);
//--- Setting the chart's corner, relative to which object coordinates are defined to set the location of the object.
   ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner);
//--- Setting the text color
   ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
//--- Setting the background color
   ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr);
//--- Setting the border color of the object
   ObjectSetInteger(chart_ID, name, OBJPROP_BORDER_COLOR, border_clr);
//--- Displaying in the foreground by (false) or in the background by (true)
   ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
//--- Setting (true) to enable or (false) to disable the mode of moving the label by mouse
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
//--- Setting (true) if you need hiding or (false) if you need the display of graphical object name in the object list
   ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
//--- Setting the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
//--- Returning (true) if successful execution
   return(true);
  }
//+------------------------------------------------------------------+
//| ButtonCreate function                                            |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,
                  const string            name="Button",
                  const int               sub_window=0,
                  const int               x=0,
                  const int               y=0,
                  const int               width=50,
                  const int               height=18,
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER,
                  const string            text="Button",
                  const string            font="Arial",
                  const int               font_size=10,
                  const color             clr=clrBlack,
                  const color             back_clr=C'236,233,216',
                  const color             border_clr=clrNONE,
                  const bool              state=false,
                  const bool              back=false,
                  const bool              selection=false,
                  const bool              hidden=true,
                  const long              z_order=0)
  {
   ResetLastError();
   if(!ObjectCreate(chart_ID, name, OBJ_BUTTON, sub_window, 0, 0))
     {
      Print(__FUNCTION__,
            ": failed to create the button! Error code = ", GetLastError());
      return(false);
     }
   ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y);
   ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width);
   ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height);
   ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner);
   ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
   ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
   ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
   ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
   ObjectSetInteger(chart_ID, name, OBJPROP_BGCOLOR, back_clr);
   ObjectSetInteger(chart_ID, name, OBJPROP_BORDER_COLOR, border_clr);
   ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
   ObjectSetInteger(chart_ID, name, OBJPROP_STATE, state);
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
   ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
   ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
   ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
   return(true);
  }
//+------------------------------------------------------------------+
