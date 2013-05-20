"use strict";

var fs = require( 'fs' ),
  assert = require( 'assert' ),
  filepath = "../files/11.txt",
  len = 4,
  size = 20,
  GLOBMAX = Math.pow( 99, 4 );

(function(){
  function getSingleMax( arr, i, j, len, size ) {
    var directions = {
      canGoUp: false,
      canGoDown: false
    },
    max = {
      val: 0,
      direction: "none"
    },
    c,
    temp;

    function editMax( newValue, descr ){
      if ( max.val < newValue ) {
        max.val = newValue;
        max.direction = descr;
      }
    }

    // check direction up
    if ( i > len ) {
      temp = 1;
      directions.canGoUp = true;
      for ( c = 0; c < len; c += 1 ) {
        temp *= arr[i-c][j];
      }
      editMax(temp, "up");
    }

    // check direction down
    if ( i <= size - len ) {
      temp = 1;
      directions.canGoDown = true;
      for ( c = 0; c < len; c += 1 ) {
        temp *= arr[i+c][j];
      }
      editMax(temp, "down");
    }

    /* check direction left
     * check direction up left
     * check direction down left
     */
    if ( j > len ) {
      temp = 1;
      for ( c = 0; c < len; c += 1 ) {
        temp *= arr[i][j-c];
      }
      editMax(temp, "left");

      if ( directions.canGoUp ) {
        temp = 1;
        for ( c = 0; c < len; c += 1 ) {
          temp *= arr[i-c][j-c];
        }
        editMax(temp, "up left");
      }
      

      if ( directions.canGoDown ) {
        temp = 1;
        for ( c = 0; c < len; c += 1 ) {
          temp *= arr[i+c][j-c];
        }
        editMax(temp, "down left");
      }
    }
    /* check direction right
     * check direction up right
     * check direction down right
     */
    if ( j <= size - len ) {
      temp = 1;
      assert(temp === 1);
      for ( c = 0; c < len; c += 1 ) {
        temp *= arr[i][j+c];
      }
      editMax(temp, "right");

      if ( directions.canGoUp ) {
        temp = 1;
        assert(temp === 1);
        for ( c = 0; c < len; c += 1 ) {
          temp *= arr[i-c][j+c];
        }
        editMax(temp, "up right");
      }
      

      if ( directions.canGoDown ) {
        temp = 1;
        assert(temp === 1);
        for ( c = 0; c < len; c += 1 ) {
          temp *= arr[i+c][j+c];
        }
        editMax(temp, "down right");
      }
    }
    return max;
  }

  function calculateMax( pathLength, size ) {
    var buffer = fs.readFileSync( filepath, { encoding: "utf-8" } ).replace("\n", " ").split(" "),
      grid = [],
      i,
      j,
      max = {
        val: 0,
        direction: 'none'
      },
      tmax = 0;

    // buffer str to int
    for ( i = 0; i < size * size; i += 1 ) {
      buffer[i] = parseInt( buffer[i], 10 );
    }

    // fill grid
    for ( i = 0; i < size; i += 1 ) {
      grid[i] = [];
      for ( j = 0; j < size; j += 1) {
        grid[i][j] = buffer[ i*(size-1) + j];
      }
    }


    // calculate max for each square, and then edit the aggregate max
    for ( i = 0; i < size; i += 1 ) {
      for ( j = 0; j < size; j += 1) {
        tmax = getSingleMax( grid, i, j, pathLength, size );
        if ( tmax.val > max.val ) {
          max = tmax;
        }
        assert(max.val <= GLOBMAX);
      }
    }
    return max;
  }

  console.log(calculateMax( len, size ));
})();