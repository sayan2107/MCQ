<%-- 
    Document   : view
    Created on : Aug 26, 2017, 8:54:04 PM
    Author     : sayan
--%>

<%@page import="oracle.net.aso.i"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.websocket.Session"%>
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

            check = function () {
                var id = document.getElementById("q_id").value;
                var status = document.getElementById("status");
                if (document.getElementById("a").checked)
                    var ans = 'a';
                else if (document.getElementById("b").checked)
                    var ans = 'b';
                else if (document.getElementById("c").checked)
                    var ans = 'c';
                else if (document.getElementById("d").checked)
                    var ans = 'd';
                else
                    var ans = "";

                if(ans===""){
                    checkEmpty();
                    
                }else if(ans !== "") {
                    var hr = new XMLHttpRequest();
                    var v = "answer?id=" + id;
                    hr.open("GET", v, true);
                    hr.send(null);
                    //hr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    //var sum='<%= session.getAttribute("sum")%>';
                    hr.onreadystatechange = function () {
                        if (hr.readyState === 4 && hr.status === 200) {
                            if (hr.responseText === ans) {
                                document.getElementById("answer").innerHTML = "Right it's option " + hr.responseText.toUpperCase();
                            } else {
                                document.getElementById("answer").innerHTML = "Wrong it's option " + hr.responseText.toUpperCase();
                            }
                        }
                    };
                }

            };


            loadNext = function (i) {
                var hr = new XMLHttpRequest();
                var v = "fetchQuestion.jsp?q=" + i;
                hr.open("GET", v, true);
                hr.send(null);
                hr.onreadystatechange = function () {
                    if (hr.readyState === 4 && hr.status === 200) {
                        document.getElementById("test").innerHTML = hr.responseText;
                    }
                };

            };



            checkEmpty = function () {
                var hr = new XMLHttpRequest();
                var id = document.getElementById("q_id").value;
                var v = "answer?id=" + id;
                hr.open("GET", v, true);
                hr.send(null);
                hr.onreadystatechange = function () {
                    if (hr.readyState === 4 && hr.status === 200) {
                        document.getElementById("answer").innerHTML = "option " + hr.responseText.toUpperCase();
                    }
                };
            };
            
        </script>
    </head>


    <body>
        <div id="test">
            <%
                try{
                int i = Integer.parseInt(request.getParameter("q"));
                ArrayList<Integer> arr=(ArrayList<Integer>)session.getAttribute("arr");
               //System.out.println(arr);
                arr.remove(0);
                HttpSession hs = request.getSession();
                hs.setAttribute("arr", arr);  
                %>
                <script>
                loadNext(<%=i%>);
                </script>
            <%
                }catch(NullPointerException e){
                 response.sendRedirect("login.jsp");
              }
               catch(Exception e){
                    response.sendRedirect("thanks.jsp");
                }
            %>
        </div>
    </body>
</html>
