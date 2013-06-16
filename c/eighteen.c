#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#define BUFFER_SIZE 2048
#define DIM 15

/* processing functions */
void print( int n, int arr[n][n] );
void readFile( int arr[DIM][DIM] );
int dp( int arr[DIM][DIM] );

/* helper functions */
int max( int a, int b );

int main( void ){
  int arr[DIM][DIM] = {{ 0 }};

  
  readFile( arr );
  printf("MAXIMUM PATH SUM: %d\n", dp( arr ));

  return 0;
}

/* dynamic programming
 * X array needs to have one row and one column of padding on the top/left
 */
int dp( int arr[DIM][DIM] ){
  int X[DIM+1][DIM+1] = {{ 0 }}, //extra DIM+1 for padding
    i,
    j;

  for(i = 1; i < DIM+1; i+=1){
    for(j = 1; j <= i; j+=1){
      // remember that the original values arr is offset by (1,1)
      X[i][j] = max( X[i-1][j-1], X[i-1][j] ) + arr[i-1][j-1];
    }
  }
  
  int maxVal = 0;
  for(j = 0; j < DIM+1; j++){
    maxVal = ( X[DIM][j] > maxVal ) ? X[DIM][j] : maxVal;
  }

  //print( DIM+1, X );

  return maxVal;
}

/* return the max of 3 ints */
int max( int a, int b){
  return (a > b) ? a : b;
}

void readFile( int arr[DIM][DIM] ){
  FILE *file;
  char buffer[BUFFER_SIZE],
    *line = NULL;

  file = fopen("./../files/18.txt", "r");

  if(file == NULL){
    printf("File could not be read\n");
    exit(0);
  }

  int row = 0,
    col = 0;

  char *token = NULL;

  while( fgets(buffer, BUFFER_SIZE, file) ){
    col = 0;
    token = strtok(buffer, " ");

    while( token != NULL ){
      arr[row][col] = atoi(token);
      col += 1;
      token = strtok(NULL, " ");
    }
    row += 1;
  }
}

void print( int n, int arr[n][n] ){
  int a, b;
  for(a = 0; a < n; a+=1){
    for(b = 0; b < n; b+=1){
      printf("%d ", arr[a][b]);
    }
    printf("\n");
  }
}