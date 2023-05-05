<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>SBI</title>
</head>

<script type="text/javascript">
 <% String error=request.getParameter("error");
 if(error!=null)
  {%>
	  alert("<%=error%>");
  <% }%>

</script>

<body>
<h2>State Bank of India</h2>
<h5>Login to check your data.</h5>
<h5>If your are new  please Register. </h5>
<form action="" id="sbilogin" name="sbilogin">
<table>

	<tr>
		<th>Login</th>
	</tr>
	<tr>
		<th>UserName(email):</th>
		<td><input type="email" id="email" name="email" value="" placeholder="xyz@gmail.com" required  ></td>
	</tr>
	
	<tr>
		<th>Password:</th>
		<td><input type="password" id="password" name="password" value=""  required  ></td>
	</tr>
	
	<tr>
		<td><input type="button" id="proceed" name="proceed" value="proceed" onclick="proceedfn()"></td>
		<td><input type="reset" id="clear" name="clear" value="clear"  ></td>
		<td><input type="button" id="register" name="register" value="register" onclick="registerfn()"></td>
	</tr>


</table>
</form>
</body>
<script type="text/javascript">
	
	function proceedfn() {
		 var email=document.getElementById('email').value;
	     var password=document.getElementById('password').value;
	     var emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	     
	     
	     if(email===""){
	    	 alert( "Please provide your email!" );
	     }else if(!emailReg.test(email)){
			 alert("Please provide valid email!")
			 return false;
		 }
	     

	     if( password === "" ) {
	         alert( "Please provide your password!" );
	         return false;}
	     /*  }else if(password.length >= 6){
	    	  alert( "Please provide valid password!" );
	      } */
	      else{
	     
		 	document.getElementById("sbilogin").action="LoginServlet";
			document.getElementById("sbilogin").method="post";
			document.getElementById("sbilogin").submit();
			

	        }
	}
		 
	
	function registerfn() {
		document.getElementById("sbilogin").action="SbiRegister.jsp";
		document.getElementById("sbilogin").method="post";
		document.getElementById("sbilogin").submit();
		
	}
</script>
</html>