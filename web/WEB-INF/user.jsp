<%-- 
    Document   : user.jsp
    Created on : 11 Mar, 2023, 6:45:31 AM
    Author     : dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
    </head>

    <h1>Manage Users</h1>
    <c:choose>
        <c:when test="${emptyTable != null}">
            <h2>${emptyTable}</h2>
        </c:when>
        <c:otherwise>
            <table border="1">
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                </tr>
                <c:forEach items="${users1}" var="userData">
                    <tr>
                        <td>${userData.email}</td>
                        <td>${userData.firstName}</td>
                        <td>${userData.lastName}</td>
                        <td><a href="<c:url value='users?action=edit&amp;'>
                                   <c:param name='userEmail' value='${userData.email}' />
                               </c:url>">Edit</a></td>
                        <td><a href="<c:url value='users?action=delete&amp;'>
                                   <c:param name='userEmail' value='${userData.email}' />
                               </c:url>">Delete</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${option == 'edit' or option == 'updateFail'}">
            <h2>Edit User</h2>
            <form action="users" method="post">
                Email: ${printEmail}<br>
                <c:forEach items="${userRow}" var="column">
                    First name:
                    <input type="text" name="fname" value="${column.firstName}"><br>
                    Last name:
                    <input type="text" name="lname" value="${column.lastName}"><br>
                    Password:
                    <input type="password" name="inpassword"><br>
                    Role: <select id="role_selection" name="serole">
                        <c:forEach items="${roles1}" var="roleSel">
                            <option value="${roleSel.roleId}" ${roleSel.roleName == selectedRole ? 'selected="selected"' : ''}>${roleSel.roleName}</option>
                        </c:forEach>                            
                    </select><br>
                </c:forEach>
                <input type="hidden" name="action" value="update">
                <input type="submit" value="Update">
                <a href="<c:url value='users?action=cancel'></c:url>"><input type="button" value="Cancel"></a>
                </form>
            <c:if test="${errorMessage != null}">
                <p>${errorMessage}</p>
            </c:if>
        </c:when>
        <c:otherwise>
            <h2>Add User</h2>
            <form action="users" method="post">
                Email:
                <input type="text" name="email"><br>
                First name:
                <input type="text" name="firstName"><br>
                Last name:
                <input type="text" name="lastName"><br>
                Password:
                <input type="password" name="password"><br>
                Role: <select id="role_selection" name="serole">
                    <c:forEach items="${roles1}" var="roleSel">
                        <option value="${roleSel.roleId}">${roleSel.roleName}</option>
                    </c:forEach>
                </select><br>
                <input type="hidden" name="action" value="add">
                <input type="submit" value="Add user">
            </form>
            <c:if test="${errorMessage != null}">
                <p>${errorMessage}</p>
            </c:if>
            <c:if test="${invalid != null}">
                <p>${invalid}</p>
            </c:if>
        </c:otherwise>
    </c:choose>
</html>