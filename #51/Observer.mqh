//+------------------------------------------------------------------+
//|                                                     Observer.mqh |
//+------------------------------------------------------------------+
interface Observer
  {
   void Update(string state);
  };
class Subject
  {
public:
                     Subject(void);
                    ~Subject(void);
   void              Attach(Observer* observer);
   void              Detach(Observer& observer);
   void              Notify(void);
   void              State(string state);
   string            State(void) {return m_state;}

protected:
   string            m_state;
   Observer*         m_observers[];

   int               Find(Observer& observer);
  };
Subject::Subject(void):
   m_state(NULL)
  {
  }
Subject::~Subject(void)
  {
   int itotal=ArraySize(m_observers);
   for(int i=0; i<itotal; i++)
     {
      Observer* item=m_observers[i];
      if(CheckPointer(item)==1)
        {
         delete item;
        }
     }
  }
void Subject::State(string state)
  {
   m_state=state;
  }
void Subject::Notify(void)
  {
   int itotal=ArraySize(m_observers);
   for(int i=0; i<itotal; i++)
     {
      m_observers[i].Update(m_state);
     }
  }
void Subject::Attach(Observer *observer)
  {
   int size=ArraySize(m_observers);
   ArrayResize(m_observers,size+1);
   m_observers[size]=observer;
  }
void Subject::Detach(Observer &observer)
  {
   int find=Find(observer);
   if(find==-1)
      return;
   Observer* item=m_observers[find];
   if(CheckPointer(item)==1)
      delete item;
   ArrayRemove(m_observers,find,1);
  }
int Subject::Find(Observer &observer)
  {
   int itotal=ArraySize(m_observers);
   for(int i=0; i<itotal; i++)
     {
      Observer* item=m_observers[i];
      if(item==&observer)
         return i;
     }
   return -1;
  }
class ConcreteSubject:public Subject
  {
  public:
   void              State(string state);
   string            State(void) {return m_state;}
  };
void ConcreteSubject::State(string state)
  {
   m_state=state;
  }  
class ConcreteObserver:public Observer
  {
public:
   void              Update(string state);
                     ConcreteObserver(ConcreteSubject& subject);
protected:
   string            m_observer_state;
   ConcreteSubject*  m_subject;
  };
ConcreteObserver::ConcreteObserver(ConcreteSubject& subject):
   m_subject(&subject)
  {
  }
void ConcreteObserver::Update(string state)
  {
   m_observer_state=state;
  }