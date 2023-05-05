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
<form id="proceed" name="proceed">
<table>

<% ArrayList<SbiDTO> list= (ArrayList<SbiDTO>)session.getAttribute("Retrivelist");%>
<% String emailvalsura = (String)request.getSession().getAttribute("emailval"); %>
<%
String emailVal=(String)request.getParameter("email"); 
 
if(emailVal!=null){


}
SbiDTO dto1=new SbiDTO();
if(list!=null){

	for(int i=0;i<list.size();i++){
	 SbiDTO dto= list.get(i);
	 String dd=dto.getEmail();
     if(emailvalsura!=null&&dto.getEmail() !=null&&dto.getEmail().equals(emailvalsura)) { 
			
              dto1=dto;
          }
}
	}
                        

     %>
     
     
 <%
  String sport="";
  String music="";
  String other="";
 
 
 String str = dto1.getA() ;
String[] hob = str.split(",");

if(str!=null&&str.trim().contains("sport")){
	 sport="Checked";
}if(str!=null&&str.trim().contains("music")){
	 music="Checked";
}if(str!=null&&str.trim().contains("other")){
	 other="Checked";
}
/* for(String myStr: hob) {
   System.out.println(myStr);
   
   
	 if(myStr!=null&&myStr.trim().toLowerCase().equals("Sport")){
		 Sport="Checked";
	 }else  if(myStr!=null&&myStr.trim().toLowerCase().equals("music")){
		 Music="Checked";
	 }else if(myStr!=null&&myStr.trim().toLowerCase().equals("other")){
		 Other="Checked";
	 }
	 } */
	 
   
%>


	<tr>
		<th>Login Detials</th>
	</tr>
	<tr>
		<th>UserName:</th>
		<td><input type="text" id="name" name="name" value="<%=dto1.getName() %>" placeholder="FullName" required disabled="disabled" ></td>
	</tr>
	
	<tr>
		<th>DOB:</th>
		<td><input type="date" id="dob" name="dob" value="<%=dto1.getDob() %>"  required disabled="disabled" ></td>
	</tr>
	
	<tr>
		<th>E-mail:</th>
		<td><input type="email" id="email" name="email" value="<%=dto1.getEmail() %>" placeholder="xyz@gmail.com" required disabled="disabled" ></td>
	</tr>
	
	<tr>
		<th>Password:</th>
		<td><input type="password" id="password" name="password" value="<%=dto1.getPassword() %>" placeholder="8-character" required disabled="disabled" ></td>
	</tr>
	
	<tr>
		<th>Age:</th>
		<td><input type="number" id="age" name="age" value="<%=dto1.getAge() %>" placeholder="00" required disabled="disabled" ></td>
	</tr>
	
	<tr>
		<th>Qualification:</th>
		<td><select  id="qualification" name="qualification" value="<%=dto1.qualification %>"  required disabled="disabled" >
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
		<td><input type="checkbox" id="shobbies" name="hobbies" value="sports" <%=sport %> disabled="disabled" >Sports
			<input type="checkbox" id="mhobbies" name="hobbies" value="music" <%=music %> disabled="disabled">Music
			<input type="checkbox" id="ohobbies" name="hobbies" value="other" <%=other %> disabled="disabled">Other
		</td>
	</tr>
	
	<tr>
		<th>Mobile:</th>
		<td><input type="tel" id="mobile" name="mobile" value="<%=dto1.getMobile() %>" placeholder="xxx xxx xxxx" required disabled="disabled" ></td>
	</tr>	
	
	<tr>
		<th></th>
		<td><input type="button" id="edit" name="edit" value="Edit" onclick="editfun();"></td>
		<td><input type="button" id="cancel" name="cancel" value="Cancel" onclick="cancelfn();"></td>
		<td><input type="button" id="save" name="save" value="Submit" onclick="savefun('<%=dto1.getEmail()%>')"></td>
		<td><input type="button" id="list" name="list" value="List" onclick="listfun();" ></td>
	</tr>
	



</table>
</form>
</body>

<script type="text/javascript"> document.getElementById("qualification").value="<%=dto1.getQualification() %>";</script>

<script type="text/javascript">
function editfun(){
	document.getElementById("name").disabled = false;
	document.getElementById("dob").disabled = false;
	document.getElementById("password").disabled = false;
	document.getElementById("age").disabled = false;
	document.getElementById("qualification").disabled = false;
	document.getElementById("shobbies").disabled = false;
	document.getElementById("mhobbies").disabled = false;
	document.getElementById("ohobbies").disabled = false;
	document.getElementById("mobile").disabled = false;
	
}
</script>

<script type="text/javascript">
function cancelfn(){
	document.getElementById("proceed").action="SbiLogin.jsp";
	document.getElementById("proceed").method="post";
	document.getElementById("proceed").submit() ;
}
</script>

<script type="text/javascript">
function savefun(){
	
	console.log("in to js");
	
	 var name=document.getElementById('name').value;
     var dob=document.getElementById('dob').value;
     var email=document.getElementById('email').value;
     var password=document.getElementById('password').value;
   /*   var cpassword=document.getElementById('cpassword').value; */
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
     
     if(name===""){
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
		document.getElementById("proceed").action="SbiEditServlet?emailVal="+email;
		document.getElementById("proceed").method="post";
		document.getElementById("proceed").submit(); 
		}
}
</script>
<script type="text/javascript">
	function listfun() {
		  var email=document.getElementById('email').value;
		if(email==="ambi@gmail.com"){
		document.getElementById("proceed").action="SbiDatalist.jsp";
		document.getElementById("proceed").method="post";
		document.getElementById("proceed").submit() ;
		}
		else{
			alert("Only of developers!")
		}
	}
</script>
</html>