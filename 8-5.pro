predicates
str_char_del(string,char,string)
clauses
str_char_del("",_,"") :- !.

str_char_del(S,C,S0) :-
 frontchar(S,C,S1),!,
 str_char_del(S1,C,S0).
 
str_char_del(S,C,S0) :-
 frontchar(S,C2,S1),
 str_char_del(S1,C,S2),
 frontchar(S0,C2,S2).
goal
str_char_del("sdfsafsfasfa",'a',L), write(L),nl,fail.