% Prolog code done in class.

% Списък от някои основни предикати

% Родител-наследник.
% ancestor2(X, Y).
parent2(ani,tosho).
parent2(tosho,joro).
parent2(tosho,niki).

ancestor2(X,Y):-parent2(X,Y).
ancestor2(X,Y):-parent2(X,Z),ancestor2(Z,Y).

% Списък. [] е списък. Ако Х е терм, а У е списък, то имаме следното: [X, Y], където Х - глава(head), а У е опашка(tail)
% isList2(L).
isList2([]).
isList2([_|_]).

% Конкатенация на два списъка.
% append2(A,B,R).
append2([],B,B).
append2([H|T],B,[H|R]):-append2(T,B,R).

% Дали даден елемент е част от списък
% member2(x,L).
member2(X,[X|_]).
member2(X,[H|T]):-X\=H,member2(X,T).
