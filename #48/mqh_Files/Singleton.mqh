namespace Singleton
{
class Singleton
  {
public:
   static Singleton* Instance(void);
   void              SingletonOperation(void);
   string            GetSingletonData(void);
protected:
                     Singleton(void);
   static Singleton* uniqueInstance;
   string            singletonData;
  };
Singleton* Singleton::uniqueInstance=NULL;
Singleton::Singleton(void)
  {
   Print("The singleton ",&this," is created");
  }
void Singleton::SingletonOperation(void)
  {
   Print("runs the singleton operation > setting singleton data");
   singletonData="singleton data";
  }
string Singleton::GetSingletonData(void)
  {
   Print("reads and returns the singleton data");
   return singletonData;
  }
Singleton* Singleton::Instance(void)
  {
   Print("The singleton instance method runs");
   if(!CheckPointer(uniqueInstance))
     {
      Print("The unique instance of the singleton is an empty");
      uniqueInstance=new Singleton;
      Print("singleton assigned to unique instance");
     }
   Print("The unique instance contains singleton: ",uniqueInstance);
   Print("returns the unique instance ",uniqueInstance," of the singleton");
   return uniqueInstance;
  }
class Client
  {
public:
   string            Output(void);
   void              Run(void);
  };
string Client::Output(void) {return __FUNCTION__;}
void Client::Run(void)
  {
   Print("requests the singleton instance 1");
   Singleton* instance1=Singleton::Instance();
   Print("requests the singleton instance 2");
   Singleton* instance2=Singleton::Instance();
   string compareInstances=
      (instance1==instance2)?
      "instances 1 and instance 2 are the same objects":
      "instances are different objects";
   Print(compareInstances);
   Print("requests singleton operation on the instance 1");
   instance1.SingletonOperation();
   Print("requests singleton data by the singleton instance 2");
   string singletonData=instance2.GetSingletonData();
   Print(singletonData);
   delete instance1;
  }
}