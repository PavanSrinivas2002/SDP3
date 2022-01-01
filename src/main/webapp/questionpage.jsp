<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<nav>
<a href="/home">Home</a>&nbsp;
<a href="/browse">Browse</a>&nbsp;
<a href="/youranswers">Your Answers</a>&nbsp;
<a href="/questions/${user.username}">Your Questions</a>&nbsp;
<a href="/notifications">Notifications</a>&nbsp;
<a href="/profile">profile</a>&nbsp;
<a href="/login">Logout</a>&nbsp;
</nav>
</div>
<div align="center">
<h2>Welcome ${sessionScope.user.username}</h2>
</div>
<div>
<h3><a href="/askquestion">Your questions will be displayed here</a></h3>
</div>
<br><br>
 <c:forEach items="${questions}" var="question">
 
 <div align="center" style="background-color:yellow">
<a href="/question/<c:out value="${question.id}"/>">
 <p>  <c:out value="${question.ques}"/></p>
 <p>asked by <c:out value="${question.username}"/> on <c:out value="${question.date}"/></p>
 </a>
 </div>
 <br>
 </c:forEach>

</body>
</html>