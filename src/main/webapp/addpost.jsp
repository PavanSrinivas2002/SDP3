<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/styles1.css">
<!------ Include the above in your HEAD tag ---------->
<title>Add Post</title>
</head>
<body>
<div class="navbar">
               <div class="menu">
                <a href="managerindex.jsp">Home</a>
                <a href="login.jsp">Logout</a>
               </div>
            </div>
      <h1 align = center style="color: white">ADD POST</h1>
<div class="reg-box">
<form class="reg" enctype="multipart/form-data" method="post" action="/addpost" modelAttribute="p" >


<!-- Form Name -->


<!-- Text input-->

<!-- Textarea -->
<table align="center" cellspacing = "2" cellpadding = "2">

<tr>
  <th><h4>PRODUCT DESCRIPTION</h4></th>
    <th> <textarea placeholder = "ENTER PRODUCT DESCRIPTION" name="content"></textarea></th>
  </tr>
  
  <tr><input  type="hidden" name="manager" value=${sessionScope.admin.username}>  </tr>
  <tr>
 <th>  <label for="img">Select image:</label></th>
  <th> <input id="filebutton" name="image" class="input-file" type="file"></th>
  <!--  <th><input type="submit">-->
  </tr>

  <tr align="center">
    <th colspan = 2><button id="singlebutton" name="singlebutton" class="btn btn-primary">Submit</button></th>
  </tr>

</table>


</form>
</div>
</body>
</html>
