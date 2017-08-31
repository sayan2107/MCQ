<%-- 
    Document   : addOrRemoveQuestion
    Created on : Aug 29, 2017, 2:06:49 AM
    Author     : sayan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.conn.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            insertQuestions = function(subid){
            var v = "insertOrRemoveQuestions.jsp?subid="+subid;
            window.location = v;
    }
        </script>
    </head>
    <body>
        <h1>Add questions</h1>
        <table name="addQuestion" id="addQuestion" border="1px solid black">
            <tr>
                <th>ID</th>
                <th colspan="2">SUBJECT</th>
            </tr>
        <%
            MyConnection m2 = new MyConnection();
                    Connection cn2 = m2.GetConn();
                    String sql2 = "select * from subjects order by ID";
                    PreparedStatement ps2 = cn2.prepareStatement(sql2);
                    ResultSet rs2 = ps2.executeQuery();
                    while (rs2.next()) {
        %>
                   <tr>
                <td><%= rs2.getInt("id")%></td>  
                <td><%= rs2.getString("subject")%></td> 
                <td><input type="button" value="ADD" onclick="insertQuestions(<%= rs2.getInt("id")%>)"></td>
                   </tr>
        
        <% }
                     cn2.close();
                     ps2.close();
                     rs2.close();
        %>
        </table>
    </body>
</html>
