<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US"><head>
<title>Select your option</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
 



		
		<script>
		<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

String userId = (String)session.getAttribute("username");
if(userId == null) {
   response.sendRedirect("open.jsp");  
}
	%>	
		</script>
<style>

body{
	margin: 0;
	padding: 0;
	font-family: 'open_sansregular', sans-serif;
}

.clearfix {
       *zoom:1;
}
.clearfix:before,.cf:after {

       display:table;
       content:"";
       line-height:0;
}

   #div1{
   	width: 30%;
text-align: center;
margin-top: 2%;
margin-left: 15%;
height: 50%;
float:left;
height:300px;
font-size: 40px;
color: green;
cursor: pointer;


   }

    #div2{
   	width: 30%;
text-align: center;
margin-top: 2%;
float:left;
margin-left:70px;
height:300px;
font-size: 40px;
color:red;
cursor: pointer;
   }

   
   
   
</style>
	</head>
<body>
<div >
<input id="div1" type="button" class="btn btn-primary" value="Create new form" onclick="window.location.href='form.jsp'" />
<input id="div2" type="button" class="btn btn-primary" value="Load saved forms" onclick="window.location.href='saved.jsp'"  />
</div>

			


</body>
</html>