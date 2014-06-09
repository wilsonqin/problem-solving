#include <stdio.h>
#include <stdlib.h>
#include <Math.h>
#include <String.h>

#define TEST_SPIRAL_SIZE 1001
#define SPIRAL_SIZE 1001

/* this problem is about number spiral diagonals */

//calculate which index of an in-memory array the (x,y) element is
int getGridIndex(int x, int y, int sSize){
  return (sSize * y) + x + 1;
}

void printGrid(int *grid, int n){
  int r, c;
  for(r = 0; r < n; r++){
    for(c = 0; c < n; c++){
      printf("%d\t", grid[getGridIndex(c,r,n)]);
    }
    printf("\n");
  }
  printf("\n");
}

void advanceGridState(int *grid, int *x, int *y, int travelDirection, int sSize){
  if(travelDirection == 0){
    //subtract rows
    *y = *y-1;
  }else if(travelDirection == 2){
    //add rows
    *y = *y+1;
  }else if(travelDirection == 1){
    //add cols
    *x = *x+1;
  }else{
    //subtract cols
    *x = *x-1;
  }
}

//fill an empty grid with the spiral numbers. sSize, is size of spiral
void fillGrid(int *grid, int sSize){
  int x = (sSize/2);
  int y = (sSize/2);
  int startInd = getGridIndex(x, y, sSize);

  /*  7 8 9
   *  6 1 2
   *  5 4 3 */
  
  //to do the spiral, we start from a spinLength of 1
  //we do each spinLength twice, before going to the next spinLength
  int spinLength = 1;
  int spinCount = 0;

  /*    0-negRow
   *  3-negCol   1-addCol
   *    2-addRow */
  //direction to travel next spinLength in.
  int travelDirection = 1;
  int nextNum = 2;
  int i;

  //the central square is the start
  grid[startInd] = 1;


  while(spinLength <= sSize){
    spinCount++;

    //apply the spinLength to the current direction
    for(i = 0; i < spinLength; i++){
      advanceGridState(grid, &x, &y, travelDirection, sSize);
      //change the entry in the new location
      startInd = getGridIndex(x,y, sSize);
      grid[startInd] = nextNum;
      nextNum++;
    }

    //change the travelDirection for the next spin
    travelDirection = (travelDirection + 1) % 4;

    if(spinCount == 2){
      spinCount = 0;
      spinLength++;
    }
    if(spinLength == sSize && spinCount == 1){ break; }

    //printGrid(grid, SPIRAL_SIZE);
  }
}

int sumDiagonals(int *grid, int n){
  int sum = 0;
  int r;
  int count1 = 0;
  for(r = 0; r < n; r++){
    sum += grid[getGridIndex(n-count1-1, r, n)];
    sum += grid[getGridIndex(count1, r, n)];
    count1++;
  }
  //subtract the middle square which is counted twice
  sum -= grid[getGridIndex(n/2, n/2, n)];
  return sum;
}

//main controls the population of the grid
int main(void){
  int *grid = malloc(sizeof(int) * TEST_SPIRAL_SIZE * TEST_SPIRAL_SIZE);
  memset(grid, 0, sizeof(int) * TEST_SPIRAL_SIZE * TEST_SPIRAL_SIZE);
  fillGrid(grid, TEST_SPIRAL_SIZE);
  //printGrid(grid, TEST_SPIRAL_SIZE);

  printf("sum of %d square spiral is: %d\n", TEST_SPIRAL_SIZE, sumDiagonals(grid, TEST_SPIRAL_SIZE));
}