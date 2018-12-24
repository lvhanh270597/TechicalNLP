giá_trị(nam).
giá_trị(hà_nội).
giá_trị(lớp_mười_hai).
giá_trị(đạt).
giá_trị(nhi).
giá_trị(môn_toán).
giá_trị(lớp).
giá_trị(thể_thao).
giá_trị(rất).
giá_trị(hoa).
giá_trị(hai_năm).
giá_trị(họ).
giá_trị(thư_viện).
giá_trị(hay).
giá_trị(lan).
sống_ở(nam, hà_nội).
bố(đạt, nam).
giám_đốc(đạt).
mẹ(nhi, nam).
giáo_viên(nhi, môn_toán).
học_giỏi(nam, môn_toán).
hoc_sinh_giỏi(nam, lớp).
thích(nam, thể_thao, rất).
ban_gái(hoa, nam).
yêu(hoa, nam, hai_năm).
yêu(nam, hoa, hai_năm).
đọc_sách(họ, thư_viện, hay).
yêu_qúy(đạt, lan).
yêu_qúy(nhi, lan).
học_sinh(nam).
học_cùng_lớp(hoa, nam).
học_cùng_lớp(nam, hoa).
học(nam, lớp_mười_hai).
học(X, Y) :- học_cùng_lớp(Z, X), hoc(Z, Y).