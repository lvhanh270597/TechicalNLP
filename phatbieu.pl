%1 hoa la hoc sinh
cal([hoa, là, học, sinh], X).
học_sinh(hoa).
%2 me nam song o ha noi
cal([mẹ, nam, sống, ở, hà, nội], X).
mẹ(X, nam) & sống(X, hà_nội).
%3 hoa dang hoc lop muoi hai
cal([hoa, đang, học, lớp, mười, hai], X).
học(hoa, lớp_mười_hai).

<<<<<<< HEAD
%4 bo va me nam song o ha noi
cal([bố, và, mẹ, nam, cùng, sống, ở, hà, nội], X).
=======
% bo va me nam cung song o ha noi
>>>>>>> e1d9fbf99b4c3fb8a0c2f2e3184ab805984e8b87
bố(Y, nam) & sống(Y, hà_nội) & mẹ(X, nam) & sống(X, hà_nội).
%5 neu nam khong hoc lop 12 thi nam khong yeu lan
~học(nam, lớp_mười_hai) => ~yêu(nam, lan).
%6 nếu mẹ nam không là giáo viên dạy môn toán thì nam không học giỏi môn toán
cal([nếu, mẹ, nam, không, là, giáo, viên, dạy, môn, toán, thì, nam, không, học, giỏi, môn, toán], X).
mẹ(X, nam) & ~giáo_viên(X, môn_toán) => ~học_giỏi(nam, môn_toán).

% bo nam la ai?
bố(X, nam).
% nam thich cai gi?
rất_thích(nam, X).
% nam yeu ai?
yêu(nam, X).

% moi dua con deu hoc gioi mon toan
với_mọi(X, con(X, _) => học_giỏi(X, môn_toán)).
% nam yeu moi hoc sinh
với_mọi(X, học_sinh(X) => yêu(nam, X, _)).
% bo và me nam yeu quy moi nguoi
với_mọi(X, bố(Y, nam) & mẹ(Z, nam) => yêu_qúy(Y, X) & yêu_qúy(Z, X)).
