<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>c:out example</title></head>
<body>
<h2>Customers Table</h2>

<table style="width: 100%">
    <tr>
        <th>Name</th>
        <th>DOB</th>
        <th>Address</th>
        <th>Image</th>
    </tr>

    <c:forEach items="${customers}" var="cust">
        <tr>
            <td style="text-align: center">${cust.name}</td>
            <td style="text-align: center">${cust.dob}</td>
            <td style="text-align: center">${cust.address}</td>
            <td style="text-align: center">
                <img width="50" height="50" src="${cust.imageURL}" alt="">
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>