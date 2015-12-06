<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>Insert title here</title> 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
 

 
 
 
<script>


	  function submitform()
	  {
		  var objc ={"formfield":{"title1":[{"title2":""}],"formelements":[{"num":0,"type":"text","labell":"Text Input","inputt":["my name is anthone gonsalwis"],"choice":[]},{"num":1,"type":"password","labell":"Password","inputt":["main dunya mei akela hun"]},{"num":2,"type":"selectlist","labell":"Selectlist","optionns":["Option 1","Option 2","Option 3"],"inputt":["Option 2"],"choice":["Option 1","Option 2","Option 3"]}],"title":[]}};
		  alert(objc);
        $.ajax({
            type: 'POST',
            url: 'JsonServlet',
            cache:false,
            dataType: 'Json',
            data: {test: JSON.stringify(objc)},
            
            success: function(data) {
            	  alert('success');

            },
            error: function(data) {
                alert('fail');
            } 
        });
	  }
     
</script>

</head>  
<body>  

<button type="button" onclick="submitform()">SUBMIT</button>
</body>  
</html>  