SET SQL_SAFE_UPDATES = 0;

UPDATE khach_hang
SET id_loai_khach = 1 -- Diamond
WHERE id_loai_khach = 2 -- Platinum
AND EXISTS (
    SELECT 1
    FROM hop_dong hd
    JOIN hop_dong_chi_tiet hdct ON hd.id = hdct.id_hop_dong
    JOIN dich_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem = dvdk.id
    WHERE hd.id_khach_hang = khach_hang.id
    AND YEAR(hd.ngay_lam_hop_dong) = 2021
    GROUP BY hd.id
    HAVING SUM(hd.tien_dat_coc) + SUM(hdct.so_luong * dvdk.gia) > 10000000
);
