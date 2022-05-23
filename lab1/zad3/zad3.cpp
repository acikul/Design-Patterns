#include <iostream>
using namespace std;

//dodaje VPTR od 4/8 bytes na 32/63 arch
//8+4 + padding da bude visekratnik od 8 = 16
class CoolClass{
public:
  virtual void set(int x){x_=x;};
  virtual int get(){return x_;};
private:
  int x_;
  //short y__;
};
//4
class PlainOldClass{
public:
  void set(int x){x_=x;};
  int get(){return x_;};
private:
  int x_;
  //short y__;
};

int main() {
    cout << "velicina plain old class-a: " << sizeof(PlainOldClass) << "\n";
    cout << "velicina cool class-a s virtualnim metodama: " << sizeof(CoolClass) << "\n";
    return 0;
}