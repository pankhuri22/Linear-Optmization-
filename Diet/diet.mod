
param n;
param m;

set food := {1..n};
set nutr := {1..m};

param b {food} ;
param c {nutr} ;
param amt {nutr,food};

var y {food} >= 0;

maximize profit: sum{i in food} b[i]*y[i];

subject to constraint{j in nutr} : sum{i in food} y[i]*amt[j,i] <= c[j];


