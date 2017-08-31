<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Signup</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">    
         <script>
            function chkuser(){   
            var uname = document.getElementById("uname").value;
             var status = document.getElementById("status");
              var hr = new XMLHttpRequest();
           if(uname!==null){
                var v = "checkuser?uname="+uname;
		hr.open("GET", v , true);
		hr.send(null);
                status.innerHTML = 'checking...';
                //hr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		hr.onreadystatechange = function() {
			if(hr.readyState == 4 && hr.status == 200) {
                            if(hr.responseText!=="ok"){
                                 status.innerHTML = hr.responseText;
                                 document.getElementById("uname").value=""; 
                             }
                             else
                                 status.innerHTML = "";
			}
		}
           }
          
        }
    
        </script> 
    </head>
    <body>
        <h1>Signup now</h1>
        <form method="GET" action="signup">
            NAME: <input type="text" name="name" required="" value=""><br><br>
            EMAIL: <input type="email" name="email" required="" value=""><br><br>
            CONTACT NO: <input type="number" name="contact" required="number" value=""><br><br>
            ADDRESS: <input type="text" name="address" required="" value=""><br><br>
            USER ID: <input type="text" name="uname" required="" id="uname" onblur="chkuser()"><span id="status"></span><br><br>
           PASSWORD: <input name="pass" required="required" type="password" id="password" /><br><br>
   CONFIRM PASSWORD: <input required="required" type="password" id="password_confirm" oninput="check(this)" />
<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value !== document.getElementById('password').value) {
            input.setCustomValidity('Password Must be Matching.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
</script>
<br /><br />
<input type="submit" value="Sign Up"/><br><br>
        </form>
    </body>
</html>
