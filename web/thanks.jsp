<%-- 
    Document   : thanks
    Created on : Aug 28, 2017, 1:14:51 PM
    Author     : sayan
--%>

<%@page import="com.quiz.model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            user u=(user)session.getAttribute("user");
        %>
        <h1>Thank you <%= u.getName() %>.You have successfully compleated your exam.</h1>
        <h2>we have you mailed you at <%= u.getEmail() %></h2>
        <h2>We would love to here you at test@domain.com</h2>
        <h2><a href="welcome.jsp">click here</a> to Boot your MCQ skills more.....</h2>
        
    </body>
</html>
