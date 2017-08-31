<%-- 
    Document   : fetchQuestion
    Created on : Aug 27, 2017, 9:34:43 AM
    Author     : sayan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.quiz.conn.MyConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fetch Question</title>
    </head>
    <body>
       <%
           int q=Integer.parseInt((String)request.getParameter("q"));
           String subid=(String)session.getAttribute("subid");
           ArrayList<Integer> arr=(ArrayList<Integer>)session.getAttribute("arr");
          // System.out.println(arr.size());
          // System.out.println(arr);
          if(arr.isEmpty()){
              response.sendRedirect("view.jsp");
          }else{
           try{
           MyConnection m=new MyConnection();
           Connection cn=m.GetConn();
           String sql="select * from MCQ where SUB_ID="+subid+" and Q_ID="+q;
           PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
            %>
            <a href="logout.jsp">logout</a> &nbsp; <a href="welcome.jsp">Home</a><br><br>
            
            <div id="test">
                <h3><%= rs.getString("question") %></h3>
                <h3>options:</h3>
            <form name="form" id="form">
                <input type="text" hidden="" id="q_id" value="<%= rs.getString("q_id") %>">
                <input type="checkbox" name="a" id="a"> <%= rs.getString("a") %> <br>
                <input type="checkbox" name="b" id="b"> <%= rs.getString("b") %> <br>
                <input type="checkbox" name="c" id="c"> <%= rs.getString("c") %> <br>
                <input type="checkbox" name="d" id="d"> <%= rs.getString("d") %> <br>
                <input type="button" value="show answer" onclick="check()"><br><span id="answer"></span><br>
                <input type="button" onclick="location.href='view.jsp?q=<%= arr.get(0) %>'" value="next"/>
            </form> 
            </div>
            <%cn.close();rs.close();ps.close();}else{
                 out.println("<h1>SORRY!!No question left for you.Wanna practice more?<a href='welcome.jsp'>click here</a></h1>");
                 cn.close();rs.close();ps.close();
           }
              }catch(Exception e){
                  out.print("something wrong");
             }
}
       %>
    </body>
</html>
