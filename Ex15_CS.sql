SELECT nv.id AS ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
FROM nhan_vien nv
JOIN hop_dong hd ON nv.id = hd.id_nhan_vien
JOIN trinh_do td ON nv.id_trinh_do = td.id
JOIN bo_phan bp ON nv.id_bo_phan = bp.id
WHERE YEAR(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY nv.id
HAVING COUNT(hd.id) <= 3;
