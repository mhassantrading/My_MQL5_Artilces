namespace AbstractFactory
{
interface AbstractProductA
  {
  };
interface AbstractProductB
  {
   void Interact(AbstractProductA*);
  };
interface AbstractFactory
  {
   AbstractProductA* CreateProductA(void);
   AbstractProductB* CreateProductB(void);
  };
class ProductA1:public AbstractProductA
  {
public:
                     ProductA1(void);
  };
void ProductA1::ProductA1(void) 
{
Print("Product A1 is constructed");
}
class ProductA2:public AbstractProductA
  {
public:
                     ProductA2(void);
  };
void ProductA2::ProductA2(void) 
{
Print("Product A2 is constructed");
}
class ProductB1:public AbstractProductB
  {
public:
                     ProductB1(void);
   void              Interact(AbstractProductA*);
  };
void ProductB1::ProductB1(void) 
{
Print("Product B1 is constructed");
}
void ProductB1::Interact(AbstractProductA*src)
  {
   Print("Product B1: ",&this," is interacting with Product A: ",src);
  }
class ProductB2:public AbstractProductB
  {
public:
                     ProductB2(void);
   void              Interact(AbstractProductA*);
  };
void ProductB2::ProductB2(void) 
{
Print("Product B2 is constructed");
}
void ProductB2::Interact(AbstractProductA*src)
  {
   Print("Product B2: ",&this," is interacting with Product A: ",src);
  }
class Factory1:public AbstractFactory
  {
public:
                     Factory1(void);
   AbstractProductA* CreateProductA(void);
   AbstractProductB* CreateProductB(void);
  };
void Factory1::Factory1(void)
  {
   Print("Factory 1: ",&this," is constructed");
  }
AbstractProductA* Factory1::CreateProductA(void)
  {
   Print("Factory 1 creates and returns Product A1");
   return new ProductA1;
  }
AbstractProductB* Factory1::CreateProductB(void)
  {
   Print("Factory 1 creates and returns Product B1");
   return new ProductB1;
  }
class Factory2:public AbstractFactory
  {
public:
                     Factory2(void);
   AbstractProductA* CreateProductA(void);
   AbstractProductB* CreateProductB(void);
  };
void Factory2::Factory2(void)
  {
   Print("Factory 2: ",&this," is constructed");
  }
AbstractProductA* Factory2::CreateProductA(void)
  {
   Print("Factory 2 creates and returns Product A2");
   return new ProductA2;
  }
AbstractProductB* Factory2::CreateProductB(void)
  {
   Print("Factory 2 creates and returns Product B2");
   return new ProductB2;
  }
class FactoryClient
  {
public:
   void              Run(void);
   void              Switch(AbstractFactory*);
                     FactoryClient(AbstractFactory*);
                    ~FactoryClient(void);
protected:
   AbstractProductA* apa;
   AbstractProductB* apb;
   AbstractFactory*  factory;
   void              Delete(void);
  };
void FactoryClient::FactoryClient(AbstractFactory* af)
  {
   Print("Factory client created and received Abstract Factory ",af);
   Print("Factory client requests to accept/switch the factories");
   Switch(af);
  }
void FactoryClient::~FactoryClient(void)
  {
   Delete();
  }
void FactoryClient::Run(void)
  {
   Print("Factory client runs the abstract Product B");
   apb.Interact(apa);
  }
void FactoryClient::Delete(void)
  {
   delete apa;
   delete apb;
   delete factory;
  }
void FactoryClient::Switch(AbstractFactory *af)
  {
   string sFactory;
   StringConcatenate(sFactory,sFactory,factory);
   int iFactory=(int)StringToInteger(sFactory);
   if(iFactory>0)
     {
      Print("Factory client switches the old factory ",factory," to the new one ",af);
     }
   else
     {
      Print("Factory client accepts the new factory ",af);
     }
   Delete();
   factory=af;
   Print("Factory client saved the new factory");
   Print("Factory client requests its new factory to create the Product A");
   apa=factory.CreateProductA();
   Print("Factory client requests its new factory to create the Product B");
   apb=factory.CreateProductB();
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
   Print("The client requests to create the Factory 1");
   Print("The client requests to create the Factory client");
   Print("The client requests the Factory client to manage the Factory 1");
   FactoryClient client(new Factory1);
   Print("The client requests the Factory client to operate");
   client.Run();
   Print("The client requests to create the new factory 2 and asks the factory client to switch factories");
   client.Switch(new Factory2);
   Print("The client requests the Factory client to run again");
   client.Run();
  }
}