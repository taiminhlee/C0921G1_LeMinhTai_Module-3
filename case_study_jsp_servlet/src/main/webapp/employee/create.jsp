<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 31/12/2021
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="employee?action=employee">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="employee?action=create">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Employee</h2>
            </caption>
            <tr>
                <th>Position</th>
                <td>
                    <select name="position">
                        <c:forEach var="position" items="${position}">
                            <option  value="${position.positionId}">${position.positionName}</option>
                        </c:forEach>

                    </select>
                </td>
                <th>Division</th>
                <td>
                    <select name="division">
                        <c:forEach var="division" items="${division}">
                            <option  value="${division.divisionId}">${division.divisionNamex}</option>
                        </c:forEach>

                    </select>
                </td>
                <th>Education degree</th>
                <td>
                    <select name="education">
                        <c:forEach var="education" items="${educationDegrees}">
                            <option  value="${education.educationId}">${education.educationName}</option>
                        </c:forEach>

                    </select>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Birthday:</th>
                <td>
                    <input type="date" name="birthday" id="birthday" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td>
                    <input type="radio" name="gender" value="1" > Male
                    <input type="radio" name="gender" value="0"> Female
                </td>
            </tr>
            <tr>
                <th>Id Card:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="15"/>
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
