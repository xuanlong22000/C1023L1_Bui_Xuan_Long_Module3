<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product List</h1>
<a href="/">Back Home</a>


<form action="/product?action=find" method="post">
    <label for="productName">Product Name:</label>
    <input type="text" id="productName" name="name">
    <input type="submit" value="Search">
</form>

<table class="table">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>
                <a style="color: black;text-decoration: none" href="/product?action=edit&id=${product.id}">
                    <button>Edit</button>
                </a>
            </td>
            <td>
                <form action="/product?action=delete" method="post">
                    <input type="hidden" name="id" value="${product.id}">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
