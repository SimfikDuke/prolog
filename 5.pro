domains
	i = integer
	list = i*

predicates
	nondeterm list_set(list, list)
	nondeterm member(integer, list)
	nondeterm union(list,list,list)
	nondeterm intersection(list,list,list)
	nondeterm difference(list,list,list)
	nondeterm task(list,list,list,list,list)

clauses
	member(X,[X|_]):-!.
	member(X,[_|T]) :- member(X,T).
	list_set([],[]).
	list_set([X|S1],S2) :-
	member(X,S1), !, list_set(S1, S2).
	list_set([X|S1],[X|S2]) :- list_set(S1,S2).
	
	union([],L,L).
	union([H|T],L,L1) :-
	member(H,L),!,
	union(T,L,L1).
	union([H|T],L,[H|L1]) :-
	union(T,L,L1).
	
	intersection([],_,[]).
	intersection([H|T1],L,[H|T]):-
	member(H,L), !, 
	intersection(T1,L,T).
	intersection([_|T],L,L1):-
	intersection(T,L,L1).
	
	difference([],_,[]).
	difference([H|T],L,L1):-
	member(H,L), !,
	difference(T,L,L1).
	difference([H|T],L,[H|L1]):-
	difference(T,L,L1).
	
	task(_,A1,B1,C1,O) :-
		list_set(A1,A),
		list_set(B1,B),
		list_set(C1,C),
		union(A,B,O1),
		intersection(A,B,O2),
		difference(O1,C,O3),
		difference(O3,O2,O).
		
goal
	write(Out),nl,fail.