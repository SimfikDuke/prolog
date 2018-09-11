domains
  i=integer
  list=i*
predicates
  sum_list(list,i)
  ap(i,list,list)
clauses
  sum_list([],0).
  sum_list([H|T],Sum) :- sum_list(T,Sum1), Sum=H+Sum1.
  ap(N,L1,L2) :- L2=[N|L1].
goal
  ap(1,[4,6,8,10],L),
  sum_list(L,X), write("Sum = ",X),nl,fail.                 