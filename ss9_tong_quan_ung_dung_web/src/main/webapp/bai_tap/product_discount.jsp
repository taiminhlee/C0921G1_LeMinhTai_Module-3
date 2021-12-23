<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/12/2021
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/discount" method="post">
    <h4>Product Description</h4>
    <input type="text">
    <h4>List Price</h4>
    <input type="text" name="list_price">
    <h4>Discount Percent</h4>
    <input type="text" name="discount_percent">
    <input type="submit" name="calculator">
</form>

</body>
</html>
