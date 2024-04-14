SELECT dv.id AS id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id
WHERE dv.id IN (
    SELECT DISTINCT hd.id_dich_vu
    FROM hop_dong hd
    JOIN khach_hang kh ON hd.id_khach_hang = kh.id
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
)
AND dv.id NOT IN (
    SELECT DISTINCT hd.id_dich_vu
    FROM hop_dong hd
    JOIN khach_hang kh ON hd.id_khach_hang = kh.id
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
);
