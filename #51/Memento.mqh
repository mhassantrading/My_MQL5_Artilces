//+------------------------------------------------------------------+
//|                                                      Memento.mqh |
//+------------------------------------------------------------------+
class Memento
  {
protected:
   string            m_state;
public:
   string            GetState(void);
   void              SetState(string);
                     Memento(string);
  };
Memento::Memento(string state):
   m_state(state)
  {
  }
string Memento::GetState(void)
  {
   return m_state;
  }
void Memento::SetState(string state)
  {
   m_state=state;
  }
class Originator
  {
protected:
   string            m_state;
public:
   void              SetMemento(Memento& memento);
   Memento*          CreateMemento(void);
   string            State(void);
   void              State(string);
  };
void Originator::SetMemento(Memento& memento)
  {
   m_state=memento.GetState();
  }
Memento* Originator::CreateMemento(void)
  {
   return new Memento(m_state);
  }
void Originator::State(string state)
  {
   m_state=state;
  }
string Originator::State(void)
  {
   return m_state;
  }
class Caretaker
  {
public:
   Memento*          memento;
                    ~Caretaker(void);
  };
Caretaker::~Caretaker(void)
  {
   if(CheckPointer(memento)==1)
     {
      delete memento;
     }
  }