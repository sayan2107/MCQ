<%-- 
    Document   : welcome
    Created on : Aug 26, 2017, 12:37:10 PM
    Author     : sayan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.conn.MyConnection"%>
<%@page import="com.quiz.model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome</title>
    </head>
    <body>
        <%
            user u=(user)session.getAttribute("user");
           try{if(u.getUname()!=null){
        %>
        <div>
            welcome <%= u.getName() %> &nbsp; <a href="logout.jsp">logout</a>
        </div><br><br>
        
        <h1>Which exam do you wanna give?</h1>
        <%
           
           MyConnection m=new MyConnection();
           Connection cn=m.GetConn();
           String sql="select * from subjects";
           PreparedStatement ps = cn.prepareStatement(sql);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               %>
               <h1> <a href="exam.jsp?subid=<%= rs.getString("id") %>"> <%= rs.getString("subject") %> </a></h1>
           <%}
            cn.close();
            rs.close();
            ps.close();
          %>
        
        <% }
}catch(Exception e){
          response.sendRedirect("login.jsp");
}
%>
    </body>
</html>
