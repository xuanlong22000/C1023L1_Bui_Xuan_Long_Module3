SELECT kh.id, kh.ho_ten, COUNT(hd.id) AS so_lan_dat_phong
FROM khach_hang kh
LEFT JOIN hop_dong hd ON kh.id = hd.id_khach_hang
LEFT JOIN loai_khach lk ON kh.id_loai_khach = lk.id
WHERE lk.ten_loai = 'Diamond'
GROUP BY kh.id, kh.ho_ten
ORDER BY so_lan_dat_phong;
