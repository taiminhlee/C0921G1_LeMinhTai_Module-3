<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h3>Danh sách khách hàng</h3>
<table border="1">
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>

    <c:forEach var="khachHang" items="${list}">
        <tr>
            <td>
                <c:out value="${khachHang.name}"/>
            </td>
            <td>
                <c:out value="${khachHang.birth}"/>
            </td>
            <td>
                <c:out value="${khachHang.address}"/>
            </td>
            <td>
                <img src="${khachHang.img}">
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
