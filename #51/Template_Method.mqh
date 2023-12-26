//+------------------------------------------------------------------+
//|                                              Template_Method.mqh |
//+------------------------------------------------------------------+
class AbstractClass
  {
public:
   virtual void      PrimitiveOperation1(void)=0;
   virtual void      PrimitiveOperation2(void)=0;
   virtual void      TemplateMethod(void);
  };
void AbstractClass::TemplateMethod(void)
  {
   PrimitiveOperation1();
   PrimitiveOperation2();
  }
  class ConcreteClass : public AbstractClass
  {
public:
   void              PrimitiveOperation1(void);
   void              PrimitiveOperation2(void);
  };
void ConcreteClass::PrimitiveOperation1(void)
  {
  }
void ConcreteClass::PrimitiveOperation2(void)
  {
  }