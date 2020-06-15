param n;
set numbers := {1..n};
param c {numbers} >= 0;
var X {numbers} <=1,>=0;
minimize tc : sum  {i in numbers} c[i] * X[i] ;
subject to time : sum {i in numbers} X[i] = 2;

