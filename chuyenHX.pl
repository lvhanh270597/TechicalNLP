% Tập từ vựng
từ_vựng(thái,0).
từ_vựng(tùng,0).
từ_vựng(bảy,0).
từ_vựng(năm,0).
từ_vựng(ba,2).
từ_vựng(tốt,1).
từ_vựng(người,1).
từ_vựng(có,2).
từ_vựng(xeđạp,1).
từ_vựng(hàngxóm,2).
từ_vựng(điệnthoại,1).
từ_vựng(iphone6s,1).
từ_vựng(tivi,1).
từ_vựng(mua,2).
từ_vựng(cho,3).
từ_vựng(macbookair,1).
từ_vựng(quý,2).
từ_vựng(xe,1).
từ_vựng(landrover,1).
từ_vựng(giúpđỡ,2).
từ_vựng(đồvật,1).
từ_vựng(máytính,1).

từ_vựng(macbook,0).
từ_vựng(xe_đạp,0).
từ_vựng(land_rover,0).
từ_vựng(điện_thoại,0).

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

ba(thái,tùng).
tốt(thái).
người(thái).
người(tùng).
người(bảy).
người(năm).
có(thái,xe_đạp).
có(tùng,land_rover).
có(bảy,điện_thoại).
có(năm,macbook).
xeđạp(xe_đạp).
hàngxóm(thái,bảy).
hàngxóm(thái,năm).
hàngxóm(tùng,bảy).
hàngxóm(tùng,năm).
hàngxóm(bảy,thái).
hàngxóm(bảy,năm).
hàngxóm(bảy,tùng).
hàngxóm(năm,thái).
hàngxóm(năm,bảy).
hàngxóm(năm,tùng).
điệnthoại(điện_thoại).
iphone6s(điện_thoại).
mua(thái,điện_thoại).
mua(thái,macbook).
mua(thái,land_rover).
cho(thái,bảy,điện_thoại).
cho(thái,năm,macbook).
cho(thái,tùng,land_rover).
macbookair(macbook).
máytính(macbook).
quý(năm,thái).
quý(bảy,thái).
xe(xe_đạp).
xe(land_rover).
giúpđỡ(thái,năm).
giúpđỡ(thái,bảy).
giúpđỡ(thái,tùng).
đồvật(xe_đạp).
đồvật(điện_thoại).
đồvật(land_rover).
đồvật(macbook).

% Chọn một số câu để chuyển sang biểu thức Logic

%	ông Thái mua máy tính và xe.
%	ông Thái giúp đỡ bà Bảy và ông Năm.
%	mọi người có một đồ vật.
%	bà Bảy có một chiếc Iphone 6S
%	tất cả hàng xóm của ông Thái quý ông Thái.

% ông Thái mua một cái máy tính và một chiếc xe.

s(NP @ VP) --> npc(NP), vp(VP).
npc(NP) --> np(_), nnp(NP).
npc(DET @ NP) --> det(DET), np(NP).
npc((CC @ NP1) @ NP2)--> npc1(NP1), cc(CC), npc(NP2).
npc((CC @(D1@ NP1)) @ (D2 @ NP2)) --> np1(NP1), cc(CC), np(NP2),{lượngtừ(D1), lượngtừ(D2)}.
npc((CC @(D1@ NP1)) @ NP2) --> np1(NP1), cc(CC), npc(NP2),{lượngtừ(D1)}.
npc((CC @ NP1) @ (D2 @ NP2)) --> npc1(NP1), cc(CC), np(NP2),{lượngtừ(D2)}.
npc(D @ NP)--> np(NP),{lượngtừ(D)}.

npc1(NP) --> np(_), nnp(NP).
npc1(DET @ NP) --> det(DET), np(NP).

np(NN) --> nn(NN).
np(NP) --> unn(_), np(NP).
np(NP @ PP) --> np1(NP), pp(PP).

np1(NN) --> nn(NN).
np1(NP) --> unn(_), np(NP).

pp(NP)--> in(_), npc(NP).

vp(VB @ NP) --> vb(VB), npc(NP).
vp(VB @ (D @ NP)) --> vb(VB), np(NP), {lượngtừ(D)}.

nnp(lambda(P, P@ thái)) --> [thái].
nnp(lambda(P, P@ bảy)) --> [bảy].
nnp(lambda(P, P@ năm)) --> [năm].
nn(_)--> [ông];[bà].
nn(lambda(P,xe(P))) --> [xe].
nn(lambda(P, máytính(P))) --> [máy,tính].
nn(lambda(P,người(P))) --> [người].
nn(lambda(P,đồvật(P))) --> [đồ,vật].
nn(lambda(P,lambda(X, P@ lambda(Y, hàngxóm(X, Y))))) --> [hàng,xóm].
unn(_) --> [chiếc]; [cái].
cc(lambda(P,lambda(Q, lambda(X, (P@ X) & (Q @ X))))) --> [và].
det(lambda(P, lambda(Q, tồn_tại(X, (P@ X) & (Q@ X))))) --> [một].
det(lambda(P, lambda(Q, với_mọi(X, (P@ X) => (Q@ X))))) --> [mọi];[tất,cả];[mỗi].
vb(lambda(P, lambda(X, P@ lambda(Y, mua(X,Y))))) --> [mua].
vb(lambda(P, lambda(X, P@ lambda(Y, giúpđỡ(X,Y))))) --> [giúp,đỡ].
vb(lambda(P, lambda(X, P@ lambda(Y, có(X,Y))))) --> [có].
vb(lambda(P, lambda(X, P@ lambda(Y, quý(X,Y))))) --> [quý].
in(_)-->[của].
lượngtừ(lambda(P, lambda(Q, tồn_tại(X, (P@ X) & (Q@ X))))).

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















