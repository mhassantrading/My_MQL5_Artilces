//+------------------------------------------------------------------+
//|                                                     Strategy.mqh |
//+------------------------------------------------------------------+
interface Strategy
  {
   void AlgorithmInterface(void);
  };
class Context
  {
public:
                     Context(Strategy& strategy);
                    ~Context(void);

   void              ContextInterface(void);
protected:
   Strategy*         m_strategy;
  };
Context::Context(Strategy& strategy)
  {
   m_strategy=&strategy;
  }
Context::~Context(void)
  {
   if(CheckPointer(m_strategy)==1)
      delete m_strategy;
  }
void Context::ContextInterface(void)
  {
   m_strategy.AlgorithmInterface();
  }
class ConcreteStrategyA : public Strategy
  {
public:
   void              AlgorithmInterface(void);
  };
void ConcreteStrategyA::AlgorithmInterface(void)
  {
  }
class ConcreteStrategyB : public Strategy
  {
public:
   void              AlgorithmInterface(void);
  };
void ConcreteStrategyB::AlgorithmInterface(void)
  {
  }
class ConcreteStrategyC : public Strategy
  {
public:
   void              AlgorithmInterface(void);
  };
void ConcreteStrategyC::AlgorithmInterface(void)
  {
  }  