close all
clear all

%%EXAMPLE SYMBOLIC COMPUTATIONS

pkg load symbolic

syms R1
syms R2
syms R3
syms R4
syms R5
syms R6
syms R7

syms Kb
syms Kc

syms Va
syms Vb
syms Vc
syms Ib
syms Ic
syms Id

%%  Método das Malhas

syms Ialfa
syms Ibeta
syms Igama
syms Itau

printf("\n\nKVL equation:\n");

-Va+Ialfa*R1+Vb+R4*(Ialfa-Itau) == 0
Ibeta = -Ib
Igama = -Id
R6*Itau+R4*(Itau-Ialfa)+Vc+R7*Itau == 0

printf("\n\Por observação do circuito\n");

Vc = Kc*Ic
Ib = Kb*Vb
Ic = -Itau
Vb = R3*(Ialfa-Ibeta)

%%EXAMPLE NUMERIC COMPUTATIONS

R1=2e3
R2=3e3
R3=4e3
R4=4e3
R5=3e3
R6=2e3
R7=1e3

Kb=7e-3
Kc=8e-3

Va=5
Id=1e-3

A = [ R1+R4 , 0 , 0, -R4      , 1   , 0, 0, 0   ;...
      0     , 1 , 0, 0        , 0   , 0, 1, 0   ;...
      0     , 0 , 1, 0        , 0   , 0, 0, 0   ;...
      -R4   , 0 , 0, R4+R6+R7 , 0   , 1, 0, 0   ;...
      0     , 0 , 0, 0        , 0   , 1, 0, -Kc ;...
      0     , 0 , 0, 0        , -Kb , 0, 1, 0   ;...
      0     , 0 , 0, 1        , 0   , 0, 0, 1   ;...
      -R3   , R3, 0, 0        , 1   , 0, 0, 0   ]

B = [ Va; 0; -Id; 0; 0; 0; 0; 0]

x = A\B;

Ialfa = x(1)
Ibeta = x(2)
Igama = x(3)
Itau  = x(4)
Vb    = x(5)
Vc    = x(6)
Ib    = x(7)
Ic    = x(8)

v4 = 0;
v7 = v4 - Ic*R6;
v8 = v7 - Ic*R7;
v5 = v8 + Vc
v5 = v4 +R4*(Ialfa-Itau)
v6 = v5 - R5*(Igama-Ibeta);
v1 = v4 + Va;
v2 = v1 - R1*Ialfa
v2 = v5 + Vb
v3 = v2 - R2*Ibeta;

v1
v2
v3
v4
v5
v6
v7
v8
Vb
Vc
Ib
Ic