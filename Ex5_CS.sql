SELECT kh.id AS id_khach_hang, kh.ho_ten, lk.ten_loai AS ten_loai_khach, hd.id AS ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
    (dv.chi_phi_thue + hdct.so_luong * dvdk.gia) AS tong_tien
FROM khach_hang kh
LEFT JOIN loai_khach lk ON kh.id_loai_khach = lk.id
LEFT JOIN hop_dong hd ON kh.id = hd.id_khach_hang
LEFT JOIN hop_dong_chi_tiet hdct ON hd.id = hdct.id_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem = dvdk.id
LEFT JOIN dich_vu dv ON hd.id_dich_vu = dv.id
GROUP BY hd.id;
