model lr3

Real y11(start=400000);
Real y21(start=100000);
parameter Real a=0.31;
parameter Real b=0.76;
parameter Real c=0.8;
parameter Real d=0.21;

Real y12(start=400000);
Real y22(start=100000);
parameter Real a2=0.21;
parameter Real b2=0.7;
parameter Real c2=0.56;
parameter Real d2=0.15;

equation
  der(y11) = -a*y11 - b*y21 + sin(3*time);
  der(y21) = -c*y11 - d*y21 + cos(4*time)+2;

 
equation
  der(y12) = -a2*y12 - b2*y22 + sin(10*time);
  der(y22) = -c2*y12*y22 - d2*y22 + cos(10*time);

end lr3;