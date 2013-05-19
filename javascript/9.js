"use strict";

(function(){
  var SUM = 1000;

  function find_triplet(num){
    var a,b,c;
    for(a = 1; a < num; a++){
      for(b = 0; b < (num - a); b++){
        c = num - b - a;
        if (is_pythagorean(a,b,c)) {
          return a*b*c;
        }
      }
    }
    return 0;
  }

  function is_pythagorean(a,b,c){
    //console.log(a,b,c);
    return (Math.pow(a,2) + Math.pow(b,2) === Math.pow(c,2));
  }

  console.log(find_triplet(SUM));
})();