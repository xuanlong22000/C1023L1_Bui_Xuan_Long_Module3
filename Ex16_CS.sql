DELETE FROM nhan_vien
WHERE id NOT IN (
    SELECT DISTINCT id_nhan_vien
    FROM hop_dong
);
