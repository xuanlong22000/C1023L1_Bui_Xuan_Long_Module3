SELECT MONTH(ngay_lam_hop_dong) AS thang, COUNT(DISTINCT id_khach_hang) AS so_khach_hang_dat_phong
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong);
