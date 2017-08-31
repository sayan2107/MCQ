<%-- 
    Document   : adminHome
    Created on : Aug 27, 2017, 8:21:24 PM
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
        <% String name=(String)session.getAttribute("admin_name"); 
        if(name!=null){
            %>
            <a href="logout.jsp">logout</a>
         <h1>wanna add subject?<a href="addOrRemoveSubject.jsp">click here</a><br></h1>
        <h1>wanna add questions?<a href="addOrRemoveQuestion.jsp">click here</a><br></h1>
        <%}else{
        response.sendRedirect("login.jsp");
}%>
    </body>
</html>
