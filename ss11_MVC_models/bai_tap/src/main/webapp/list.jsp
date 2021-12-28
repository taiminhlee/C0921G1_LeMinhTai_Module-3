<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/12/2021
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product</h1>
<p>
    <a href="${pageContext.request.contextPath}/products?actionUser=create">Create new product</a>
</p>
<div>
<h2>Search By Country</h2>
<form  action="/products?actionUser=search?">
    <input type="hidden" name="actionUser" value="search">
    <input type="text" name="search" id="search" size="45"/>
    <button type="submit">search</button>

</form>
    <a href="${pageContext.request.contextPath}/products">Back to customer list</a>
</div>
<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Brand</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>${product.getId()}</td>
            <td><a href="/products?actionUser=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getBrand()}</td>
            <td><a href="/products?actionUser=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?actionUser=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
