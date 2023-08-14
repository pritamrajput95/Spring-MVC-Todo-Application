<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<!--jstl core uri  -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!--spring form uri  -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page isELIgnored="false" %>	
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Add this to your <head> section -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title><c:out value="${page }"></c:out></title>
</head>
<body>
	<div class="container mt-3">
		<h1 class="text-center">Welcome To Do Manager</h1>
           
           <c:if test="${not empty msg }">
           
         <div class="alert alert-success">
             <b>
              <c:out value="${msg}"></c:out>
            </b>
        </div>
           
           </c:if>
            
     		<div class="row mt-4">

			<div class="col-md-2">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">
						Menu</button>
					<a href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action" >Add To Do
                   </a>
					<a href='<c:url value='/home'> </c:url>'
						class="list-group-item list-group-item-action">View To Do
						</a>
					<a href='<c:url value='/aboutUs'> </c:url>'
						class="list-group-item list-group-item-action">About Us
						</a>
				</div>
			</div>

			<div class="col-md-10">
				
				<c:if test="${page=='home'}">
				<h1 class="text-center">All TODO's</h1>
				<c:forEach items="${todos }" var="todo">
				
				<div class="card">
				 <div class="card-body">
				  
				   <h3><c:out value="${todo.todoTitle }"></c:out></h3>
				   <p><c:out value="${todo.todoContent }"></c:out> </p>
				   <p><c:out value="${todo.todoDate }"></c:out>
				 </div>
				</div>
				
				</c:forEach>
				</c:if>
				
				<c:if test="${page=='add'}">
				<h1 class="text-center">Add ToDo</h1>
				<br>
				<form:form  action="saveToDo" method="post" modelAttribute="todo">
				
				<div class="form-group"> 
				<form:input path="todoTitle" cssClass="form-control" placeholder="enter todo title"/>
				</div>
				
				<div class="form-group">
				<form:textarea path="todoContent" cssClass="form-control" placeholder="enter todo content"
				 cssStyle="height:300px"
				/>
				</div>
				
				<div class="container text-center">
				<button class="btn btn-outline-success">Save To Do</button>
				</div>
				</form:form>
				</c:if>
				
				<div class="card">
				 <div class="card-body">
				<c:if test="${page=='aboutUs' }">
				<h3 class="text-center">About Us</h3> <br>
				<p>This is to do application to manage to do work...!</p>
				</c:if>
				</div>
				</div>
				
			</div>

		</div>
	</div>
	
	<!-- Add a script to initialize the Datepicker -->
<script>
    $(function() {
        $("#todoDate").datepicker({
            dateFormat: "yy-mm-dd" // Set the date format
        });
    });
</script>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>