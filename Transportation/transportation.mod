param m; 
param n;

set Plants:={1..m};
set Warehouses:={1..n};


param s {Plants} >= 0;
param d {Warehouses} >= 0;
param c {Plants,Warehouses} >= 0;
var X {Plants,Warehouses} integer >= 0;

minimize tc : sum{i in Plants, j in Warehouses} c[i,j] * X[i,j] ;

subject to demand {j in Warehouses} : sum {i in Plants} X[i,j] = d[j];
subject to supply {i in Plants} : sum {j in Warehouses} X[i,j] = s[i];

