% Графи
% G=[V,E]
% V=[a,b,c,...,j]
% E=[[a,b],[c,j],...,[b,c]]

% Извличане на върхове
% extractVertices(E,V)
extractVertices([],[]).
extractVertices([[X,Y]|T],V):-extractVertices(T, TR),addVertex(X, TR, TV),addVertex(Y,TV,V).

% Добавяне на връх
% addVertex(X,V,R)
addVertex(X, V, [X|V]):-not(member2(X,V)).
addVertex(X,V,V):-member2(X,V).

% Конкатенция на подсписъци
% megaConcat(L,R)
megaConcat([],[]).
megaConcat([H|T],R):-megaConcat(T,TR),append2(H,TR,R).

% Преобразуване до множество
% toSet(L,R)
toSet([],[]).
toSet([H|T],R):-member2(H,R),toSet(T,R).
toSet([H|T],[H|R]):-not(member2(H,R)),toSet(T,R).

% Прост път
simplePath([v,E],X,Y,P):-sp(E,X,[Y],P).
sp(_,X,[X|Rest],[X|Rest]).
sp(E,X,[Z|Rest],P):-X\=Z,member2([W,Z],E),not(member2(W,[Z|Rest])),sp(E,X,[W,X|Rest],P).

simplePath2([v,E],X,Y,P):-sp2(E,X,Y,[],P).
sp2(_,Y,Y,Vis,Vis).
sp2(E,Y,Z,Vis,P):-Y\=Z,member2([Z,W],E),not(member2(W,Vis)),append(Vis,[W], V1),sp2(E,W,Y,V1,P).
