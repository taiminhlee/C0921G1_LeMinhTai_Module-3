<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/12/2021
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<a href="/customer?action=create">Add New User</a>
<div align="center">
    <caption><h2>Search</h2></caption>
   <form action="customer?action=search">
       <input type="hidden" name="action" value="search">
       <input type="text" name="search">
       <button type="submit">Search</button>
   </form>
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>Id Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="list" items="${customerList}">
            <tr>
                <td><c:out value="${list.customerId}"/></td>
                <td><c:out value="${list.customerType.customerTypeName}"/></td>
                <td><c:out value="${list.customerName}"/></td>
                <td><c:out value="${list.customerBirthday}"/></td>
                <td><c:out value="${list.customerGender}"/></td>
                <td><c:out value="${list.customerIdCard}"/></td>
                <td><c:out value="${list.customerPhone}"/></td>
                <td><c:out value="${list.customerEmail}"/></td>
                <td><c:out value="${list.customerAddress}"/></td>
                <td>
                    <a href="/customer?action=edit&id=${list.customerId}">Edit</a>
                    <a href="/customer?action=delete&id=${list.customerId}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
