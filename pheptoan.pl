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