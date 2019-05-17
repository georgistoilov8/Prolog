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

% Двойки числа
pairs(A,B):-nat(N),between(0,N,A),B is N - A.

% Генериаране на н-торка в определен интервал
% getKS(K, S, L).
getKS(1, S, [S]).
getKS(K, S, [XI|R]):-K>1,between2(0,S,XI),T is S - XI, KR is K - 1, getKS(KR,T,R).

% Генериране на всички н-торки
genAllNatNumSeq([]).
genAllNatNumSeq(L):-nat(N),between2(1,N,K),S is N - K,genKS(K, S, L).
