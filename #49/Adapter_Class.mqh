namespace AdapterClass
{
interface Target
  {
   void Request();
  };
class Adaptee
  {
public:
   void              SpecificRequest();
  };
void Adaptee::SpecificRequest(void)
  {
   Print("A specific request is executing by the Adaptee");
  }
class Adapter;
class AdapterAsTarget:public Target
  {
public:
   Adapter*          asAdaptee;
   void              Request();
  };
void AdapterAsTarget::Request()
  {
   printf("The Adapter requested Operation");
   asAdaptee.SpecificRequest();
  }
class Adapter:public Adaptee
  {
public:
   AdapterAsTarget*  asTarget;
                     Adapter();
                    ~Adapter();
  };
void Adapter::Adapter(void)
  {
   asTarget=new AdapterAsTarget;
   asTarget.asAdaptee=&this;
  }
void Adapter::~Adapter(void)
  {
   delete asTarget;
  }
class Client
  {
public:
   string            Output();
   void              Run();
  };
string Client::Output()
  {
   return __FUNCTION__;
  }
void Client::Run()
  {
   Adapter adapter;
   Target* target=adapter.asTarget;
   target.Request();
  }
}