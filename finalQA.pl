% Tập từ vựng
từ_vựng(rất_thích, 2).
từ_vựng(yêu, 2).
từ_vựng(đọc_sách, 2).
từ_vựng(học, 2).
từ_vựng(bố, 2).
từ_vựng(mẹ, 2).
từ_vựng(giáo_viên, 2).
từ_vựng(học, 2).
từ_vựng(học_giỏi, 2).
từ_vựng(hoc_sinh_giỏi, 2).
từ_vựng(ban_gái, 2).
từ_vựng(học_cùng_lớp, 2).
từ_vựng(yêu_qúy, 2).
từ_vựng(học_sinh, 1).
từ_vựng(giám_đốc, 1).
từ_vựng(nam, 0).
từ_vựng(hà_nội, 0).
từ_vựng(lớp_mười_hai, 0).
từ_vựng(đạt, 0).
từ_vựng(nhi, 0).
từ_vựng(môn_toán, 0).
từ_vựng(lớp, 0).
từ_vựng(thể_thao, 0).
từ_vựng(rất, 0).
từ_vựng(hoa, 0).
từ_vựng(hai_năm, 0).
từ_vựng(họ, 0).
từ_vựng(thư_viện, 0).
từ_vựng(hay, 0).
từ_vựng(lan, 0).

% Tập các phép toán

:-op(950,yfx,@).
:-op(925,yfx,x).
:-op(900,yfx,=>).
:-op(850,yfx,v).
:-op(800,yfx,&).
:-op(750,fx,~).

~BT1:-not(BT1).
BT1 & BT2:-BT1, BT2.
BT1 v BT2:-BT1; BT2.
BT1 => BT2:-not(BT1),!; BT2.
tồn_tại(X,BT1):-từ_vựng(X, 0),BT1,!.
với_mọi(X,BT1):- ~tồn_tại(X,~BT1).

% Mô hình bậc nhất

ở(nam, hà_nội).
bố(đạt, nam).
giám_đốc(đạt).
mẹ(nhi, nam).
giáo_viên(nhi, môn_toán).
học_giỏi(nam, môn_toán).
hoc_sinh_giỏi(nam, lớp).
rất_thích(nam, thể_thao).
ban_gái(hoa, nam).
yêu(hoa, nam).
yêu(nam, hoa).
đọc_sách(họ, thư_viện).
yêu_qúy(đạt, lan).
yêu_qúy(nhi, lan).
học_sinh(nam).
học_sinh(X) :- học(X, _), !.
học_cùng_lớp(hoa, nam).
học_cùng_lớp(nam, hoa).
học(nam, lớp_mười_hai).
học(X, Y) :- học_cùng_lớp(Z, X), học(Z, Y), !.
con(X, Y) :- mẹ(Y, X); bố(Y, X).

/* 3 phát biểu đơn giản chỉ gồm chủ từ, động từ, tân từ
+ Hoa là học_sinh.
+ mẹ nam sống hà_nội
+ hoa đang học lớp_mười_hai. */
prp(lambda(P, P@ họ)) --> [họ].

nnp(lambda(P, P@ nam)) --> [nam].
nnp(lambda(P, P@ lan)) --> [lan].
nnp(lambda(P, P@ hà_nội)) --> [hà, nội].
nnp(lambda(P, P@ đạt)) --> [đạt].
nnp(lambda(P, P@ nhi)) --> [nhi].
nnp(lambda(P, P@ hoa)) --> [hoa].

nn(lambda(P, P@ lớp)) --> [lớp].
nn(lambda(P, P@ lớp_mười_hai)) --> [lớp, mười, hai].
nn(lambda(P, P@ môn_toán)) --> [môn, toán].
nn(lambda(P, P@ thể_thao)) --> [thể, thao].
nn(lambda(P, P@ thư_viện)) --> [thư, viện].
nn(lambda(P, học_sinh(P))) --> [học, sinh].
nn(lambda(P, giám_đốc(P))) --> [giám, đốc].
nn(lambda(P,lambda(X, P@ lambda(Y, bố(X, Y))))) --> [bố].
nn(lambda(P,lambda(X, P@ lambda(Y, mẹ(X, Y))))) --> [mẹ].
nn(lambda(P,lambda(X, P@ lambda(Y, giáo_viên(X, Y))))) --> [giáo, viên].
nn(lambda(P,lambda(X, P@ lambda(Y, bạn_gái(X, Y))))) --> [bạn, gái].
nn(lambda(P, P@ _)) --> [ai].
nn(lambda(P, P@ _)) --> [cái, gì].

