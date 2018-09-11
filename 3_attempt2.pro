domains
  i=integer
  list=i*
predicates
  sum_list(list,i)
  ap(i,list,list)
  corp(list,list,i)
  out(list,list)
  %prom(list,list,i)
  last(list,i)
  del_last(list,list)
clauses

  sum_list([],0).
  sum_list([H|T],Sum) :- sum_list(T,Sum1), Sum=H+Sum1.
  
  ap(N,L1,L2) :- L2=[N|L1].
  
  corp(L1,L2,Last) :-
  	sum_list(L1,Sum),
  	S2=Last+Sum,
  	L2=[S2|L1].
  	
  last([Element], Element):-!.
  last([_|Tail], Element):-
    last(Tail, Element).
  
del_last([_],[]):-!.
	del_last([X|T],[X|Y]):-del_last(T,Y).

  out([Last],L4):-
  	corp(L4,L2,Last),
  	L4=L2.
  out(L1,L2) :-
  	last(L1,Last),
  	del_last(L1,L3),
  	corp(L2,L4,Last),
  	out(L3,L4).
  
goal
  ap(1,[4,6,8,10],L),
  sum_list(L,X), write("Sum = ",X),nl,nl,
  
  corp([2,3,4],LL,10), write("L=",LL),nl,nl,
  del_last([2,3,4],LL1), write("L=",LL1),nl,nl,
  
  last([5],K), write(K),nl,nl,
  
  out([1,2,3,4],Out),
  nl,nl,fail.                 