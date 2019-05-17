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

% Генериране на аритметична прогресия
% genArithProg(Start,Diff,N, R)
genArithProg(_,_,0,[]).
genArithProg(Curr,Diff,N,[Curr|R]):-N>0,Next is Curr + Diff, NewN is N - 1, genArithProg(Next,Diff,NewN, R).

% Премахване на подсписъци
% flatten(L, R)
flatten([],[]).
flatten(A,[A]):-not(isList2(A)).
flatten([H|T],R):-flatten(H,HR),flatten(T,TR),append2(HR,TR, R).

% Разделяне на лист
% split(L,R)
split([],[]).
split(L,[A|R]):-append2(A,B,L),A\=[],split(B,R).

% Генериране числа на Фибоначи
% fib(R)
fib(F):-fib(F,_).
fib(0,1).
fib(X,Y):-fib(Z,X),Y is X + Z.
