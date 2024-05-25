<%--
  Created by IntelliJ IDEA.
  User: longb
  Date: 5/20/2024
  Time: 7:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<form class="d-flex flex-column gap-2 p-4" action="/furama?action=editCustomer&id=${customer.id}" method="post">
    <label for="name">Name</label>
    <input type="text" placeholder="Name" id="name" name="Name" value="${customer.name}">
    <label for="dob">DOB</label>
    <input type="date" placeholder="DOB" id="dob" name="DOB" value="${customer.birthday}">

    <label>Gender</label>
    <div>
        <label for="male">Male</label>
        <input type="radio" id="male" value="Male" name="gender" checked="${customer.gender eq 'Male'}">
        <label for="female">Female</label>
        <input type="radio" id="female" value="Female" name="gender" checked="${customer.gender eq 'Female'}">
    </div>

    <label for="idCard">Id Card</label>
    <input type="number" placeholder="Id Card" id="idCard" name="Id_Card" value="${customer.id_card}">

    <label for="phonenumber">Phone Number</label>
    <input type="number" placeholder="Phone Number" id="phonenumber" name="PhoneNumber" value="${customer.phone}">

    <label for="email">Email</label>
    <input type="text" placeholder="Email" id="email" name="Email" value="${customer.email}">

    <label for="type">Type</label>
    <select name="type" id="type">
        <option value="" disabled selected>Choose Type</option>
        <option value="1" selected="${customer.type eq '1'}">Diamond</option>
        <option value="2" selected="${customer.type eq '2'}">Platinium</option>
        <option value="3" selected="${customer.type eq '3'}">Gold</option>
        <option value="4" selected="${customer.type eq '4'}">Silver</option>
        <option value="5" selected="${customer.type eq '5'}">Member</option>
    </select>

    <label>Address</label>
    <input type="text" placeholder="Address" name="Address" value="${customer.address}">

    <button class="mt-4" type="submit">Edit Customer</button>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
