#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SIZE 1000000
#define TRIES 1000000

void static_arr() { static int nums[SIZE]; }
void stack_arr() { int nums[SIZE]; }
int *heap_arr() { return (int *)malloc(SIZE * sizeof(int)); };

double calc_time(struct timespec start, struct timespec end) {
  return (end.tv_sec - start.tv_sec) +
         (end.tv_nsec - start.tv_nsec) / 1000000000.0;
}

int main() {
  struct timespec start, end;

  timespec_get(&start, TIME_UTC);
  for (int i = 0; i < TRIES; i++)
    static_arr();
  timespec_get(&end, TIME_UTC);
  printf("Static array: %lf seconds\n", calc_time(start, end));

  timespec_get(&start, TIME_UTC);
  for (int i = 0; i < TRIES; i++)
    stack_arr();
  timespec_get(&end, TIME_UTC);
  printf("Stack array: %lf seconds\n", calc_time(start, end));

  int *arr;
  timespec_get(&start, TIME_UTC);
  for (int i = 0; i < TRIES; i++) {
    arr = heap_arr();
    free(arr);
  }
  timespec_get(&end, TIME_UTC);
  printf("Heap array (with free): %lf seconds\n", calc_time(start, end));

  timespec_get(&start, TIME_UTC);
  for (int i = 0; i < TRIES; i++)
    heap_arr();
  timespec_get(&end, TIME_UTC);
  printf("Heap array (without free): %lf seconds\n", calc_time(start, end));
}
