domains
  i=integer
  list=i*
predicates
  sum(list,i,list)
  ap(i,list,list)
  cut(list,list)
clauses
	
	sum([],Sum,[Sum]).
	sum([H|T],S,Res):-
	Sum=S+H,
	sum(T,Sum,R),
	ap(S, R, Res).
	
	ap(N,[],[N]).
	ap(N,[L|T1],[L|T2]):-ap(N,T1,T2).
		
	cut([_],[]) :- !.
	cut([H|T],[H|L]) :-
		cut(T,L).
	
goal
	sum([0,0,1,4,2],0,L), cut(L,O), write(O), nl, fail.