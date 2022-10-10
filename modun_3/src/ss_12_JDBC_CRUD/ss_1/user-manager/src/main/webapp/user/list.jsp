<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/2/2022
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1 style="color: darkviolet">User Management</h1>
    <h2>
        <a href="/users?action=create" style="color: chartreuse">Add New User</a>
    </h2>
</center>
<center>
    <form action="/users?action=search">
        <input type="text" name="nameSearch" placeholder="Nhập country cần tìm" style="margin-right: 40px">
        <input type="submit" name="action" value="search" style="margin-right: 40px">
    </form>
    <c:if test="${listCustomer.size() ==0 }">
        <p>Không tìm thấy </p>
    </c:if>
</center>

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><a href="/users?action=view&id=${user.id}"><c:out value="${user.name}"/></a></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td><c:out value="${user.phone}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
