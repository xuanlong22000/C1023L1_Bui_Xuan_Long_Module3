SELECT * FROM khach_hang 
WHERE YEAR(CURRENT_DATE) - YEAR(ngay_sinh) BETWEEN 18 AND 50 
AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');
