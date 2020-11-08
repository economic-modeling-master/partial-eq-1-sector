$title Open economy 1 sector partial equilibrium model

* Declaration of parameters
PARAMETER
* Exogenous parameters
  a   Intercept for domestic supply
  b   Slope for domestic supply
  d   Intercept for domestic demand
  e   Slope for domestic demand
  g   Intercept for excess supply
  h   Slope for excess supply
  ES  Supply elasticity /  0.3   /
  ED  Demand elasticity / -0.2   /
  ETr Trade elasticity  / 10     /
* Policy parameters
  tau Tariff
* Initial values
  QS0 Initial value of domestic supply / 2172 /
  QD0 Initial value of domestic demand / 3250 /
  Tr0 Initial value of domestic trade
  PB0 Initial value of border price    /  466 /
  P0  Initial value of domestic price  /  466 /
;

* Initialize remaining values
Tr0 = QD0-QS0;
b   = ES*(QS0/P0);
e   = -ED*(QD0/P0);
h   = ETr*(Tr0/PB0);
a   = QS0-b*P0;
d   = QD0+e*P0;
g   = Tr0-h*PB0;
tau = P0/PB0-1;

* Declaration of variables
VARIABLE
  QS Domestic supply
  QD Domestic demand
  Tr Trade
  PB Border price
  P  Domestic price
;

* Declaration of equations
EQUATION
  EQ_QS
  EQ_QD
  EQ_Tr
  EQ_PB
  EQ_P;

* Definition of equations
EQ_QS.. QS =e= a+b*P;
EQ_QD.. QD =e= d-e*P;
EQ_Tr.. Tr =e= g+h*PB;
EQ_PB.. Tr =e= QD-QS;
EQ_P..   P =e= PB*(1+tau);

* Initialize variable
QS.L = QS0;
QD.L = QD0;
Tr.L = Tr0;
PB.L = PB0;
P.L  = P0;

* Model's definition: the model contains all equations
model PE / all /;

* Check benchmark equilibrium
solve PE using cns;

display QS.l, QD.l, Tr.l, PB.l, P.l;

P = 5;