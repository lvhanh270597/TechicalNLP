% Tính biểu thức lambda với vị từ beta

beta(A,KQ):- var(A),!,KQ=A.
beta(FP@ A,KQ):-
	compound(FP), beta(FP,KQ1), beta(A,A1),
	KQ1=lambda(X,F), 
	repl(A1,X,F,KQ2),!,beta(KQ2,KQ).
beta(F,KQ):-	
	F=..[H|T], beta_lst(T,KQ1),
	KQ=..[H|KQ1].

beta_lst([],[]).
beta_lst([F|A],[KQ|B]):-beta(F,KQ), beta_lst(A,B).
repl(A,X,F,A):- X==F.
repl(_,_,F,F):- not(compound(F)).
repl(A,X,F,KQ):-
	F=..[H|T], repl_lst(A,X,T,KQ1),!,
	KQ=..[H|KQ1].
repl_lst(_,_,[],[]).
repl_lst(A,X,[H1|T1],[H2|T2]):-
	repl(A,X,H1,H2), repl_lst(A,X,T1,T2).

% Hỏi đáp câu đúng/sai.
kiemtra(S):- s(R,S,[]), beta(R,K), K.