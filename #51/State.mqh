//+------------------------------------------------------------------+
//|                                                        State.mqh |
//+------------------------------------------------------------------+
class Context;
interface State
  {
   void Handle(Context& context);
  };
State*            m_state;
class Context
  {
public:
                     Context(State& state);
                    ~Context(void);
   State*            State(void) {return m_state;}
   void              State(State& state);
   void              Request(void);
  };
Context::~Context(void)
  {
   if(CheckPointer(m_state)==1)
      delete m_state;
  }
void Context::State(State& state)
  {
   delete m_state;
   m_state=&state;
  }
void Context::Request(void)
  {
   m_state.Handle(this);
  }
  
class ConcreteStateA:public State
  {
public:
   void              Handle(Context& context);
  };
void ConcreteStateA::Handle(Context& context)
  {
   context.State(new ConcreteStateB);
  }
class ConcreteStateB:public State
  {
public:
   void              Handle(Context& context);
  };
void ConcreteStateB::Handle(Context& context)
  {
   context.State(new ConcreteStateA);
  }
  