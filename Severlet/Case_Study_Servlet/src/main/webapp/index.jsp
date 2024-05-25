<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Furama</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="d-flex justify-content-around" style="border: 1px solid black;padding: 25px">
    <nav class="d-flex" style="gap: 25px">
        <a class="text-decoration-none" href="/">Home</a>
        <a class="text-decoration-none" href="/furama?action=customer&page=1">Customer</a>
        <a class="text-decoration-none" href="/furama?action=employee">Employee</a>
        <a class="text-decoration-none" href="/furama?action=service">Service</a>
        <a class="text-decoration-none" href="/furama?action=contract">Contract</a>
    </nav>

    <input type="text" placeholder="Search">
</div>

<div class="d-flex" style="height: 100vh">
    <ul style="width: 25%;height: 100%; border: 1px solid black">
        <li>Item 1</li>
        <li>Item 2</li>
        <li>Item 3</li>
    </ul>
    <nav class="d-flex justify-content-center align-items-center" style="width: 75%;border: 1px solid black;gap: 20px">
        <a class="text-decoration-none" href="/furama/createCustomer.jsp">Create Customer</a>
        <a class="text-decoration-none" href="/furama/createEmployee.jsp">Create Employee</a>
        <a class="text-decoration-none" href="/furama/createService.jsp">Create Service</a>
        <a class="text-decoration-none" href="/furama/createContract.jsp">Create Contract</a>
    </nav>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>