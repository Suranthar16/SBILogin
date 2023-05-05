<%@page import="SbiDTO.SbiDTO"%>
<%@ page import ="java.util.*"%>
<%@page import="java.io.Console"%>
<%@ page import ="java.util.ArrayList"%>
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
<form  id="sbiregister" name="sbiregister" >
<table>


<% SbiDTO dto=new SbiDTO();

 dto=(SbiDTO)session.getAttribute("dto");
 if(dto==null)dto=new SbiDTO();
%>


<%
String sports="";
String music="";
String other="";


String str = dto.getA() ;
String[] hob = str.split(",");

if(str!=null&&str.trim().contains("sports")){
	 sports="Checked";
} if(str!=null&&str.trim().contains("music")){
	 music="Checked";
} if(str!=null&&str.trim().contains("other")){
	 other="Checked";
}


%>
    


	<tr>
		<th>Register Form</th>
	</tr>
	<tr>
		<th>UserName:</th>
		<td><input type="text" id="name" name="name" value="<%=dto.getName()%>" placeholder="FullName" required  ></td>
	</tr>
	
	<tr>
		<th>DOB:</th>
		<td><input type="date" id="dob" name="dob" value="<%=dto.getDob() %>"  required  ></td>
	</tr>
	
	<tr>
		<th>E-mail:</th>
		<td><input type="email" id="email" name="email" value="<%=dto.getEmail() %>" placeholder="xyz@gmail.com" required  ></td>
	</tr>
	
	<tr>
		<th>Password:</th>
		<td><input type="password" id="password" name="password" value="<%=dto.getPassword() %>" placeholder="8-character" required  ></td>
	</tr>
	
	<tr>
		<th>Conform Password:</th>
		<td><input type="password" id="cpassword" name="cpassword" value="" placeholder="8-character" required  ></td>
	</tr>
	
	<tr>
		<th>Age:</th>
		<td><input type="number" id="age" name="age" value="<%=dto.getAge() %>" placeholder="00" required  ></td>
	</tr>
	
	<tr>
		<th>Qualification:</th>
		<td><select  id="qualification" name="qualification" value="<%=dto.getQualification() %>"  required  >
			<option value="">--select--</option>
			<option value="BE">BE</option>
			<option value="ME">ME</option>
			<option value="BSc">BSc</option>
			<option value="MSc">MSc</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>Hobbies:</th>
		<td><input type="checkbox" id="shobbies" name="hobbies" value="sports" <%=sports %>>Sports
			<input type="checkbox" id="mhobbies" name="hobbies" value="music" <%=music %>>Music
			<input type="checkbox" id="ohobbies" name="hobbies" value="other" <%=other %>>Other
		</td>
	</tr>
	
	<tr>
		<th>Mobile:</th>
		<td><input type="tel" id="mobile" name="mobile" value="<%=dto.getMobile() %>" placeholder="xxx xxx xxxx" required  ></td>
	</tr>	
	
	<tr>
		<th></th>
		<td><input type="reset" id="clear" name="clear" value="clear"  ></td>
		<td><input type="button" id="formsubmit" name="formsubmit" value="Submit" onclick="formsubmitfn();"></td>
		<td><input type="button" id="return" name="return" value="Back" onclick="returnfn();"></td>
	</tr>


</table>
</form>
</body>
<script type="text/javascript"> document.getElementById("qualification").value="<%=dto.getQualification() %>";</script>

<script type="text/javascript">

function returnfn() {
	document.getElementById("sbiregister").action="SbiLogin.jsp"
	document.getElementById("sbiregister").method="post"
	document.getElementById("sbiregister").submit() 
	
}


function formsubmitfn(){
	console.log("in to js");
	 var name=document.getElementById('name').value;
     var dob=document.getElementById('dob').value;
     var email=document.getElementById('email').value;
     var password=document.getElementById('password').value;
     var cpassword=document.getElementById('cpassword').value;
     var age=document.getElementById('age').value;
     var qualification=document.getElementById('qualification');
     var hobbies=document.getElementsByName('hobbies');
     for(var i=0; hobbies[i]; ++i){
         if(hobbies[i].checked){
              checkedValue = hobbies[i].value;
         }
   }
     var mobile=document.getElementById('mobile').value;
     var emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
     var lettersReg = /^[A-Za-z]+$/;
     var phonenoReg = /^\d{10}$/;
     
     if( name==="") {
         alert( "Please provide your name!" );
         return false;
      }else if(!lettersReg.test(name)){
			 alert( "Only Alphabets allowed inside Name!" );
         return false;
		 }
     
     if(dob===""){
    	 alert( "Please provide your DOB!" );
     }
     
     if(email===""){
    	 alert( "Please provide your email!" );
     }else if(!emailReg.test(email)){
		 alert("Please provide valid email!")
		 return false;
	 }
     

     if( password === "" ) {
         alert( "Please provide your password!" );
         return false;
      }else if(password.length >6){
    	  alert( "Please provide valid password!" );
      }
     
     if( cpassword === "" ) {
         alert( "Please provide your conform password!" );
         return false;
      }
     
     if( password != cpassword ) {
         alert( "Please provide valid password!" );
         return false;
      }
    	 
     
     if( age === "" ) {
         alert( "Please provide your age!" );
         return false;
      }else if(age<1||age>100){
			 alert("Please provide valid Age!");
		 }
     
     if( qualification === "" ) {
         alert( "Please provide your qualification!" );
         return false;
      }
     

     if( mobile === "" ) {
        alert( "Please provide your mobile num!" );
        return false;
     }else if(!phonenoReg.test(mobile)){
		 alert("Please provide valid Number!");
	 }
     
     else{
		document.getElementById("sbiregister").action="SbiregisterServlet";
		document.getElementById("sbiregister").method="GET";
		document.getElementById("sbiregister").submit();
		}
}

</script>
</html>