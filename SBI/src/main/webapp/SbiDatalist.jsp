<%@ page import ="java.util.ArrayList"%>

<%@page import="SbiDTO.SbiDTO"%>

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
<h4>Registerd user detials</h4>
<form id="datalist" name="datalist">

<table>

<% ArrayList<SbiDTO> list= (ArrayList<SbiDTO>)session.getAttribute("Retrivelist");%>


<tr>
	<th>Name:</th>
	<th>D.O.B:</th>
	<th>E.mail:</th>
	<th>Password:</th>
	<th>Age:</th>
	<th>Qualification:</th>
	<th>Hobbies:</th>
	<th>Mobile:</th>
</tr>	

<% if(list!=null){
	for(int i=0;i<list.size();i++){
		SbiDTO dto=list.get(i);
		
	%>

<tr>
		<td><%=dto.getName()%></td>
		<td><%=dto.getDob() %></td>
		<td><%=dto.getEmail() %></td>
		<td><%=dto.getPassword() %></td>
		<td><%=dto.getAge() %></td>
		<td><%=dto.getQualification() %></td>
		<td><%=dto.getA()%></td>
		<td><%=dto.getMobile()%></td>
</tr>
<%}} %>
</table>
</form>
</body>
</html>