#include <stdio.h>
#include <stdlib.h>
#include <Math.h>


int isPrime(int n){
  int i;
  int bound = sqrt(n);
  for(i = 2; i <= bound; i++){
    if((n % i) == 0){ return 0; }
  }
  return 1;
}

int main(void){
  int a, b, n, answer, primeCount;
  int maxNumPrimes = 0;
  int optA, optB;
  for(a = -999; a < 1000; a++){
    for(b = -999; b < 1000; b++){
      n = 0;
      primeCount = 0;
      while(1){
        answer = (n * n) + (a * n) + b;
        if(answer > 0){
          if(!isPrime(answer)){
            break;
          }
          primeCount++;
        }
        n++;
      }
      if (maxNumPrimes < primeCount){
        printf("n:%d, %d\n", maxNumPrimes, primeCount);
        maxNumPrimes = primeCount;
        optA = a;
        optB = b;
      }
    }
  }
  printf("maxPrimes=%d, n^2 + %dn + %d, prod:%d\n", maxNumPrimes, optA, optB, optA*optB);
}
