#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

const void* mymax(const void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *)){
    char *const end_ptr = &base[size * (nmemb-1)];
    char *i_ptr;
    char *max_ptr = base;

    for (i_ptr = base; i_ptr <= end_ptr; i_ptr += size) {
        if ((*compar) ((void *) i_ptr, (void *) max_ptr)) {
            max_ptr = i_ptr;
        }
    }
    return (void *) max_ptr;
}

int gt_int(const void *a, const void *b){
    return (( *(int*)a - *(int*)b)>0 ? 1 : 0);
}

int gt_char(const void *a, const void *b){
    return (( *(char*)a - *(char*)b)>0 ? 1 : 0); 
}

int gt_str(const void *a, const void *b){
    return strcmp(*((const char **)a), *((const char **)b))>0 ? 1 : 0;
}

int main() {
    int arr_int[] = {1, 3, 5, 7, 6, 9, 2, 0};
    char arr_char[] = "Suncana strana ulice";
    const char* arr_str[] = {
        "Gle", "malu", "vocku", "poslije", "kise",
        "Puna", "je", "kapi", "pa", "ih", "njise"
    };

    printf("U arr_int max: %d\n", *(int *)mymax(arr_int, 8, sizeof(int), gt_int));
    printf("U arr_char max: %c\n", *(char *)mymax(arr_char, 21, sizeof(char), gt_char));
    printf("U arr_str max: %s\n", *(char **)mymax(arr_str, 11, sizeof(const char *), gt_str));
}