#include <stdio.h>
#include <stdlib.h>

//deklaracija podatkovnog tipa za pohranjivanje elemenata tablice 
//pokazivaca na funkcije ponasanja konkretnih tipova
typedef char const* (*PTRFUN)();

//funkcije konkretnih tipova
char const* dogGreet(void){
  return "vau!";
}
char const* dogMenu(void){
  return "kuhanu govedinu";
}
char const* catGreet(void){
  return "mijau!";
}
char const* catMenu(void){
  return "konzerviranu tunjevinu";
}

//tablice pokazivaca na funkcije
PTRFUN (dogTable[]) = {dogGreet, dogMenu};
PTRFUN (catTable[]) = {catGreet, catMenu};
//PTRFUN (*catTable[]) (void);

//struktura Animal s imenom i pokazivačem na tablicu funkcija
typedef struct Animal {
  char* imeLjubimca;
  PTRFUN* tablica;
} Animal;

void animalPrintGreeting (struct Animal *ljubimac) {
  printf("%s pozdravlja: %s \n", ljubimac->imeLjubimca, ljubimac->tablica[0]());
}
void animalPrintMenu (struct Animal *ljubimac) {
  printf("%s pozdravlja: %s \n", ljubimac->imeLjubimca, ljubimac->tablica[1]());
}

//funkcije za inicijalizaciju u zadanom mem. prostoru sa zadanim imenom
void constructDog(struct Animal *ptr, char *ptrIme) {
  ptr->imeLjubimca = ptrIme;
  ptr->tablica = dogTable;
}
void constructCat(struct Animal *ptr, char *ptrIme) {
  ptr->imeLjubimca = ptrIme;
  ptr->tablica = catTable;
}

//alokacija memorije i pozivanje funkcije za inicijalizaciju
struct Animal* createDog(char *ime) {
  struct Animal *ptr = malloc(sizeof(Animal));
  constructDog(ptr, ime);
  return ptr;
}
struct Animal* createCat(char *ime) {
  struct Animal *ptr = malloc(sizeof(Animal));
  constructCat(ptr, ime);
  return ptr;
}

void testAnimals(void){
  struct Animal* p1=createDog("Hamlet");
  struct Animal* p2=createCat("Ofelija");
  struct Animal* p3=createDog("Polonije");

  animalPrintGreeting(p1);
  animalPrintGreeting(p2);
  animalPrintGreeting(p3);

  animalPrintMenu(p1);
  animalPrintMenu(p2);
  animalPrintMenu(p3);

  free(p1); free(p2); free(p3);
}

//funckija za stvaranje n pasa jednim malloc-om i n poziva constructDog
void nDoggos(int n) {
  struct Animal *ptr = malloc(n * sizeof(Animal));
  for (int i = 0; i < n; i++)
  {
    char imeBr[10];
    sprintf(imeBr, "dog%d", i);
    constructDog(ptr+i, imeBr);
    animalPrintGreeting(ptr+i);
  }
  free(ptr);
}

int main() {
    
    testAnimals();

    //testiranje stoga i heapa

    printf("\n doge na stogu, wooferino na heapu: \n");
    struct Animal doggo;
    doggo.imeLjubimca = "doge";
    doggo.tablica = dogTable;
    animalPrintGreeting(&doggo);

    struct Animal* woofer = createDog("wooferino");
    animalPrintGreeting(woofer);
    free(woofer);

    //f-ja za n pasa
    int n;
    printf("\n");
    printf("Unesite broj pasa koje treba stvoriti: ");
    scanf("%d", &n);
    nDoggos(n);

    return 0;
} 