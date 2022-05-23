#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef double (*PTRFUN)();

typedef struct Unary_Function {
    PTRFUN* vTablica;
    int lower_bound;
    int upper_bound;
} Unary_Function;
typedef struct Square {
    Unary_Function base;
} Square;
typedef struct Linear {
    Unary_Function base;
    double a;
    double b;
} Linear;

double squareValueAt(struct Unary_Function * uf_ptr, double x) {
    return x*x;
}
double linearValueAt(struct Unary_Function* uf_ptr, double x) {
    Linear* linear = (Linear *) uf_ptr;
    double rez = linear->a * x + linear->b;
    return rez;
}

PTRFUN (squareTable[]) = {squareValueAt};
PTRFUN (linearTable[]) = {linearValueAt};

double value_at(struct Unary_Function* uf_ptr, double x) {
    return uf_ptr->vTablica[0](uf_ptr, x);
}
double negative_value_at(struct Unary_Function* uf_ptr, double x) {
    return -value_at(uf_ptr, x);
}

void tabulate(Unary_Function* uf_ptr) {
    for (int i = uf_ptr->lower_bound; i <= uf_ptr->upper_bound; i++)
    {
        printf("f(%d)=%lf\n", i, value_at(uf_ptr, i));
    }
}
static bool same_functions_for_ints(Unary_Function *f1, Unary_Function *f2, double tolerance) {
    if(f1->lower_bound != f2->lower_bound) return false;
    if(f1->upper_bound != f2->upper_bound) return false;
    for(int x = f1->lower_bound; x <= f1->upper_bound; x++) {
        double delta = value_at(f1,x) - value_at(f2,x);
        if(delta < 0) delta = -delta;
        if(delta > tolerance) return false;
      }
      return true;
}

struct Square* new_Square(int lb, int ub) {
    struct Square *ptr = malloc(sizeof(ptr));
    ptr->base.lower_bound = lb;
    ptr->base.upper_bound = ub;
    ptr->base.vTablica = squareTable;
    return ptr;
}
struct Linear* new_Linear(int lb, int ub, double a_coef, double b_coef) {
    struct Linear *ptr = malloc(sizeof(ptr));
    ptr->base.lower_bound = lb;
    ptr->base.upper_bound = ub;
    ptr->base.vTablica = linearTable;
    ptr->a = a_coef;
    ptr->b = b_coef;
    return ptr;
}

int main() {
    Unary_Function *f1 = new_Square(-2,2);
    tabulate(f1);
    Unary_Function *f2 = new_Linear(-2, 2, 5, -2);
    tabulate(f2);
    printf("f1==f2: %s\n", same_functions_for_ints(f1, f2, 1E-6) ? "DA" : "NE");
    printf("neg_val f2(1) = %lf\n", negative_value_at(f2, 1.0));
    free(f1);
    free(f2);

    return 0;
}