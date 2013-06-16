/*
 *  How many Sundays fell on the first of the month from 1 Jan 1901 to 31 Dec 2000
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>

#define WEEK_LEN 7
#define MONTHS_LEN 12

int months[MONTHS_LEN] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
int sunCount = 0;

int forwardYear( int day, int year, bool doCount );
int forwardMonth( int day, int month );
bool isLeapYear( int year );
void unitTests( void );

int main( void ){
  unitTests();
  //initial conditions. Jan 1, 1900 was a Monday.
  int day = 1,
    year = 1900,
    endYear = 2000,
    i;

  //don't count 1900
  day = forwardYear(day, year, false);

  for(i = year+1; i <= endYear; i++){
    day = forwardYear(day, i, true);
  }

  printf("Sundays: %d\n", sunCount);

  return 0;
}

int forwardYear( int day, int year, bool doCount ){
  int i;
  for(i = 0; i < MONTHS_LEN; i++){
    if((day == 0) && doCount){
      sunCount += 1;
    }
    //printf("%d, %d, %d, %d\n", day, i, year, sunCount);

    if( (i == 1) && isLeapYear(year)){
      day = forwardMonth(day, months[i]+1);
    }else{
      day = forwardMonth(day, months[i]);
    }
  }
  return day;
}

int forwardMonth( int day, int month ){
  return ((day + month) % WEEK_LEN);
}

bool isLeapYear( int year ){
  // if divisible by 4 but not divisble by 100, unless it is divisible by 400
  if( (!( year % 4 ) && ( year % 100 )) || !( year % 400 ) ){
    return true;
  }
  return false;
}

void unitTests( void ){
  assert(isLeapYear(2000));
  assert(!isLeapYear(1900));
  assert(isLeapYear(2004));
  assert(isLeapYear(1904));
}
