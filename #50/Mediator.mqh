//+------------------------------------------------------------------+
//|                                                     Mediator.mqh |
//+------------------------------------------------------------------+
interface Colleague
  {
   void Send(string message);
  };
interface Mediator
  {
   void Send(string message,Colleague& colleague);
  };
class ConcreteColleague1:public Colleague
  {
protected:
   Mediator*         m_mediator;
public:
                     ConcreteColleague1(Mediator& mediator);
   void              Notify(string message);
   void              Send(string message);
  };
ConcreteColleague1::ConcreteColleague1(Mediator& meditor):
   m_mediator(&meditor)
  {
  }
void ConcreteColleague1::Notify(string message)
  {
  }
void ConcreteColleague1::Send(string message)
  {
   m_mediator.Send(message,this);
  }
class ConcreteColleague2:public Colleague
  {
protected:
   Mediator*         m_mediator;
public:
                     ConcreteColleague2(Mediator& mediator);
   void              Notify(string message);
   void              Send(string message);
  };
ConcreteColleague2::ConcreteColleague2(Mediator& mediator):
   m_mediator(&mediator)
  {
  }
void ConcreteColleague2::Notify(string message)
  {
  }
void ConcreteColleague2::Send(string message)
  {
   m_mediator.Send(message,this);
  }
class ConcreteMediator:public Mediator
  {
public:
   ConcreteColleague1*  colleague_1;
   ConcreteColleague2*  colleague_2;
   void              Send(string message,Colleague& colleague);
  };
void ConcreteMediator::Send(string message,Colleague& colleague)
  {
   if(colleague_1==&colleague)
      colleague_2.Notify(message);
   else
      colleague_1.Notify(message);
  }