<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>File Uploading Form</title>
</head>

<%
	ResultSet rs = null;
	Connection con = null;
	Statement st = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish", "Manny@123");

		String q = "select cid from class";
		st = con.createStatement();
		rs = st.executeQuery(q);		
		con.close();

	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>

<body>
	<h2>Add Attendance:</h2>
	<br />

	<form action="attendanceupload.jsp" method="post"
		enctype="multipart/form-data">


		<%
			String s=request.getParameter("classid");
			out.println("This is classid"+s);
		%>

		Select your file to upload <input type="file" name="upload"> <input
			type="submit" value="upload">
	</form>

</body>

</html>
