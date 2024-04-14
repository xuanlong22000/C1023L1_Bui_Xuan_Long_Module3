UPDATE dich_vu_di_kem
SET gia = gia * 2
WHERE id IN (
    SELECT id_dich_vu_di_kem
    FROM hop_dong_chi_tiet hdct
    JOIN hop_dong hd ON hdct.id_hop_dong = hd.id
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
    GROUP BY id_dich_vu_di_kem
    HAVING COUNT(hdct.id) > 10
);