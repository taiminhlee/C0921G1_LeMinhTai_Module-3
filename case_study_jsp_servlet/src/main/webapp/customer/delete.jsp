<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap Delete Confirmation Modal</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Varela Round', sans-serif;
            background: #666666;
        }
        .modal-confirm {
            color: #636363;
            width: 400px;
        }
        .modal-confirm .modal-content {
            padding: 20px;
            border-radius: 5px;
            border: none;
            text-align: center;
            font-size: 14px;
        }
        .modal-confirm .modal-header {
            border-bottom: none;
            position: relative;
        }
        .modal-confirm h4 {
            text-align: center;
            font-size: 26px;
            margin: 30px 0 -10px;
        }
        .modal-confirm .close {
            position: absolute;
            top: -5px;
            right: -2px;
        }
        .modal-confirm .modal-body {
            color: #999;
        }
        .modal-confirm .modal-footer {
            border: none;
            text-align: center;
            border-radius: 5px;
            font-size: 13px;
            padding: 10px 15px 25px;
        }
        .modal-confirm .modal-footer a {
            color: #999;
        }
        .modal-confirm .icon-box {
            width: 80px;
            height: 80px;
            margin: 0 auto;
            border-radius: 50%;
            z-index: 9;
            text-align: center;
            border: 3px solid #f15e5e;
        }
        .modal-confirm .icon-box i {
            color: #f15e5e;
            font-size: 46px;
            display: inline-block;
            margin-top: 13px;
        }
        .modal-confirm .btn, .modal-confirm .btn:active {
            color: #fff;
            border-radius: 4px;
            background: #60c7c1;
            text-decoration: none;
            transition: all 0.4s;
            line-height: normal;
            min-width: 120px;
            border: none;
            min-height: 40px;
            border-radius: 3px;
            margin: 0 5px;
        }
        .modal-confirm .btn-secondary {
            background: #c1c1c1;
        }
        .modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus {
            background: #a8a8a8;
        }
        .modal-confirm .btn-danger {
            background: #f15e5e;
        }
        .modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
            background: #ee3535;
        }
    </style>
</head>
<body>
<div class="text-center">
    <form method="post">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content">
                <div class="modal-header flex-column">
                    <div class="icon-box">
                        <i class="material-icons">&#xE5CD;</i>
                    </div>
                    <h4 class="modal-title w-100">Are you sure?</h4>
                </div>
                <div class="modal-body">
                    <p>Do you really want to delete this customer? This process cannot be undone.</p>
                    <table>

                        <tr>
                            <td>Id:</td>
                            <c:if test="${customer != null}">
                                <td>${customer.customerId}</td>
                            </c:if>

                        </tr>
                        <tr>
                            <td>Type:</td>
                            <c:forEach items="${customerType}" var="item">
                                <c:choose>
                                    <c:when test="${item.customerTypeId == customer.customerType.customerTypeId}">
                                        <td> ${item.customerTypeName} </td>
                                    </c:when>
                                </c:choose>
                            </c:forEach>

                        </tr>
                        <tr>
                            <td>Name:</td>
                            <td>${customer.getCustomerName()}</td>
                        </tr>
                        <tr>
                            <td>Birthday:</td>
                            <td>${requestScope["customer"].getCustomerBirthday()}</td>
                        </tr>
                        <tr>
                            <td>Gender:</td>
                            <c:choose>
                                <c:when test="${customer.getCustomerGender().equals('1')}">
                                    <td>Male</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Female</td>
                                </c:otherwise>
                            </c:choose>

                        </tr>
                        <tr>
                            <td>Id card:</td>
                            <td>${requestScope["customer"].getCustomerIdCard()}</td>
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td>${requestScope["customer"].getCustomerPhone()}</td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>${requestScope["customer"].getCustomerEmail()}</td>
                        </tr>
                        <tr>
                            <td>Address:</td>
                            <td>${requestScope["customer"].getCustomerAddress()}</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><a href="/customer">Cancel</a></button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>