global domains
file = f; x

predicates
nondeterm max(file, integer, integer).
nondeterm task(file, integer).
nondeterm charcount(string, integer).
nondeterm iff(integer, integer, integer).
nondeterm doz(string, integer, string).

clauses
charcount("",0). 
charcount(S,N):-frontchar(S,_,S1),!,
        charcount(S1,N1),N=N1+1. 
charcount(S,N):-frontchar(S,_,S1),
        charcount(S1,N). 

iff(L,N,R) :- L < N,
	R = N.
iff(L,_,L).

max(f,L,M) :- 
	not(eof(f)),!,
	readln(C),
	charcount(C,N),
	iff(L,N,R),
	max(f,R,M).
	
max(f,L,M) :- M = L, closefile(f).      

task(f,M) :- closefile(f),
	not(eof(f)),!,
	readln(C),
	charcount(C,N),
	doz(C,M,V),
	writedevice(F),
	write(V,"\n"),
	flush(x).

task(f,_) :- closefile(f).                    
	
goal
%write("Enter read file name: "),
%readln(F_N),
F_N = "D:\\1.txt",
existfile(F_N),!,
openread(f,F_N),
readdevice(f),
max(f,0,Max),
write("Max is : ", Max, "\n"),
openmodify(f,F_N),
task(f,Max),
nl,fail.