/*
 *  Reciprocal Cycles
 */

import java.util.Set;
import java.util.*;

class Tuple implements Comparable{
  public final int x;
  public final int y;
  public Tuple(int x, int y){
    this.x = x;
    this.y = y;
  }

  public int compareTo(Object obj){
    Tuple t = (Tuple) obj;
    boolean v = this.x == t.x;
    boolean v2 = this.y == t.y;
    if (v && v2){ return 0; }
    return 1;
  }
}

class TwentySix {
  public static void main(String[] args) {
    //System.out.println("hello world");
    int n = 1000;
    int maxCycleLength = 0;
    int maxD = 0;
    TwentySix s = new TwentySix();
    for(int i = 1; i < n; i++){
      int cycleLength = s.getCycleLength(1,i);
      if (cycleLength > maxCycleLength){
        maxD = i;
        maxCycleLength = cycleLength;
      }
    }
    System.out.println("cycleLength: " + maxCycleLength + " d: " + maxD);
  }

  public int getCycleLength(int num, int divisor) {
    int rem = 1;
    int dig = 1;
    Set<Tuple> pairs = new TreeSet<Tuple>();
    int cycleLength = 0;
    
    while(rem != 0) {
      rem = (num * 10) % divisor;
      dig = (num * 10) / divisor;
      Tuple newPair = new Tuple(num, rem);
      if (!pairs.contains(newPair)){
        System.out.println("rem: " + rem + ", dig: " + dig);
        pairs.add(new Tuple(num, rem));
      }else{
        return cycleLength;
      }
      num = rem;
      cycleLength += 1;
    }
    return 0;
  }

}