%1 hoa la hoc sinh
học_sinh(hoa).
%2 me nam song o ha noi
mẹ(X, nam) & sống_ở(X, hà_nội).
%3 hoa dang hoc lop muoi hai
học(hoa, lớp_mười_hai).

% bo nam song o ha noi va me nam cung song o ha noi
bố(Y, nam) & sống_ở(Y, hà_nội) & mẹ(X, nam) & sống_ở(X, hà_nội).
% neu nam khong hoc lop 12 thi nam khong yeu lan
~học(nam, lớp_mười_hai) => ~yêu(nam, lan, _).
% neu me nam khong la giao vien day toan thi nam khong hoc gioi toan
mẹ(X, nam) & ~giáo_viên(X, môn_toán) => ~học_giỏi(nam, môn_toán).

% bo nam la ai?
bố(X, nam).
% nam thich cai gi?
thích(nam, X, Y).
% nam yeu ai?
yêu(nam, X, Y).

% moi dua con deu hoc goi mon toan
với_mọi(X, con(X, _) => học_giỏi(X, môn_toán)).
% nam yeu moi hoc sinh
với_mọi(X, học_sinh(X) => yêu(nam, X, _)).
% bo me nam yeu quy moi nguoi
với_mọi(X, bố(Y, nam) & mẹ(Z, nam) => yêu_qúy(Y, X) & yêu_qúy(Z, X)).