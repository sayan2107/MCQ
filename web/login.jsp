<%-- 
    Document   : login
    Created on : Aug 26, 2017, 11:53:10 AM
    Author     : sayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <script>
            function chkuser(){   
            var uname = document.getElementById("uname").value;
            var password = document.getElementById("password").value;
             var status = document.getElementById("status");
              var hr = new XMLHttpRequest();
              
           if(uname!=="" && password!==""){
                var v = "checklogin?uname="+uname+"&password="+password;
		hr.open("GET", v , true);
		hr.send(null);
                status.innerHTML = 'checking...';
                //hr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		hr.onreadystatechange = function() {
			if(hr.readyState === 4 && hr.status === 200) {
                            if(hr.responseText==="ok"){
                                 //status.innerHTML = hr.responseText;
                                  window.location="welcome.jsp";
                             }
                             else
                                 status.innerHTML = hr.responseText;
			}
		};
           }else{
               status.innerHTML = "Please fill out the empty fields";
           }
          
        }
    
        </script> 
        
    </head>
    <body>
      
        <h1>Login here</h1>
        <form method="post">
    Login:
    <input autofocus="autofocus" type="text" name="uname" id="uname" value="" required="">
     <br>
     <br>
     password:
     <input type="text" name="password" id="password" value="" required="">
     <br><br>
     <input type="button" value="login" onclick="chkuser()"><br><br>
     <span id="status"></span>     
        </form>
        <p>Do no have an account?<a href="signup.jsp">sign up</a> </p>
        <br><br>
        
        <%@include file="adminLogin.jsp" %>
    </body>
</html>
