<%-- 
    Document   : fetchQuestions
    Created on : Aug 29, 2017, 11:50:03 AM
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
        <style>
            
            #cross{
                width: 100%;
                height: 53px;
            }
            #main{
                margin: 10px
            }
            #table1{
                float: left;
                width: 55%;
            }
            #add{
                width: 40%;
                float: right;    
            }
        </style>
        
    </head>
    <script>
        removeQuestion = function(q_id){
              var hr = new XMLHttpRequest();
              var v = "removeQuestion?q_id="+q_id;
              hr.open("GET", v, true);
              hr.send();
             hr.onreadystatechange = function() {
            if (hr.readyState === 4 && hr.status === 200) {
                if(hr.responseText === "removed"){
                    window.location = self.location;
                }
                else{
                     document.getElementById("status").innerHTML = hr.responseText;
                 }
            }
        };
        };
           
        
        addQuestion = function(){
            var q_id = document.getElementById("q_id").value;
            var question = filter(document.getElementById("question").value); 
            var a = filter(document.getElementById("a").value);
            var b = filter(document.getElementById("b").value);
            var c = filter(document.getElementById("c").value);
            var d = filter(document.getElementById("d").value);
            var ans = document.getElementById("ans").value;
            if(q_id!=="" && question!=="" && a!=="" && b!=="" && c!=="" && d!=="" && ans!==""){
            var hr = new XMLHttpRequest();
            var v = "addQuestion?q_id="+q_id+"&question="+question+"&a="+a+"&b="+b+"&c="+c+"&d="+d+"&ans="+ans;
            hr.open("GET", v, true);
            hr.send();
            hr.onreadystatechange = function() {
            if (hr.readyState === 4 && hr.status === 200) {
                     if(hr.responseText==="ok"){
                         window.location = self.location;
                     }else{
                         document.getElementById("status").innerHTML = hr.responseText;
                     }
            }
        };
    }else
        document.getElementById("status").innerHTML = "Fill out empty fields";
 };
 
 
 
 
 filter = function(i){
           var b = i.replace(/'/g, "''");
           return b;
        };
 
    </script>
    <body>
        <% String name=(String)session.getAttribute("admin_name"); 
        if(name!=null){
            %>
        <div id="main">
            <div id="table1">
         <a href="logout.jsp">logout</a>
        <h1>Questions present now</h1>
        <table border="1px" id="data">
            <tr>
                <th>id</th>
                <th>Question</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
                <th>Answer</th>
            </tr>
       <%
                    String subid= request.getParameter("subid");
                    HttpSession hs=request.getSession();
                    hs.setAttribute("subid", subid);
                    MyConnection m = new MyConnection();
                    Connection cn = m.GetConn();
                    String sql = "select * from MCQ where SUB_ID="+subid+" order by Q_ID";
                    PreparedStatement ps = cn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
       %>
                    <tr>
                        <td><%= rs.getInt("q_id") %></td>
                        <td><%= rs.getString("question") %></td>
                        <td><%= rs.getString("a") %></td>
                        <td><%= rs.getString("b") %></td>
                        <td><%= rs.getString("c") %></td>
                        <td><%= rs.getString("d") %></td>
                        <td><%= rs.getString("answer").toUpperCase() %></td>
                        <td><input id="cross" type="button" value="x" onclick="removeQuestion(<%= rs.getInt("q_id") %>);"></td>
                    </tr>
       <%}
       cn.close();
       ps.close();
       rs.close();
       %>
<!--                        <tr>
                            <td><input placeholder="ID" type="text" name="q_id" id="q_id"></td>
                            <td><input placeholder="Add question" type="text" name="question" id="question"></td>
                              <td><input placeholder="Option A" type="text" name="a" id="a"></td>
                              <td><input placeholder="Option B" type="text" name="b" id="b"></td>
                              <td><input placeholder="Option C" type="text" name="c" id="c"></td>
                              <td><input placeholder="Option D" type="text" name="d" id="d"></td>
                              <td><input placeholder="Answer(Ex : a)" type="text" name="ans" id="ans"></td>
                              <td><input type="button" value="+" onclick="addQuestion();"></td>
                        </tr>-->
        </table>
  </div>
<div id="add">
        <h1>Add new questions here</h1>
        <form>
            <input placeholder="ID" autofocus="autofocus" type="text" name="q_id" id="q_id"><br>
           <textarea rows="6" cols="75" id="question" placeholder="Question"></textarea><br>
           <textarea rows="3" cols="75" id="a" placeholder="Option A"></textarea><br>
           <textarea rows="3" cols="75" id="b" placeholder="Option B"></textarea><br>
           <textarea rows="3" cols="75" id="c" placeholder="Option C"></textarea><br>
           <textarea rows="3" cols="75" id="d" placeholder="Option D"></textarea><br>
           <input type="test" id="ans" placeholder="Answer (Ex : a /b /c /d)"><br>
            <input type="button" value="Add" onclick="addQuestion();">
        </form><br>
        <span style="color:red" id="status"></span>
     </div>                 
    </div>
<%}else{
        response.sendRedirect("login.jsp");
}%>
    </body>
</html>
