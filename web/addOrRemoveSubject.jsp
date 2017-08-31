<%-- 
    Document   : addSubject
    Created on : Aug 28, 2017, 11:14:26 PM
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
        <title>Add or Remove Subject</title>
        <style>
            input{
                width: 100%;
            }
        </style>
        
        <script>
            addSubject = function(){
            var id = document.getElementById("id").value;
            var subject = document.getElementById("subject").value;
            if(id!=="" && subject!==""){
            var hr = new XMLHttpRequest();
            var v = "addSubject?id=" + id + "&subject=" + subject;
            hr.open("GET", v, true);
            hr.send();
            hr.onreadystatechange = function() {
            if (hr.readyState === 4 && hr.status === 200) {
                    if(hr.responseText === "ok"){
                        window.location = self.location; 
                    } else{
                    document.getElementById("status").innerHTML = hr.responseText;
                    }
            }
        };
    }else{
        document.getElementById("status").innerHTML = "Fill out empty fields";
     }
    }
    
    
    
    
    removeSubject= function(val){
        var hr = new XMLHttpRequest();
            var v = "removeSubject?val="+val;
            hr.open("GET", v, true);
            hr.send(null);
             hr.onreadystatechange = function() {
            if (hr.readyState === 4 && hr.status === 200) {
                    if(hr.responseText === "removed"){
                      window.location="addOrRemoveSubject.jsp";
                    } else{
                    document.getElementById("status").innerHTML = hr.responseText;
                    }
            }
        };
    }
    
        </script>
    </head>
    <body>
        <% String name=(String)session.getAttribute("admin_name"); 
        if(name!=null){
            %>
            <a href="logout.jsp">logout</a>
        <h1>Add or Remove Subject</h1>
        
        <table border="1px solid black">
            <tr>
                <th>id</th>
                <th colspan="2">subject</th>
            </tr>
            <%
                try {
                    MyConnection m = new MyConnection();
                    Connection cn = m.GetConn();
                    String sql = "select * from subjects order by ID";
                    PreparedStatement ps = cn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id")%></td>  
                <td><%= rs.getString("subject")%></td> 
                <td><input type="button" value="X" onclick="removeSubject(<%= rs.getInt("id")%>)"></td>
            </tr>
            <%
                    }
                rs.close();
                cn.close();
                ps.close();
            } catch (Exception e) {
                    System.out.println(e);
                }
            %>
            <tr>
                <td><input type="text" autofocus="autofocus" name="id" id="id" placeholder="id"></td>
                <td><input type="text"  name="subject" id="subject" placeholder="subject"></td>
                <td><input type="button" value="+" name="btn" id="btn" onclick="addSubject()"></td>
            </tr>
        </table>
        <span id="status"></span>
         <%@include file="addOrRemoveQuestion.jsp" %>
          <%}else{
        response.sendRedirect("login.jsp");
}%>
    </body>
</html>
