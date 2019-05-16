% Prolog code done in class.

% Списък от някои основни предикати

% Родител-наследник.
parent2(ani,tosho).
parent2(tosho,joro).
parent2(tosho,niki).

ancestor2(X,Y):-parent2(X,Y).
ancestor2(X,Y):-parent2(X,Z),ancestor2(Z,Y).

% Списък. [] е списък. Ако Х е терм, а У е списък, то имаме следното: [X, Y], където Х - глава(head), а У е опашка(tail)
isList2([]).
isList2([_|_]).
