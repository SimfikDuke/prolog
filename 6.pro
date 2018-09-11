domains
treetype = tree(integer, treetype, treetype); empty
 
predicates
max_t(treetype, integer)
min_t(treetype, integer)
max(integer,integer,integer)
min(integer,integer,integer)
 
clauses
 
max(M,N,N) :- N>=M, !.
max(M,N,M) :- M>=N, !.
 
min(M,N,N) :- N<=M, !.
min(M,N,M) :- M<=N, !.
 
max_t(tree(X,empty,empty),X) :- !.
max_t(tree(X,empty,R),Q) :- max_t(R,N), max(X,N,Q).
max_t(tree(X,L,empty),Q) :- max_t(L,N), max(X,N,Q).
max_t(tree(X,L,R),Q) :- max_t(L,LM), max_t(R,RM), max(RM,LM,QM), max(X,QM,Q). 
 
min_t(tree(X,empty,empty),X) :- !.
min_t(tree(X,empty,R),Q) :- min_t(R,N), min(X,N,Q).
min_t(tree(X,L,empty),Q) :- min_t(L,N), min(X,N,Q).
min_t(tree(X,L,R),Q) :- min_t(L,LM), min_t(R,RM), min(RM,LM,QM), min(X,QM,Q).
