<!-- edituser.jsp -->
<%@page import="com.DAO.*" %>
<%@page import="com.entity.*" %>
<%@page import="com.DB.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin: Edit User Details</title>
	<%@include file="allCss.jsp"%>

	<style>
	</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	



	<div class="container mt-3">
		<div class="row">
			<div class=" col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h4>Edit User Details</h4>

							<c:if test="${not empty succMsg }">
								<p class="text-center text-success">${succMsg }</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty errMsg }">
								<p class="text-center text-danger">${errMsg }</p>
								<c:remove var="errMsg" scope="session" />
							</c:if>

						</div>

						<!--fatching data form database   -->
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
						User_Details b= dao.getUserById(id);
						
					%>


					<form action="../editUser" method="post">

						<div class="form-group">
							<label for="">Name</label> 
							<input type="text" value="<%=b.getName() %>" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter name"
							name="name" required>
							<label for="exampleInputEmail1">Email address</label> 
							<input type="text" value="<%=b.getEmail() %>" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="Enter email" name="email" required> 
							<label
							for="exampleInputEmail1">Phone</label>
							<input type="text" value="<%=b.getPhone() %>"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter phone"
							name="phone" required> 
							<label for="exampleInputEmail1">Address</label>
							<input type="text" value="<%=b.getAddress() %>" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter Address"
							name="address" required>
							<label for="exampleInputEmail1">
							DOB</label> 
							<input type="date" value="<%=b.getDob() %>" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="select dob" name="dob" required>
							<label>Gender</label>
							<select name="gender" class="form-control"
							value="<?php echo $gender; ?>" name="gender" required>
							<option>Male</option>
							<option>Female</option>
						</select>
						
						<input type="text" name="id" value="<%=b.getId() %>">

					</div>


					
					<button type="submit" class="btn btn-primary" name="submit">Submit</button>
				</form>
				<!--  -->

			</div>
		</div>
	</div>


</div>

</div>

<div style="width: 120%; margin-top: 290px;"><%@include
	file="footer.jsp"%></div>
</body>
</html>