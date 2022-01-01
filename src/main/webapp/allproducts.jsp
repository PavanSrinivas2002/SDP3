<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/jpeg" sizes="60x60" href="download1.jpg">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap-4.css">
  <link rel="stylesheet" href="css/home-styles.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  
  <link rel="stylesheet" href="css/fontawesome-all.min.css">
</head>

  <body  style=" background-color: black">
<br>
    <div class="navbar">
               <div class="menu">
                <a href="managerindex.jsp">Home</a>
                <a href="login.jsp">Logout</a>
               </div>
            </div>
<section class="gallery">
    <h1>PrOduCts</h1>
    
     
     <div class="row">
     <c:forEach items="${products}" var="product">
     <div class="col-sm-4">
     <div class="card" style="width: 18rem;">
     <img class="card-img-top" src="${product.getPhotosImagePath()}" alt="Card image cap">
     <div class="card-body">
    <h5 class="card-title">${product.pname}</h5>
    <h6 class="card-subtitle mb-2 text-muted">${product.category}</h6>
    <p class="card-text">${product.description}</p>
    <a href="#" class="btn btn-primary">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/deleteproduct/${product.pid}" class="btn btn-primary">Delete</a>
  </div>
</div>
</div>
 </c:forEach>
</div>
  </section>
</body>
</html>