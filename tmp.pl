:-op(780, xfy, &).
:-op(750, xfy, =>).

nn(X^Y^bố(Y, X)) --> [bố].
nn(X^Y^mẹ(Y, X)) --> [mẹ].
nn(_) --> [người].
nnp(nam) --> [nam].
cc(X^Y^(X & Y)) --> [và].
vb(X^B^M^(yêu_quý(B, X) & yêu_quý(M, X))) --> [yêu, quý].
det((X^B^M^Q)^P^B^M^với_mọi(X, P => Q)) --> [mọi].

np(Y) --> np2(C^Y), nnp(C).
np(X) --> nn(Y^X), np(Y).
np(X) --> nn(X).
np(X) --> nnp(X).
np(X) --> det(X), nn(_).
np2(C^Y) --> nn(C^X), cc(X^Z^Y), nn(C^Z).

vp(T^B^M^Y) --> vb(C^B^M^Q), np((C^B^M^Q)^T^B^M^Y).

sen(Y) --> np((B^B1) & (M^M1)), vp((B1 & M1)^B^M^Y).