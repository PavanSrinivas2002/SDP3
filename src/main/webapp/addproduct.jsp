<!DOCTYPE html>
<html>
<head> 
<title>Add Product</title>
<link rel="stylesheet" href="css/styles1.css">
</head>
<body>
	             <div class="navbar">
               <div class="menu">
                <a href="managerindex.jsp">Home</a>
                <a href="login.jsp">Logout</a>
               </div>
            </div>
<h1 align="center">Add Product</h1><br><br>
<div class="reg-box">
<form class="reg" enctype="multipart/form-data" method="post" action="/addproduct" modelAttribute="p" >
<table align="center" cellspacing = "2" cellpadding = "2">
  <tr>
  <th><h4>PRODUCT ID</h4></th>
    <th><input type="text" name="pid" placeholder="ENTER PRODUCT ID" required></th>
  </tr>
  <tr>
    <th><h4>PRODUCT NAME<br></h4></th>
    <th><input type="text-box" name="pname" placeholder="ENTER PRODUCT NAME" required></th>
  </tr>
    <tr>
  <th><h4>PRODUCT CATEGORY</h4></th>
    <th><input type="text" name="category" placeholder="ENTER PRODUCT CATEGORY" required></th>
  </tr>
  
  <tr>
  <th><h4>AVAILABLE QUANTITY</h4></th>
    <th><input type="text" name="quantity" placeholder="ENTER AVAILABLE QUANTITY" required></th>
  </tr>
  
  <tr>
  <th><h4>PRODUCT COLOR</h4></th>
    <th><input type="text" name="color" placeholder="ENTER PRODUCT COLOR" required></th>
  </tr>
  <tr>
  <th><h4>PRODUCT DESCRIPTION</h4></th>
    <th> <textarea placeholder = "ENTER PRODUCT DESCRIPTION" name="description"></textarea></th>
  </tr>
  
  
  <tr  >
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