<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product</title>
</head>
<body>
<form action="/product-discount-calculator-servlet" method="post">
  <label for="ProductDescription">Product Description</label>
  <input type="text" id="ProductDescription" name="ProductDescription">
  <label for="ListPrice">List Price</label>
  <input type="number" id="ListPrice" name="ListPrice">
  <label for="DiscountPercent">Discount Percent</label>
  <input type="number" id="DiscountPercent" name="DiscountPercent">
  <button type="submit">Submit</button>
</form>
</body>
</html>