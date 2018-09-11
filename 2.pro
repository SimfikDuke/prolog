domains
	x = integer
predicates
	nondeterm isPrime(x).	
	nondeterm res(x,x).
clauses
	isPrime(X) :- X=1,
		write("\nYour number '",X,"' is prime!\n\n"),!.
	isPrime(X) :- 
		D=2,
		res(X,D).
	
	res(X,D) :- D > sqrt(X)+1,
		write("\nYour number '",X,"' is prime!\n\n"),!.
		
	res(X,D) :-
		RES = X mod D,
		RES > 0,
		write("Not divisible by '",D,"'\n"),
		I = D+1,
		res(X,I).
		
	res(X,D) :- 
		X mod D = 0,
		write("\nYour number '",X,"' is not prime!\nIt's can be devided by ",D,"\n"),!.
	
goal
	isPrime(127), nl, fail.