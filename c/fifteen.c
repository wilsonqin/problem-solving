/* A simple Dynamic Programming solution */

#include <stdio.h>
#include <assert.h>
//SIZE should be one more than you desire. e.g for a sq of 20, SIZE = 21
#define SIZE 21

int main(int argc, const char* argv[]){
  long array[SIZE][SIZE] = {{ 0 }};
  int i, j;

  /* set initial conditions: 
   * x[0][0] = 0, x[0][_] = 1, x[_][0] = 1 
   */
  for(i = 1; i < SIZE; i++){
    array[i][0] = 1;
    array[0][i] = 1;
  }


  /* recurrence equation: x[i,j] = x[i-1, j] + x[i, j-1] */
  printf("%lu\n", array[0][0]);
  for (i = 1; i < SIZE; i++){
    for(j = 1; j < SIZE; j++){
      array[i][j] = array[i-1][j] + array[i][j-1];
      assert(array[i][j] != 0);
    }
  }

  printf("%lu\n", array[SIZE-1][SIZE-1]);
  return 0;
}