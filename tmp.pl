:-op(780, xfy, &).
:-op(750, xfy, =>).

nn(X^Y^bố(Y, X)) --> [bố].
nn(X^Y^mẹ(Y, X)) --> [mẹ].
nn(_) --> [người].
nnp(nam) --> [nam].
cc(X^Y^(X & Y)) --> [và].
vb(X^B^M^(yêu_quý(B, X) & yêu_quý(M, X))) --> [yêu, quý].
det((X^B^M^Q)^P^B^M^với_mọi(X, P => Q)) --> [mọi].

np33(Y) --> np22(C^Y), nnp(C).
np33(X) --> nn(Y^X), np(Y).
np33(X) --> nn(X).
np33(X) --> nnp(X).
np33(X) --> det(X), nn(_).
np22(C^Y) --> nn(C^X), cc(X^Z^Y), nn(C^Z).
vp33(T^B^M^Y) --> vb(C^B^M^Q), np33((C^B^M^Q)^T^B^M^Y).

sen(Y) --> np33((B^B1) & (M^M1)), vp33((B1 & M1)^B^M^Y).