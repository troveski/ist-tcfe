close all
clear all

%%EXAMPLE SYMBOLIC COMPUTATIONS

pkg load symbolic

% RESET
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

syms v1
syms v2
syms v3
syms v4
syms v5
syms v6
syms v7
syms v8

%%  Lei dos Nós

printf("\n\nKNL equation:\n");

printf("\n\Knots equation:\n");
Ic+(v8-v7)/R7 == 0
(v5-v6)/R5-Ib+Id == 0
Ib+(v2-v3)/R2 == 0
(v3-v2)/R2-Vb/R3+(v1-v2)/R1 == 0
printf("\n\SuperKnots equation:\n");
(v7-v8)/R7-Id+(v4-v5)/R4+Vb/R3+(v6-v5)/R5 == 0
%-Ic+(v5-v4)/R4+(v2-v1)/R1 == 0

printf("\n\Por observação do circuito\n");

v4 == 0

v1-v4 == Va
v5-v8 == Vc
v2-v5 == Vb
Ic = (v4-v7)/R6
Vc = Kc*Ic
Ib = Kb*Vb

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

A = [ 0     , 0         , 0     , 0     , 0         , 0     , -1/R7 , 1/R7  , 0     , 0 , 0 , 1   ;...
      0     , 0         , 0     , 0     , 1/R5      , -1/R5 , 0     , 0     , 0     , 0 , -1, 0   ;...
      0     , 1/R2      , -1/R2 , 0     , 0         , 0     , 0     , 0     , 0     , 0 , 1 , 0   ;...
      1/R1  , -1/R2-1/R1, 1/R2  , 0     , 0         , 0     , 0     , 0     , -1/R3 , 0 , 0 , 0   ;...
 %     0     , 0         , 0     , 1/R4  , -1/R4-1/R5, 1/R5  , 1/R7  , -1/R7 , 1/R3  , 0 , 0 , 0   ;...
      -1/R1 , 1/R1      , 0     , -1/R4 , 1/R4      , 0     , 0     , 0     , 0     , 0 , 0 , -1  ;...
      0     , 0         , 0     , 1     , 0         , 0     , 0     , 0     , 0     , 0 , 0 , 0   ;...
      1     , 0         , 0     , -1    , 0         , 0     , 0     , 0     , 0     , 0 , 0 , 0   ;...
      0     , 0         , 0     , 0     , 1         , 0     , 0     , -1    , 0     , -1, 0 , 0   ;...
      0     , 1         , 0     , 0     , -1        , 0     , 0     , 0     , -1    , 0 , 0 , 0   ;...
      0     , 0         , 0     , 1/R6  , 0         , 0     , -1/R6 , 0     , 0     , 0 , 0 , -1  ;...
      0     , 0         , 0     , 0     , 0         , 0     , 0     , 0     , 0     , 1 , 0 , -Kc ;...
      0     , 0         , 0     , 0     , 0         , 0     , 0     , 0     , -Kb   , 0 , 1 , 0   ]

B = [ 0; -Id; 0; 0; 0; 0; Va; 0; 0; 0; 0; 0]

x = A\B

teste = x(12) - (x(4)-x(7))/R6
