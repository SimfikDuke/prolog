
domains
	listF=fio*.
	listL=lovers*.
	person = p(fio,date).
	fio = f(string,string,string).
	date = d(integer,integer,integer).
	lovers = l(fio,fio).

predicates
	nondeterm result(listL,lovers,listL).
	nondeterm readperson(string, person).
	nondeterm run(char,listL).	
	nondeterm calc(listL,integer,integer,integer,integer,integer,integer).

clauses
	readperson(S,p(f(N1,N2,N3),d(D,M,Y))) :-
		write(S," Name: "), readln(N1),
		write(S," SurName: "), readln(N2),
		write(S," FName: "), readln(N3),
		write(S," Day: "), readint(D),
		write(S," Month: "), readint(M),
		write(S," Year: "), readint(Y), nl.

	calc(_,_,_,_,_,Y,Y).
	calc(L,_,_,_,_,_,_) :- write("Enter now? (y/n): "), readchar(Ch),run(Ch,L).

	run('y',L) :-
		readperson("Husband",p(f(A,B,C),d(D,M,Year))),
		readperson("Wife",p(f(A1,B1,C1),d(D1,M1,Year1))),
		calc(L,D,D1,M,M1,Year,Year1),
		result(L,l(f(A,B,C),f(A1,B1,C1)),_).

run('n',L) :-
	write(L).

result(L,R,L1):-L1=[R|L], write("Enter now? (y/n): "), readchar(Ch),run(Ch,L1),!.

goal
run('y',[]),nl,fail.
