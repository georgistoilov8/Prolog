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

isConnected([V,E]):-not((member2(X,V),member2(Y,V),not(simplePath([V,E],X,Y,_)))).
isComplete([V,E]):-not((member2(X,V),member2(Y,V),not(member2([X,Y],E)))).
isUndirected([V,E]):-not((member2([X,Y],E),not(member2([Y,X], E)))).
isDirected([V,E]):-not(isUndirected([V,E])).
isMultiGraph([V,E]):-remove2(Edge,E,NE),member(Edge,NE).
hasCycle([V,E],[X]):-member2([X,X],E).
hasCycle([V,E],[X|P]):-member2([X,Y]|E),X\=Y,simplePath([V,E],Y,X,P).

% DFS в граф
dfs([V,E],Root,R):-dfs(E,[Root],[],R).
dfs(_,[],_,[]).
dfs(E,[StackH|StackT], Visited,[[StackH,Next]|R]]):-genNext(E,StackH,[StackH|StackI],Visited,Next).
dfs(E,[Next,StackH|StackI],Visited,R):-not(genNext(E,StackH,[StackH|StackI],Visited,_),dfs(E,StackI,[StackH|Visited],R).
                                                            
genNext(E,Current,Stack,Visited,Next):-member2([Current,Next],E),not(member2(Next,Visited)),not(member2(Next,Stack)).
