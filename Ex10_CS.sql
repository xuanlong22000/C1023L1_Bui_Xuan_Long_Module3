SELECT hd.id AS ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem
FROM hop_dong hd
JOIN hop_dong_chi_tiet hdct ON hd.id = hdct.id_hop_dong
GROUP BY hd.id;
