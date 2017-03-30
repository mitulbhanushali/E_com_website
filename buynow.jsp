<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.left{
	display:inline-block;
	margin-left:50px;
	margin-top:100px;
	margin-right:50px;
	border:solid;
}
.outer{
display:inline-block;
	margin-left:140px;
	margin-top:100px;
	border:solid;
}
</head>
<body>
<%
	out.clear();
	String s=request.getParameter("id");
	out.println(s);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/appdatabase","root","mitul123");
	PreparedStatement pst=con.prepareStatement("select * from iteams where id=?");
	pst.setInt(1, Integer.parseInt(s));
	ResultSet rs=pst.executeQuery();
	String imgs="retriveimage.jsp?id=";
	if(rs.next()){
		String img=imgs+s;
	out.println(rs.getString("name"));
	out.println(rs.getInt("price"));
	}%>
	
	<h3>welcome</h3>

</body>
</html>
