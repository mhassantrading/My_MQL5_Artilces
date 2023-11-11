namespace FactoryMethod
{
interface Product
  {
  };
class ConcreteProduct:public Product
  {
public:
                     ConcreteProduct(void);
  };
ConcreteProduct::ConcreteProduct(void)
  {
   Print("The concrete product: ",&this," created");
  }
class Creator
  {
public:
   virtual Product*  FactoryMethod(void)=0;
   void              AnOperation(void);
                    ~Creator(void);
protected:
   Product*          product;
  };
Creator::~Creator(void) {delete product;}
void Creator::AnOperation(void)
  {
   Print("The creator runs its operation");
   delete product;
   product=FactoryMethod();
   Print("The creator saved the product that received from the virtual factory method");
  }
class ConcreteCreator:public Creator
  {
public:
   Product*          FactoryMethod(void);
  };
Product* ConcreteCreator::FactoryMethod(void)
  {
   Print("The creator runs the factory method");
   Print("The concrete creator creates and returns the new concrete product");
   return new ConcreteProduct;
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
   Print("requests to make the creator");
   ConcreteCreator creator;
   Print("requests the creator to run its factory method to return the product");
   Product* product=creator.FactoryMethod();
   Print("requests the creator to run its operation");
   creator.AnOperation();
   delete product;
  }
}