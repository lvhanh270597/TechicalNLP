:-op(780, xfy, &).
:-op(750, xfy, =>).

nn(X^Y^bố(Y, X)) --> [bố].
nn(X^Y^mẹ(Y, X)) --> [mẹ].
nn(_) --> [người].
nnp(nam) --> [nam].
cc(X^Y^(X & Y)) --> [và].
vb(X^Y^yêu_quý(Y, X)) --> [yêu, quý].
det((X^M^Q)^(X^P)^M^với_mọi(X, P => Q)) --> [mọi].

np(Y) --> np2(C^Y), nnp(C).
np(X) --> nn(Y^X), np(Y).
np(X) --> nn(X).
np(X) --> nnp(X).
np(X) --> det(X), nn(_).

np2(C^Y) --> nn(C^X), cc(X^Z^Y), nn(C^Z).

vp(Y) --> vb(C^M^Z), np((C^M^Z)^Y).

sen(Y) --> np(M^X), vp((_^X)^M^Y).