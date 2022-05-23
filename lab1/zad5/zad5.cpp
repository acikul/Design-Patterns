#include <iostream>
using namespace std;

class B{
public:
  virtual int prva()=0;
  virtual int druga(int)=0;
};

class D: public B{
public:
  virtual int prva(){return 42;}
  virtual int druga(int x){return prva()+x;}
};

typedef int (*PTRFUN1)(B*);
typedef int (*PTRFUN2)(B*, int);

int main() {

    B *pb = new D();
    PTRFUN1* vTable1 = *(PTRFUN1**)pb;
    PTRFUN2* vTable2 = *(PTRFUN2**)pb;

    cout << "funkcija prva: " << vTable1[0](pb) << endl;
    cout << "funckija druga: " << vTable2[1](pb, 1) << endl;
    return 0;
}