drop database Product_demo;

CREATE DATABASE IF NOT EXISTS Product_demo;
use Product_demo;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) UNIQUE,
    productName VARCHAR(100),
    productPrice DECIMAL(10,2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(20)
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) 
VALUES 
('P001', 'Product 1', 10.99, 100, 'Description for Product 1', 'Available'),
('P002', 'Product 2', 20.99, 50, 'Description for Product 2', 'UnAvailable'),
('P003', 'Product 3', 30.99, 75, 'Description for Product 3', 'Available');

-- Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON Products(productCode);

-- Composite Index trên cột productName và productPrice
CREATE INDEX idx_productName_price ON Products(productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết cách câu lệnh SQL thực thi
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';


-- Tạo view
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Sửa đổi view
CREATE OR REPLACE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

-- Xoá view
DROP VIEW IF EXISTS ProductInfo;

-- Store procedure lấy tất cả thông tin của tất cả các sản phẩm
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;



-- Store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddNewProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //
DELIMITER ;

-- Store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProductById(
    IN p_id INT,
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10,2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET productName = p_productName,
        productPrice = p_productPrice,
        productAmount = p_productAmount,
        productDescription = p_productDescription,
        productStatus = p_productStatus
    WHERE Id = p_id;
END //
DELIMITER ;

-- Store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE DeleteProductById(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE Id = p_id;
END //
DELIMITER ;






