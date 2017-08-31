<%-- 
    Document   : adminLogin
    Created on : Aug 27, 2017, 10:06:27 PM
    Author     : sayan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin login</title>
        
        <script>
             function chkadmin(){   
            var uname1 = document.getElementById("uname1").value;
            var password1 = document.getElementById("password1").value;
             var status1 = document.getElementById("status1");
             
              var hr1 = new XMLHttpRequest();
           if(uname1!=="" && password1!==""){
                var v1 = "adminLogin?uname="+uname1+"&password="+password1;
		hr1.open("GET", v1 , true);
		hr1.send(null);
                status1.innerHTML = 'checking...';
                //hr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		hr1.onreadystatechange = function() {
			if(hr1.readyState === 4 && hr1.status === 200) {
                            if(hr1.responseText==="ok"){
                                 //status.innerHTML = hr.responseText;
                                  window.location="adminHome.jsp";
                             }
                             else
                                 status1.innerHTML = hr1.responseText;
			}
		};
           }else{
                status1.innerHTML = "Please fill out the empty fields";
           }
          
        }
    </script>
        
    </head>
    <body>
         <h1>Admin Login Here</h1>
        <form method="post">
    Login:
    <input type="text" name="uname" id="uname1" value="" required="">
     <br>
     <br>
     password:
     <input type="text" name="password" id="password1" value="" required="">
     <br><br>
     <input type="button" value="login" onclick="chkadmin()"><br><br>
     <span id="status1"></span>     
        </form>
    </body>
</html>
