var x; var y;
var u >= 0; var v >= 0;
var r; var s; var t;
minimize obj: u+v;
s.t. C1: r^2+s^2 <= u^2;
s.t. C2: t^2 <= v^2;
s.t. C3: x+2 = r;
s.t. C4: y+1 = s;
s.t. C5: x+y = t;
