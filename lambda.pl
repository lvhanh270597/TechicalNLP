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

vb(lambda(P,lambda(X, P@ lambda(Y, ở(X, Y))))) --> [ở].
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