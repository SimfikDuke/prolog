global domains
file = f; x

predicates
nondeterm max(file, integer, integer).
nondeterm task(file,file, integer).
nondeterm charcount(string, integer).
nondeterm iff(integer, integer, integer).
nondeterm doz(string, integer, string).

clauses
charcount("",0). 
charcount(S,N):-frontchar(S,_,S1),!,
        charcount(S1,N1),N=N1+1. 
charcount(S,N):-frontchar(S,_,S1),
        charcount(S1,N). 

iff(L,N,R) :- L < N, R = N.
iff(L,_,L).

max(f,L,M) :- 
	not(eof(f)),!,
	readln(C),
	charcount(C,N),
	iff(L,N,R),
	max(f,R,M).
max(f,L,M) :- M = L, closefile(f).      

doz(S,0,S).
doz(S,N,O) :-
	M = N - 1,
	concat(S,"*",Str),
	doz(Str,M,O).

task(f,x,M) :- 
	not(eof(f)),!,
	readln(C),
	charcount(C,N),
	writedevice(screen),
	D = M-N,
	doz(C,D,V),
	writedevice(x),
	write(V,"\n"),
	%flush(x),
	task(f,x,M).
task(_,_,_).                   
	
goal
F_N = "F:\\YandexDisk\\code\\prolog\\1.txt",
F_N1 = "F:\\YandexDisk\\code\\prolog\\2.txt",
existfile(F_N),!,
openread(f,F_N),
readdevice(f),
max(f,0,Max),
write("Max is : ", Max, "\n"),
openread(f,F_N),
readdevice(f),
openwrite(x,F_N1),
task(f,x,Max),
closefile(f),
closefile(x),
deletefile(F_N),
renamefile(F_N1,F_N),exit.