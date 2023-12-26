//+------------------------------------------------------------------+
//|                                                      Visitor.mqh |
//+------------------------------------------------------------------+
interface Visitor;
class Element
  {
protected:
   Visitor*          m_visitor;
public:
                    ~Element(void);
   virtual void      Accept(Visitor* visitor)=0;
protected:
   void              Switch(Visitor* visitor);
  };
Element::~Element(void)
  {
   if(CheckPointer(m_visitor)==1)
      delete m_visitor;
  }
void Element::Switch(Visitor *visitor)
  {
   if(CheckPointer(m_visitor)==1)
      delete m_visitor;
   m_visitor=visitor;
  }
class ConcreteElementA : public Element
  {
public:
   void              Accept(Visitor*);
   void              OperationA(void);
  };
void ConcreteElementA::OperationA(void)
  {
  }
void ConcreteElementA::Accept(Visitor *visitor)
  {
   Switch(visitor);
   visitor.VisitElementA(&this);
  }
class ConcreteElementB : public Element
  {
public:
   void              Accept(Visitor* visitor);
   void              OperationB(void);
  };
void ConcreteElementB::OperationB(void)
  {
  }
void ConcreteElementB::Accept(Visitor *visitor)
  {
   Switch(visitor);
   visitor.VisitElementB(&this);
  }
interface Visitor
{
   void VisitElementA(ConcreteElementA*);
   void VisitElementB(ConcreteElementB*);
};
class ConcreteVisitor1 : public Visitor
  {
public:
   void              VisitElementA(ConcreteElementA* visitor);
   void              VisitElementB(ConcreteElementB* visitor);
  };
void ConcreteVisitor1::VisitElementA(ConcreteElementA* visitor)
  {
   visitor.OperationA();
  }
void ConcreteVisitor1::VisitElementB(ConcreteElementB* visitor)
  {
   visitor.OperationB();
  }
class ConcreteVisitor2 : public Visitor
  {
public:
   void              VisitElementA(ConcreteElementA*);
   void              VisitElementB(ConcreteElementB*);
  };
void ConcreteVisitor2::VisitElementA(ConcreteElementA* visitor)
  {
   visitor.OperationA();
  }
void ConcreteVisitor2::VisitElementB(ConcreteElementB* visitor)
  {
   visitor.OperationB();
  }