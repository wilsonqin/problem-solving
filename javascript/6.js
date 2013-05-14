/* difference between sum of squares, and square of the sums */
"use strict";

(function(){
  var LIM = 100;

  function sum_map(first, last, func){
    var i,
      sum = 0;
    for(i = first; i <= last; i+=1){
      sum += func(i);
    }
    return sum;
  }

  function square(num){
    return Math.pow(num,2);
  }

  function get_difference(){
    var sum_sqd = Math.pow(sum_map(1,LIM,function(n){ return n; }), 2);
    var sum_sqs = sum_map(1,LIM,function(n){  return Math.pow(n,2); });
    return sum_sqd - sum_sq[];
  }

  console.log(get_difference());
})();