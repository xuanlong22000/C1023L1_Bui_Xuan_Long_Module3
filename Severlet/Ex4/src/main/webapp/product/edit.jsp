<%--
  Created by IntelliJ IDEA.
  User: longb
  Date: 5/8/2024
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=edit" method="post">
    <table class="table">
        <tr>
            <td>ID</td>
            <td>
                <input type="text" name="id" value="${product.id}">
            </td>
        </tr>
        <tr>
            <td>Name</td>
            <td>
                <input type="text" name="name" value="${product.name}">
            </td>
        </tr>
        <tr>
            <td>Price</td>
            <td>
                <input type="number" name="price" value="${product.price}">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Edit</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
