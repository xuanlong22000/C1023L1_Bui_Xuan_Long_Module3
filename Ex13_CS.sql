SELECT dvdk.id AS id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, COUNT(hd.id) AS so_lan_su_dung
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON dvdk.id = hdct.id_dich_vu_di_kem
JOIN hop_dong hd ON hdct.id_hop_dong = hd.id
GROUP BY dvdk.id
ORDER BY so_lan_su_dung DESC
LIMIT 1;
