<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login your credentials</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>






<script>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

String userId = (String)session.getAttribute("username");
if(userId != null) {
   response.sendRedirect("main.jsp");  
}





%> 
</script>
<script type="text/javascript">
<%String name = (String) request.getAttribute("Message");%>
var alertMsg = "<%=name%>";
    if (alertMsg != "null" && alertMsg != '') {
        alert(alertMsg);
    }
</script>


</head>
<body>
<form style="margin-left:400px;" action="MainServlet" method="post">
<h3><p>Please provide a valid username and password</p></h3>
<b>Username:<input type="text" name=username required></b><br/><br/>
<b>Password:<input type="password" name=password required></b><br/><br/>
<input type="submit" value="login"/>
</form>

    
 

</body>
</html>