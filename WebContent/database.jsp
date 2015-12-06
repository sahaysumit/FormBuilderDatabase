<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
s
</script>

<title>LIST OF SAVED FORMS</title>

<style>
.decoration{
text-decoration:none;
}
</style>
</head>
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
<script>


</script>


<body>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/form_builder"
     user="root"  password=""/>




<sql:query dataSource="${snapshot}" var="result">
SELECT * from feedbacktable;
</sql:query>
 
<table border="1" width="100%">
<tr>
<th>Sr/No </th>
<th>Fb/No</th>
<th>Form ID </th>
<th>Version</th>
<th>Form Name</th>
<th>Elements</th>
<th>Label</th>
<th>Value</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.serial_no}"/></td>
<td><c:out value="${row.feedback_no}"/></td>
<td><c:out value="${row.form_id}"/></td>
<td><c:out value="${row.form_version}"/></td>
<td><c:out value="${row.form_name}"/></td>
<td><c:out value="${row.element_type}"/></td>
<td><c:out value="${row.label}"/></td>
<td><c:out value="${row.value}"/></td>
</tr>
</c:forEach>
</table>

</body>
</html>