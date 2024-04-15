SELECT id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi FROM nhan_vien
UNION
SELECT id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi FROM khach_hang;
