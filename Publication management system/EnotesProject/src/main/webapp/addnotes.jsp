<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please login....");

}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="all_component/navbar.jsp"%>

		<h1 class="text-center">Add Your Notes</h1>


		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">

						<div class="form-group">


							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");

							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">


							<%
							}
							%>



							<label for="exampleInputEmail1">Book Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter Here"
								name="title" required="required">
						</div>

						<label for="exampleInputEmail1">Note Content</label>

						<div class="form-group">
							<textarea rows="8" cols="100" class="from-control"
								placeholder="Enter Your Content" name="content"
								required="required">
							</textarea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>


						</div>
					</form>


				</div>

			</div>

		</div>

	</div>


	<%@include file="all_component/footer.jsp"%>
</body>
</html>