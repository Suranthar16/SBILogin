<%@page import="java.io.Console"%>
<%@ page import ="java.util.ArrayList"%>
<%@page import="org.apache.logging.log4j.core.Logger"%>
<%@page import="SbiDTO.SbiDTO"%>
<%@ page import ="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SBI</title>
</head>
<body>
<h2>State Bank of India</h2>
<h4>Check your Information and Press Conform to Register.</h4>
<form id="conform" name="conform" >
<table>
<% SbiDTO dto=new SbiDTO();

 dto=(SbiDTO)session.getAttribute("dto");
%>
    

<tr>
	<th>Name:</th>
	<td><%=dto.getName()%></td>
</tr>	
<tr>
	<th>D.O.B:</th>
	<td><%=dto.getDob() %></td>
</tr>	
<tr>
	<th>E.mail:</th>
	<td><%=dto.getEmail() %></td>
</tr>	
<tr>
	<th>Password:</th>
	<td><%=dto.getPassword() %></td>
</tr>	
<tr>
	<th>Age:</th>
	<td><%=dto.getAge() %></td>
</tr>	
<tr>
	<th>Qualification:</th>
	<td><%=dto.getQualification() %></td>
</tr>	
<tr>
	<th>Hobbies:</th>
	<td><%=dto.getA()%></td>
</tr>	
<tr>
	<th>Mobile:</th>
	<td><%=dto.getMobile()%></td>
</tr>	
<tr>
	<td><input type="button" id="conform" name="conform" value="Conform" onclick="conformfn();" ></td>
	<td><input type="button" id="back" name="back" value="Back"  onclick="backfn();" ></td>
</tr>
	
  



</table>
</form>
</body>
<script type="text/javascript">
function conformfn(){
	document.getElementById("conform").action="SbiConformServlet"  /* ?emailVal="+email; */
	document.getElementById("conform").method="post"
	document.getElementById("conform").submit() 
}

function backfn(){
	document.getElementById("conform").action="SbiRegister.jsp"  
	document.getElementById("conform").method="post"
	document.getElementById("conform").submit() 
}
</script>
</html>