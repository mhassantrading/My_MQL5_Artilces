namespace Builder
{
class Product
  {
public:
   void              Add(string);
   void              Show();
protected:
   string            parts[];
  };
void Product::Add(string part)
  {
   int size=ArraySize(parts);
   ArrayResize(parts,size+1);
   parts[size]=part;
   Print("The product added ",part," to itself");
  }
void Product::Show(void)
  {
   Print("The product shows all parts that it is made of");
   int total=ArraySize(parts);
   for(int i=0; i<total; i++)
      Print(parts[i]);
  }
interface Builder
  {
   void BuildPartA();
   void BuildPartB();
   void BuildPartC();
   Product* GetResult();
  };
class Director
  {
public:
   void              Construct();
                     Director(Builder*);
                    ~Director();
protected:
   Builder*          builder;
  };
void Director::Director(Builder *b)
  {
   builder=b;
   Print("The director created and received the builder ",b);
  }
void Director::~Director(void)
  {
   delete builder;
  }
void Director::Construct(void)
  {
   Print("The director started the construction");
   Print("The director requestd its builder to build the product parts");
   builder.BuildPartA();
   builder.BuildPartB();
   builder.BuildPartC();
   Print("The director's builder constructed the product from parts");
  }
class ConcreteBuilder:public Builder
  {
public:
   void              BuildPartA();
   void              BuildPartB();
   void              BuildPartC();
   Product*          GetResult();
protected:
   Product           product;
  };
void ConcreteBuilder::BuildPartA(void)
  {
   Print("The builder requests the product to add part A to itself");
   product.Add("part a");
   Print("The builder made the part of A and added it to the product");
  }
void ConcreteBuilder::BuildPartB(void)
  {
   Print("The builder requests the product to add part B to itself");
   product.Add("part b");
   Print("The builder made the part of B and added it to the product");
  }
void ConcreteBuilder::BuildPartC(void)
  {
   Print("The builder requests the product to add part C to itself");
   product.Add("part c");
   Print("The builder made part C and added it to the product");
  }
Product* ConcreteBuilder::GetResult(void)
  {
   Print("The builder is returns the product");
   return &product;
  }
class Client
  {
public:
   string            Output();
   void              Run();
  };
string Client::Output() {return __FUNCTION__;}
void Client::Run()
  {
   Print("The client requests to create a new concrete builder");
   Builder* builder=new ConcreteBuilder;
   Print("The client requests to create a director and give him the builder");
   Director director(builder);
   Print("The client requests the director to perform the construction");
   director.Construct();
   Print("The client requests the builder to return the result product");
   Product* product=builder.GetResult();
   Print("The client is requests the product to describe itself");
   product.Show();
  }
}