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

% Последен елемент на списък
% last2(X,L).
last2(X,L):-append2(_,[X],L).
%last2(X,L):-append2(_,[X|[]],L).

% Дължина на списък
% length2(L, N)
length2([],0).
length2([_|T], N):- length2(T,M), N is M+1.

% Обръщане на списък
% reverse2(L, RL)
reverse2(L,RL):-reverse2(L,[],RL).
reverse2([],Buff,Buff).
reverse2([H|T],Buff,R):-reverse2(T,[H|Buff], R).

% Префикс на списък
% prefix2(P, L)
prefix2(P,L):-append2(P,_,L).

% Суфикс на списък
% sufix2(S, L)
sufix2(S, L):-append2(_,S,L).

% Инфикс на списък
% infix2(I, L)
infix2(I, L):-sufix2(S,L),prefix2(I,S).

% Добавяне на елемент
% insert2(X,L,NL)
insert2(X,L,NL):-append2(A,B,L),append2(A,[X|B],NL).

% Премахване на елемент
% remove2(X,L,NL)
remove2(X,L,NL):-append2(A,[X|B],L),append2(A,B,NL).

% Пермутация на списък
% permutation2(L,R)
permutation2([],[]).
permutation2([H|T],R):-permutation2(T, Q),insert2(H,Q,R).

% Сортиран ли е даден списък
% isSorted2(L)
isSorted2([]).
isSorted2([_].
isSorted2([A,B|T]):-A=<B,isSorted2([B|T]).

% Бързо сортиране
% partition2(Pivot, List, LL, RL)
% quicksort(L, R)
partition2(_,[],[],[]).
partition2(Pivot,[H|T],[H|LL], RL):-H<Pivot,partition2(Pivot,T,LL,RL).
partition2(Pivot,[H|T],LL,[H|RL]):-H>=Pivot,partition2(Pivot,T,LL,RL).

quicksort([],[]).
quicksort(L,R):-L=[H|T],partition2(H,T,LT,RT),quicksort(LT,LR),quicksort(RT,RR),append2(LR, [H|RR], R).

% Подмножество на лист:
subset2([],[]).
subset2([H|T],[H|R]):-not((member2(H,R))),subset2(T,R).
subset2([_|T],R):-subset2(T,R).

% Н-ти елемент
% nthElement(X,Idx,List)
nthElement(X,0,[X|_]).
nthElement(X,N,[_|T]):-nthElement(X,M,T),N is M + 1.

% Обединение, сечение, разлика, подмножество,, равенство
inUnion2(X,A,B):-member2(X,A);member2(X,B).
inIntersection2(X,A,B):-member2(X,A),member2(X,B).
isDifference(X,A,B):-member2(X,A),not(member2(X,B)).
isSubsetOf(A,B):-not((member2(X,A), not(member(X,B)))).
isEqual(A,B):-isSubsetOf(A,B),isSubsetOf(B,A).

% Премахване на повтарящи се елементи
% removeDuplicates(L, R)
removeDuplicates([],[]).
removeDuplicates([H|T],[H|R]:-removeDuplicates(T,R),not(member2(H,R)).
removeDuplicates([H|T], R):-removeDuplicates(T,R),member2(H,R).

% Последователност(подредица
% subsequence(L,R)
subsequence([],[]).
subsequence([H|T],[H|R]):-subsequence(T,R).
subsequence([_|T], R):-subsequence(T,R).

% Брой елементи
% count(X,N,List)
count(_, 0, []).
count(X,N,[X|T]):-count(X,M,T),N is M + 1.
count(X,N,[H|T]):-H\=X,count(X,N,T).

countMax(X, N, L):-member2(X,L),count(X,N,L), not((member2(Y,L),count(Y,M,L), M > N)).

% Палиндром
% palindrom(L)
palindrom([]).
palindrom([_]).
palindrom([H|T]):-append([H|R],[H],[H|T]),palindrom(R).
