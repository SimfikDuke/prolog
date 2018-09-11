predicates 
	nondeterm min(integer,integer,integer,integer)
clauses 
	min(A,B,C,M) :- 
		A > B,
		min(B,A,C,M),!.
	min(A,B,C,M):-
		A>C,
		min(C,B,A,M),!.
	min(A,B,C,M):-
		B>C,
		min(A,C,B,M),!.
		
	min(A,_,_,M):-
		A>0,
		M=A.
	min(_,A,_,M):-
		A>0,
		M=A.
	min(_,_,A,M):-
		A>0,
		M=A.
	min(_,_,_,_) :- fail.
goal
	min(-2,-3,-5,M), write("Min is ", M),nl,nl,fail.