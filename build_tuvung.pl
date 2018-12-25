nnp(nam) --> [nam].
nn(the_thao) --> [the, thao].
rb(rat) --> [rat].
vb(X^Y^Z^thich(Z, X, Y)) --> [thich].
np(X) --> nnp(X).
np(X) --> nn(X).
vp(X) --> rb(Z), vb(Y^Z^X), np(Y).
sen(Y) --> np(X), vp(X^Y).
