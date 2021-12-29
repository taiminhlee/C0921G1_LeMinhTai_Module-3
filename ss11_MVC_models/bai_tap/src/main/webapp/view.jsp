<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/12/2021
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<h1 class="text-center">Product details</h1>

<table class="table bg-primary">
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Description</th>
        <th scope="col">Brand</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">${requestScope["product"].getId()}</th>
        <td>${requestScope["product"].getName()}</td>
        <td>${requestScope["product"].getPrice()}</td>
        <td>${requestScope["product"].getDescription()}</td>
        <td>${requestScope["product"].getBrand()}</td>
    </tr>
    </tbody>
</table>
<p class="text-center">
    <a href="${pageContext.request.contextPath}/products">Back to customer list</a>
</p>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
