<html>
    <head>
        <title>Login Form</title>
       <link href="css/styless.css" rel="stylesheet" />
        <link href="css/responsive.css" rel="stylesheet" />
           </head>
    
    <div class="hero">
             <div class="navbar">
               <div class="menu">
                <a href="index.jsp">Home</a>
                <a href="about.jsp">About</a>
                <a href="contact.jsp">Contact Us</a>
              
               </div>
           
    <body style=" background-image: url('images/logo2.jpg');background-size: cover;">
        <div class="hero">
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="signin()">Sign In</button>
                    <button type="button" class="toggle-btn" onclick="signup()">Register</button>
                </div>    
				     <div class="social-icons">
                    <img src="images/facebook.png">
               
                    <img src="images/github.png">
                </div>
                
                <form id="signin" class="input-group" onsubmit="insignin()" method="post" action="/logincheck" modelAttribute="u">
                
                     <input type="text" class = "input-field" id="myEmail" name="username"  placeholder="Username" required>
                    <input type="password" class="input-field" id="in-password" name="password" placeholder="Password" required>
                    <input type="checkbox" class="check-box"><span>Remember Password</span>
                  
                    <button type="submit" class="submit-btn" >Sign In</button>
					
                </form>
                <form id="signup" class="input-group" onsubmit="upsignup()" method="post" action="/adduser" modelAttribute="u">
                    <input type="text" class="input-field" id="name" name="username" placeholder="User Name" required>
                    <input type="email" class="input-field" id="up-emailId" name="email" placeholder="Email Id" required>
                    <input type="text" class="input-field" id="up-emailId" name="phone" placeholder="Phone no" required>
                    <input type="password" class="input-field" id="up-password" name="password"placeholder="Password" required>
                    <input type="checkbox" id="up-checkbox" name="check" class="check-box"><span>I Agree To The Terms And Conditions</span>
                    <button type="submit" class="submit-btn" >Register</button>
					
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("signin");
            var y = document.getElementById("signup");
            var z = document.getElementById("btn");

            function signup(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            function signin(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }
            function insignin(){
                var emailId = document.getElementById("in-emailId").value;
                var password = document.getElementById("in-password").value;
                var e=0,p=0;
                
            }
            function upsignup(){
                var name = document.getElementById("name").value;
                var emailId = document.getElementById("up-emailId").value;
                var password = document.getElementById("up-password").value;
                var e = false,p = false,n = false;
                if(name != "") {
                    n = true;
                } if(emailId != "") {
                    e = true;
                } if(password != "") {
                    p = true;
                }

                if(!(n && e && p)) {
                    alert("Missing The Credentials");
                } else if(document.getElementById("up-checkbox").checked == false){
                    alert("Please Agree To The Terms And Conditions");
                } 
            }
        </script>
    </body>
</html>