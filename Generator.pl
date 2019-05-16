% Генератори

% Смяна на знака
% switchSign(X,y)
switchSign(0,0).
switchSign(X,X):-X>0.
switchSign(X,Y):-X>0,Y is -X.

% Естествените числа
nat(0).
nat(N):-nat(M),N is M + 1.

% Цели числа
int(X):-nat(Y),switchSign(Y,X).

% Числата между две числа:
between2(A,B,A):-A=<B.
between2(A,B,R):-A<B,C is A+1,between2(C,B,R).

% Всички числа между две числа
range(A,A,[A]).
range(A,B,[A|R]):-A<B,C is A + 1,range(C,B,R).
