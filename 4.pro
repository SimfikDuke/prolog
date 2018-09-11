domains
	i=real
	list=i*
predicates
	nondeterm avg(list,i,i,i)
	nondeterm avg(list,i)
clauses
	avg(L,A) :- avg(L,0,0,A).
	avg([H],I,S,A) :- A=(S+H)/I.
	avg([H|T],I,S,A) :- 
		I1=I+1,
		S1=S+H,
		avg(T,I1,S1,A).
goal
avg([1,2,3,4,5],A), write(A),nl,fail.