domains
 
	i=integer
	list=i*
	tree = empty; tr(i,tree,tree)
 
predicates
 
nondeterm app(list,list,list)
nondeterm list_leaves(tree,list)
nondeterm min(list,i)
nondeterm task(tree,i)
 
clauses
 
	app([],R,R).
	app([H|T],R,[H|Q]) :- app(T,R,Q).
 
	list_leaves(empty,[]).
	list_leaves(tr(N,empty,empty),[N]).
	list_leaves(tr(_,L,R),Z) :- list_leaves(L,LL), list_leaves(R,RR), app(LL,RR,Z), !.
 
	min([H],H).
	min([H|T],H) :- min(T,R), H < R.
	min([H|T],R) :- min(T,R), H >= R.
 
	task(T,M) :- list_leaves(T,LT), min(LT,M). 
 
goal

task(tr(-70,tr(3,tr(1,empty,empty),tr(-1,empty,empty)),tr(-9,empty,empty)),R),
	%task(tr(-70,tr(3,tr(1,empty,empty),tr(-12,tr(-9,empty,empty),
	%tr(-9,empty,empty))),tr(-9,empty,empty)),R1),
write("Result: ",R),nl,nl,fail.