in(lambda(P,lambda(X, P@ lambda(Y, ở(X, Y))))) --> [ở].

vb(_) --> [sống]; [là].
vb(lambda(P,lambda(X, P@ lambda(Y, học(X, Y))))) --> [học].
vb(lambda(P,lambda(X, P@ lambda(Y, học_giỏi(X, Y))))) --> [học, giỏi].
vb(lambda(P,lambda(X, P@ lambda(Y, học_sinh_giỏi(X, Y))))) --> [học, sinh, giỏi].
vb(lambda(P,lambda(X, P@ lambda(Y, rất_thích(X, Y))))) --> [rất, thích].
vb(lambda(P,lambda(X, P@ lambda(Y, yêu(X, Y))))) --> [yêu].
vb(lambda(P,lambda(X, P@ lambda(Y, học_cùng_lớp(X, Y))))) --> [học, cùng, lớp].
vb(lambda(P,lambda(X, P@ lambda(Y, đọc_sách(X, Y))))) --> [đọc, sách].
vb(lambda(P,lambda(X, P@ lambda(Y, yêu_qúy(X, Y))))) --> [yêu, qúy].

cc(lambda(P,lambda(Q, lambda(X, (P@ X) & (Q @ X))))) --> [và].
det(lambda(P, lambda(Q, tồn_tại(X, (P@ X) & (Q@ X))))) --> [một].
det(lambda(P, lambda(Q, với_mọi(X, (P@ X) => (Q@ X))))) --> [mọi];[tất,cả];[mỗi].

sen(X @ Y) --> np(X), vp(Y).
sen(X @ _) --> np14(X), vp14(_).
np14(X @ Y) --> nn(X), nnp(Y).
np(X) --> nnp(X).
np(X) --> nn(X).
vp(X @ Y) --> vb(X), np(Y).
vp14(_) --> vb(_), np(_).

% Tính biểu thức lambda với vị từ beta
beta(A,KQ):- var(A),!,KQ=A.
beta(F@A,KQ):-
	compound(F), beta(F,KQ1), 
	deploy(KQ1, A, KQ2), !, beta(KQ2, KQ).
beta(F,KQ):-	
	F=..[A|B], beta_lst(B,KQ1),
	KQ=..[A|KQ1].

beta_lst([],[]).
beta_lst([F|A],[KQ|B]):-beta(F,KQ), beta_lst(A,B).
deploy(lambda(X, F), A, KQ) :- repl(A,X,F,KQ).
repl(A,B,F,KQ) :- F==B, !, KQ=A.
repl(_,_,F,KQ):- not(compound(F)),!,KQ=F.
repl(A,B,F,KQ):-
	F=..[H|[B1|F1]], 
	member(H, [lambda, với_mọi, tất_cả]), !,
	(B1==B, !, KQ=F; repl(A,B,F1,KQ1), KQ=..[H|[B1|KQ1]]).
repl(A,B,F,KQ) :- F=..[H|B1], repl_lst(A,B,B1,KQ1),!,KQ=..[H|KQ1].
repl_lst(_,_,[],[]).
repl_lst(A,B,[F|T1],[KQ|T2]):-
	repl(A,B,F,KQ), repl_lst(A,B,T1,T2).

% Hỏi đáp câu đúng/sai.
kiemtra(S):- sen(R,S,[]), beta(R,K), K.
% Tính ra ngữ nghĩa từ câu
cal(S, KQ) :- sen(R, S, []), beta(R, KQ).
calNP(NP, K) :- np(X, NP, []), beta(X, K).
calVP(VP, K) :- vp(X, VP, []), beta(X, K).