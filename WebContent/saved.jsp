<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script>
$(document).ready(function(){
	  
	  var link_index;
	  var namex,namess, valu;
	  var objc = {
	      formfield:{
	      title1:[],
	      formelements:[]
	      }
	        
	      
	    };
	  

	 
	       $.getJSON('JsonServlet', function(jd){

	            document.write('<title>LIST OF FORMS</title>'); 
	            document.write('<h2><u>LIST OF  FORMS</h2></u>');
	   
	            document.write('<h3><ol style="line-height:30px; cursor:pointer;">');
	           
	          
	    
	            $.each(jd, function(i, val) { 
	              
	                  namex = val.formname;
	                
	              
	 document.write('<li class="link">'+namex+'</li>');

	 console.log("jd:", jd);
	 console.log("val", val);
	 console.log("i", i);

	            
	               
	});
	        
	      
	       
	            
	            document.write('</h3></style></ol></table>');
	   
	            var y1 = document.getElementsByClassName("link");

	            $(y1).click(function(){
	            	  

	            link_index=$(this).index();
	            console.log(link_index);

	            valu = link_index + 1;
	            namess = $(this).text();
	            window.localStorage.setItem("index", link_index);
	            window.localStorage.setItem("ids", valu);
	            window.localStorage.setItem("namu", namess);
	            window.location.href="theform.jsp";

	            });

	       });
	});


</script>
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


<body>

</body>
</html>
	   
	    
