"use strict";

(function(){
  var LIM = 2000000;

  function sieve_of_erasthones(n){
    //intialize sieve
    var sieve = [],
      i,
      sum = 0;

    for(i = 2; i < n; i++){
      sieve[i] = true;
    }

    for(i = 2; i < n; i++){
      if(sieve[i] === true){
        fill_sieve(sieve,i);
        sum += i;
      }
    }

    return sum;
  }

  function fill_sieve(arr,n){
    var i;
    for(i = 2*n; i < arr.length; i+=n){
      arr[i] = false;
    }
  }

  function is_prime(n){
    var low_bound = Math.sqrt(n),
      i;
    for(i = n-1; i >= low_bound; i--){
      //console.log(n,i);
      if(n % i === 0){
        return false;
      }
    }
    return true;
  }

  function sum_primes(n){
    var i,
      sum = 0;

    for(i = 1; i < n; i++){
      if (is_prime(i)){
        sum += i;
      }
    }
    return sum;
  }

  console.log(sieve_of_erasthones(LIM));
})();