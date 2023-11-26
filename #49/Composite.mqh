namespace Composite
{
class Component
  {
public:
   virtual void      Operation(void)=0;
   virtual void      Add(Component*)=0;
   virtual void      Remove(Component*)=0;
   virtual Component*   GetChild(int)=0;
                     Component(void);
                     Component(string);
protected:
   string            name;
  };
Component::Component(void) {}
Component::Component(string a_name):name(a_name) {}
#define ERR_INVALID_OPERATION_EXCEPTION   1
class Leaf:public Component
  {
public:
   void              Operation(void);
   void              Add(Component*);
   void              Remove(Component*);
   Component*        GetChild(int);
                     Leaf(string);
  };
void Leaf::Leaf(string a_name):Component(a_name) {}
void Leaf::Operation(void)
  {
   Print(name);
  }
void Leaf::Add(Component*)
  {
   SetUserError(ERR_INVALID_OPERATION_EXCEPTION);
  }
void Leaf::Remove(Component*)
  {
   SetUserError(ERR_INVALID_OPERATION_EXCEPTION);
  }
Component* Leaf::GetChild(int)
  {
   SetUserError(ERR_INVALID_OPERATION_EXCEPTION);
   return NULL;
  }
class Composite:public Component
  {
public:
   void              Operation(void);
   void              Add(Component*);
   void              Remove(Component*);
   Component*        GetChild(int);
                     Composite(string);
                    ~Composite(void);
protected:
   Component*        nodes[];
  };
Composite::Composite(string a_name):Component(a_name) {}
Composite::~Composite(void)
  {
   int total=ArraySize(nodes);
   for(int i=0; i<total; i++)
     {
      Component* i_node=nodes[i];
      if(CheckPointer(i_node)==1)
        {
         delete i_node;
        }
     }
  }
void Composite::Operation(void)
  {
   Print(name);
   int total=ArraySize(nodes);
   for(int i=0; i<total; i++)
     {
      nodes[i].Operation();
     }
  }
void Composite::Add(Component *src)
  {
   int size=ArraySize(nodes);
   ArrayResize(nodes,size+1);
   nodes[size]=src;
  }
void Composite::Remove(Component *src)
  {
   int find=-1;
   int total=ArraySize(nodes);
   for(int i=0; i<total; i++)
     {
      if(nodes[i]==src)
        {
         find=i;
         break;
        }
     }
   if(find>-1)
     {
      ArrayRemove(nodes,find,1);
     }
  }
Component* Composite::GetChild(int i)
  {
   return nodes[i];
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
   Component* root=new Composite("root");
   Component* branch1=new Composite("The branch 1");
   Component* branch2=new Composite("The branch 2");
   Component* leaf1=new Leaf("The leaf 1");
   Component* leaf2=new Leaf("The leaf 2");
   root.Add(branch1);
   root.Add(branch2);
   branch1.Add(leaf1);
   branch1.Add(leaf2);
   branch2.Add(leaf2);
   branch2.Add(new Leaf("The leaf 3"));
   Print("The tree");
   root.Operation();
   root.Remove(branch1); 
   Print("Removing one branch");
   root.Operation();
   delete root;
   delete branch1;
  }
}