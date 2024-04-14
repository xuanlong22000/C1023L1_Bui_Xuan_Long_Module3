DELETE FROM khach_hang
WHERE EXISTS (
    SELECT 1
    FROM hop_dong
    WHERE hop_dong.id_khach_hang = khach_hang.id
    AND YEAR(hop_dong.ngay_lam_hop_dong) < 2021
);
