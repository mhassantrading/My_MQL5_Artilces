//+------------------------------------------------------------------+
//|                                                     Iterator.mqh |
//+------------------------------------------------------------------+
#define ERR_ITERATOR_OUT_OF_BOUNDS 1
template<typename T>
interface Iterator
  {
   void     First(void);
   void     Next(void);
   bool     IsDone(void);
   T        CurrentItem(void);
  };
template<typename T>
interface Aggregate
  {
   Iterator<T>*   CreateIterator(void);
   int            Count(void);
   T              operator[](int at);
   void           operator+=(T item);
  };

template<typename T>
class ConcreteIterator:public Iterator<T>
  {
public:
   void              First(void);
   void              Next(void);
   bool              IsDone(void);
   T                 CurrentItem(void);
                     ConcreteIterator(Aggregate<T>&);
protected:
   Aggregate<T>*     m_aggregate;
   int               m_current;
  };
template<typename T> 
   ConcreteIterator::ConcreteIterator(Aggregate<T>& aggregate):
   m_aggregate(&aggregate),
   m_current(0)
  {
  }
template<typename T>
void ConcreteIterator::First(void)
  {
   m_current=0;
  }
template<typename T>
void ConcreteIterator::Next(void)
  {
   m_current++;
   if(!IsDone())
     {
     }
  }
template<typename T>
bool ConcreteIterator::IsDone(void)
  {
   return m_current>=m_aggregate.Count();
  }
template<typename T>
string ConcreteIterator::CurrentItem(void)
  {
   if(IsDone())
     {
      SetUserError(ERR_ITERATOR_OUT_OF_BOUNDS);
      return NULL;
     }
   return m_aggregate[m_current];
  }
class ConcreteAggregate:public Aggregate<string>
  {
public:
   Iterator<string>* CreateIterator(void);
   int               Count(void);
   void              operator+=(string item);
   string            operator[](int at);
protected:
   string            m_items[];
  };
Iterator<string>* ConcreteAggregate::CreateIterator(void)
  {
   return new ConcreteIterator<string>(this);
  }
void ConcreteAggregate::operator+=(string item)
  {
   int size=ArraySize(m_items);
   ArrayResize(m_items,size+1);
   m_items[size]=item;
  }
string ConcreteAggregate::operator[](int at)
  {
   return m_items[at];
  }
int ConcreteAggregate::Count()
  {
   return ArraySize(m_items);
  }
