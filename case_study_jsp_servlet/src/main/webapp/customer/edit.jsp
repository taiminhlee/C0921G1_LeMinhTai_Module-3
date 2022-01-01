<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="customer?action=customer">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Edit New Customer</h2>
            </caption>
            <c:if test="${customer != null}">
                <input type="hidden" name="id" value="<c:out value='${customer.customerId}' />"/>
            </c:if>
            <tr>
                <th>Type</th>
                <td>
                    <select name="customerTypeId">
                        <option>Chose option ...</option>
                        <c:forEach items="${customerType}" var="item">
                            <c:choose>
                                <c:when test="${item.customerTypeId == customer.customerType.customerTypeId}">
                                    <option value="${item.customerTypeId}" selected> ${item.customerTypeName} </option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${item.customerTypeId}"> ${item.customerTypeName} </option>
                                </c:otherwise>
                            </c:choose>
                       </c:forEach>
                   </select>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" value="${customer.customerName}"/>
                </td>
            </tr>
            <tr>
                <th>Birthday:</th>
                <td>
                    <input type="date" name="birthday" id="birthday" size="15" value="${customer.customerBirthday}"/>
                </td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td>
                    <c:choose>
                        <c:when test="${customer.customerGender == 1}">
                            <input type="radio" name="gender" value="1" checked> Male
                            <input type="radio" name="gender" value="0"> Female
                        </c:when>
                        <c:otherwise>
                            <input type="radio" name="gender" value="1"> Male
                            <input type="radio" name="gender" value="0" checked> Female
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>Id Card:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="15" value="${customer.customerIdCard}"/>
                </td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="15" value="${customer.customerPhone}"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15" value="${customer.customerEmail}"/>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="15" value="${customer.customerAddress}"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
