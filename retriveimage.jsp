<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* , java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>image</title>
</head>
<body>
<%! byte b[]=null; 
	//int value;
%>
<%
	String ss=request.getParameter("id");
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/appdatabase","root","mitul123");
		PreparedStatement pst=con.prepareStatement("select * from iteams where id=?");
		pst.setInt(1,Integer.parseInt(ss));
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			b=rs.getBytes("image");
			//value=rs.getInt("value");
		}
		response.setContentType("image/gif");
		OutputStream os=response.getOutputStream();
		os.write(b);
		//out.print(value);
		os.flush();
		os.close();
	}catch(Exception e)
	{
		out.println(e.getMessage());
	}
%>


</body>
</html>