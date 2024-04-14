SELECT hd.id AS id_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, COUNT(hdct.id) AS so_lan_su_dung
FROM hop_dong hd
JOIN hop_dong_chi_tiet hdct ON hd.id = hdct.id_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem = dvdk.id
JOIN dich_vu dv ON hd.id_dich_vu = dv.id
JOIN loai_dich_vu ldv ON dv.id_loai_dich_vu = ldv.id
GROUP BY hd.id, dvdk.id
HAVING so_lan_su_dung = 1;
