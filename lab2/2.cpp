#include <stdio.h>
#include <iostream>
#include <assert.h>
#include <stdlib.h>
#include <vector>
#include <set>

template <typename Iterator, typename Predicate>
Iterator mymax(Iterator first, Iterator last, Predicate pred) {
    Iterator max = first;

    while (first != last) {
        if(pred(*first, *max)) {
            max = first;
        }
        ++first;
    }
    return max;
}

int gt_int(int a, int b){
    return (a-b)>0;
}
int gt_char(char a, char b){
    return (a - b)>0; 
}
int gt_str(const char *a, const char *b) {
    return (strcmp(a,b))>0;
}

int main() {
    int arr_int[] = {1, 3, 5, 7, 6, 9, 2, 0};
    char arr_char[] = "Suncana strana ulice";
    const char* arr_str[] = {
        "Gle", "malu", "vocku", "poslije", "kise",
        "Puna", "je", "kapi", "pa", "ih", "njise"
    };

    const int* maxint = mymax( &arr_int[0], &arr_int[sizeof(arr_int)/sizeof(*arr_int)], gt_int);
    const char* maxchar = mymax( &arr_char[0], &arr_char[sizeof(arr_char)/sizeof(*arr_char)], gt_char);
    const char** maxstr = mymax( &arr_str[0], &arr_str[sizeof(arr_str)/sizeof(*arr_str)], gt_str);

    printf("U arr_int max: %d\n", *maxint);
    printf("U arr_char max: %c\n", *maxchar);
    printf("U arr_str max: %s\n", *maxstr);

    std::vector<int> vektor_int;
    vektor_int.push_back(1);
    vektor_int.push_back(3);
    vektor_int.push_back(7);
    vektor_int.push_back(9);
    vektor_int.push_back(0);
    printf("U vektor_int max: %d\n", *mymax( vektor_int.begin(), vektor_int.end(), gt_int));

    std::set<const char*> set_str;
    set_str.insert("Gle");
    set_str.insert("malu");
    set_str.insert("vocku");
    set_str.insert("poslije");
    set_str.insert("kise");
    printf("U set_str max: %s\n", *mymax( set_str.begin(), set_str.end(), gt_str));
}

    // prethodni zad koristi pokazivac na funkciju za delegaciju - ne može se ostvariti
    // nadogradivost s obzirom na različite vrste pretraživanih spremnika
    // u ovom zadatku ne moramo zadati funkciji veličinu spremnika, ni podataka u spremniku
    // manje cast-anja pointera, čišći kod, compiler sam može pogoditi parametre predloška