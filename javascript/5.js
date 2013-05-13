"use strict";

(function(){
  var MIN = 1,
    MAX = 20;
    
  function find_evenly_divisible(){
    var i = 1;
    while (!divisible_by(i,MIN,MAX)){
      i+=1;
    }
    return i;
  }

  function divisible_by(num, div_min, div_max){
    var d;
    for (d = div_min; d < div_max+1; d+=1){
      if (num % d !== 0){
        return false;
      }
    }
    return true;
  }

  console.log(find_evenly_divisible());
})();