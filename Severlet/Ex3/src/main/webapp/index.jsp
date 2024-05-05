<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form style="display: flex;flex-direction: column;gap: 10px;width: 25%" action="/calculator" method="post">
    <label for="firstNum">First Number</label>
    <input type="number" id="firstNum" name="firstNum">
    <label for="Cal">Cal</label>
    <select name="cal" id="Cal">
        <option value="" disabled>Choose Cal</option>
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>
    <label for="secondNum">Second Number</label>
    <input type="number" id="secondNum" name="secondNum">
    <button type="submit">Submit</button>
</form>
</body>
</html>