<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*"%>
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
</style>
<script type="text/javascript">
	function clic(nam){
	//var name=val;
		document.location.href="buynow.jsp?id="+nam;
		
			
		}
	

</script>
</head>
<body>
<marquee>welcome to our E_com website</marquee>
</br></br>
<center>

<div class="outer" align="center">
<%
	int j=1;
	String imgs="retriveimage.jsp?id=";
	//String buy="buynow.jsp?id=";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/appdatabase","username","password");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from iteams");
	while(rs.next()){
		if(j%3==0){
		String ssm=imgs+rs.getInt("id");
		//String buy1=buy+rs.getInt("id");
		j++;%>
		<div class="left" >
		<table border="0">
		<tr>
		<th>Name</th> <td><%=rs.getString("name") %></td>
		</tr>
		<tr>
		<th>id</th> <td><%=rs.getInt("id") %></td>
		</tr>
		<tr>
		<th>price</th> <td><%=rs.getInt("price") %></td>
		</tr>
		<tr>
		<td colspan="2">
		<center><img alt="not found" src=<%=ssm %>></center>
		</td>
		</tr>
		<tr>
		<td colspan="2">
		<center>
		
		<input type="button" value="Buy Now" name=<%=rs.getInt("id") %> onClick="clic(this.name)" />
	
		</center>
		</tr>
		</table>
		</div>
		</br></br>
		
	<% }else{
	String ssm=imgs+rs.getInt("id");
	//String buy1=buy+rs.getInt("id");
	j++;%>
		<div class="left" >
		<table border="0">
		<tr>
		<th>Name</th> <td><%=rs.getString("name") %></td>
		</tr>
		<tr>
		<th>id</th> <td><%=rs.getInt("id") %></td>
		</tr>
		<tr>
		<th>price</th> <td><%=rs.getInt("price") %></td>
		</tr>
		<tr>
		<td colspan="2">
		<center><img alt="not found" src=<%=ssm %>></center>
		</td>
		</tr>
		<tr>
		<td colspan="2">
		<center>
		
		<input type="button" value="Buy Now" name=<%=rs.getInt("id") %> onClick="clic(this.name)" />
		
		</center>
		</tr>
		</table>
		</div>
		
		
	<% }}%>

<%

	rs.close();
	st.close();
	con.close();

%>
</div>
</center>
</body>
</html>
