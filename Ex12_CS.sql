SELECT hd.id AS id_hop_dong, nv.ho_ten AS ho_ten_nhan_vien, kh.ho_ten AS ho_ten_khach_hang, kh.so_dien_thoai, dv.ten_dich_vu, SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem, hd.tien_dat_coc
FROM hop_dong hd
JOIN hop_dong_chi_tiet hdct ON hd.id = hdct.id_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem = dvdk.id
JOIN nhan_vien nv ON hd.id_nhan_vien = nv.id
JOIN khach_hang kh ON hd.id_khach_hang = kh.id
JOIN dich_vu dv ON hd.id_dich_vu = dv.id
WHERE YEAR(hd.ngay_lam_hop_dong) = 2020 AND QUARTER(hd.ngay_lam_hop_dong) IN (2, 3, 4)
AND hd.id NOT IN (
    SELECT hd.id
    FROM hop_dong hd
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021 AND MONTH(hd.ngay_lam_hop_dong) IN (1, 2, 3)
)
GROUP BY hd.id;
