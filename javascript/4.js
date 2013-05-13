/* largest palindrome */
"use strict";

var assert = require("assert");

(function(){
  var MAX_DIG = 3;
  MAX_DIG -= 1;

  function is_palindrome(num){
    var str = num.toString();
    return palindrome_helper(str);
  }

  function palindrome_helper(str){
    if (str.length === 0 || str.length === 1){
      return true;
    } else if (str.substr(0,1) === str.substr(str.length - 1, 1)){
      assert(str.substr(0,1).length === str.substr(str.length - 1).length);
      return palindrome_helper(str.substr(1,str.length-2));
    }
  }

  function find_max_palindrome(){
    var max = 0,
        current,
        i,
        j;
    for (i = Math.pow(10, MAX_DIG); i < Math.pow(10, MAX_DIG+1); i+=1){
      for (j = i; j < Math.pow(10, MAX_DIG+1); j+=1){
        current = i*j;
        if (is_palindrome(current) && current > max){
          //console.log(i + ", " + j);
          max = current;
        }
      }
    }
    return max;
  }

  console.log(find_max_palindrome());
})();