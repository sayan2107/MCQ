<%-- 
    Document   : logout
    Created on : Aug 26, 2017, 3:50:40 PM
    Author     : sayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            session = request.getSession();
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
