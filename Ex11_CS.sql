SELECT DISTINCT dvdk.id AS id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.don_vi, dvdk.gia, dvdk.trang_thai
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON dvdk.id = hdct.id_dich_vu_di_kem
JOIN hop_dong hd ON hdct.id_hop_dong = hd.id
JOIN khach_hang kh ON hd.id_khach_hang = kh.id
WHERE kh.id_loai_khach = 1
AND (kh.dia_chi LIKE '%Vinh%' OR kh.dia_chi LIKE '%Quảng Ngãi%');
