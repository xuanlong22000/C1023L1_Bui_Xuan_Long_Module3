<%--
  Created by IntelliJ IDEA.
  User: longb
  Date: 5/17/2024
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="d-flex justify-content-around" style="border: 1px solid black;padding: 25px">
    <nav class="d-flex" style="gap: 25px">
        <a class="text-decoration-none" href="/">Home</a>
        <a class="text-decoration-none" href="/furama?action=customer&page=1">Customer</a>
        <a class="text-decoration-none" href="/furama/employee.jsp">Employee</a>
        <a class="text-decoration-none" href="/furama/service.jsp">Service</a>
        <a class="text-decoration-none" href="/furama/contract.jsp">Contract</a>
    </nav>

    <form class="my-0" action="/furama?action=searchCustomer&page=1" method="post">
        <input type="text" placeholder="Search">
        <button>Search</button>
    </form>

</div>

<div class="d-flex" style="height: 100vh">
    <ul style="width: 25%;height: 100%; border: 1px solid black">
        <li>Item 1</li>
        <li>Item 2</li>
        <li>Item 3</li>
    </ul>
    <div class="p-2" style="width: 75%">
        <table style="width: 100%">
            <thead>
            <tr class="text-center">
                <th>ID</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>ID Card</th>
                <th>Phone</th>
                <th>Type</th>
                <th>Email</th>
                <th>Address</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${customerList}" var="customer">
                <tr class="text-center">
                    <td>${customer.id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.birthday}</td>
                    <td>${customer.gender}</td>
                    <td>${customer.id_card}</td>
                    <td>${customer.phone}</td>
                    <td>${customer.type}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>

                    <td>
                        <a style="color: black;text-decoration: none"
                           href="/furama?action=editCustomer&id=${customer.id}">
                            <button>Edit</button>
                        </a>
                    </td>
                    <td>
                        <form class="m-auto" action="/furama?action=deleteCustomer" method="post">
                            <input type="hidden" name="idCustomer" value="${customer.id}">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
        <%--For displaying Previous link except for the 1st page --%>
        <c:if test="${currentPage != 1}">
            <td><a href="/furama?action=customer&page=${currentPage - 1}">Previous</a></td>
        </c:if>

        <%--For displaying Page numbers. The when condition does not display
                    a link for the current page--%>

        <table border="1" cellpadding="5" cellspacing="5">
            <tr>
                <c:forEach begin="1" end="${noOfPages}" var="i">
                    <c:choose>
                        <c:when test="${currentPage eq i}">
                            <td>${i}</td>
                        </c:when>
                        <c:otherwise>
                            <td><a href="/furama?action=customer&page=${i}">${i}</a></td>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </tr>
        </table>

        <%--For displaying Next link --%>

        <c:if test="${currentPage lt noOfPages}">
            <td><a href="/furama?action=customer&page=${currentPage + 1}">Next</a></td>
        </c:if>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
