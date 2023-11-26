namespace Flyweight
{
interface Flyweight;
class Pair
  {
protected:
   string            key;
   Flyweight*        value;
public:
                     Pair(void);
                     Pair(string,Flyweight*);
                    ~Pair(void);
   Flyweight*        Value(void);
   string            Key(void);
  };
Pair::Pair(void){}
Pair::Pair(string a_key,Flyweight *a_value):
   key(a_key),
   value(a_value){}
Pair::~Pair(void)
  {
   delete value;
  }
string Pair::Key(void)
  {
   return key;
  }
Flyweight* Pair::Value(void)
  {
   return value;
  }
class Reference
  {
protected:
   Pair*             pairs[];
public:
                     Reference(void);
                    ~Reference(void);
   void              Add(string,Flyweight*);
   bool              Has(string);
   Flyweight*        operator[](string);
protected:
   int               Find(string);
  };
Reference::Reference(void){}
Reference::~Reference(void)
  {
   int total=ArraySize(pairs);
   for(int i=0; i<total; i++)
     {
      Pair* ipair=pairs[i];
      if(CheckPointer(ipair))
        {
         delete ipair;
        }
     }
  }
int Reference::Find(string key)
  {
   int total=ArraySize(pairs);
   for(int i=0; i<total; i++)
     {
      Pair* ipair=pairs[i];
      if(ipair.Key()==key)
        {
         return i;
        }
     }
   return -1;
  }
bool Reference::Has(string key)
  {
   return (Find(key)>-1)?true:false;
  }
void Reference::Add(string key,Flyweight *value)
  {
   int size=ArraySize(pairs);
   ArrayResize(pairs,size+1);
   pairs[size]=new Pair(key,value);
  }
Flyweight* Reference::operator[](string key)
  {
   int find=Find(key);
   return (find>-1)?pairs[find].Value():NULL;
  }
interface Flyweight
  {
   void Operation(int extrinsic_state);
  };
class ConcreteFlyweight:public Flyweight
  {
public:
   void              Operation(int extrinsic_state);
protected:
   int               intrinsic_state;
  };
void ConcreteFlyweight::Operation(int extrinsic_state)
  {
   intrinsic_state=extrinsic_state;
   Print("The intrinsic state - %d",intrinsic_state);
  }
class UnsharedConcreteFlyweight:public Flyweight
  {
protected:
   int               all_state;
public:
   void              Operation(int extrinsic_state);
  };
void UnsharedConcreteFlyweight::Operation(int extrinsic_state)
  {
   all_state=extrinsic_state;
   Print("all state - %d",all_state);
  }
class FlyweightFactory
  {
protected:
   Reference        pool;
public:
                     FlyweightFactory(void);
   Flyweight*        Flyweight(string key);
  };
FlyweightFactory::FlyweightFactory(void)
  {
   pool.Add("1",new ConcreteFlyweight);
   pool.Add("2",new ConcreteFlyweight);
   pool.Add("3",new ConcreteFlyweight);
  }
Flyweight* FlyweightFactory::Flyweight(string key)
  {
   if(!pool.Has(key))
     {
      pool.Add(key,new ConcreteFlyweight());
     }
   return pool[key];
  }
class Client
  {
public:
   string            Output();
   void              Run();
  };
string Client::Output(void)
  {
   return __FUNCTION__;
  }
void Client::Run(void)
  {
   int extrinsic_state=7;
   Flyweight* flyweight;
   FlyweightFactory factory;
   flyweight=factory.Flyweight("1");
   flyweight.Operation(extrinsic_state);
   flyweight=factory.Flyweight("10");
   flyweight.Operation(extrinsic_state);
   flyweight=new UnsharedConcreteFlyweight();
   flyweight.Operation(extrinsic_state);
   delete flyweight;
  }
}