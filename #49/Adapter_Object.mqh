namespace AdapterObject
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
   Print("The specific Request");
  }
class Adapter:public Target
  {
public:
   void              Request();
protected:
   Adaptee           adaptee;
  };
void Adapter::Request(void)
  {
   Print("The request of Operation requested");
   adaptee.SpecificRequest();
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
   Target* target=new Adapter;
   target.Request();
   delete target;
  }
}