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
	 
	        //console.log("inside first get");
	   //     console.log(jd);
	    
	          
	            document.write('<title>LIST OF FORMS</title>'); 
	            document.write('<h2><u>LIST OF  FORMS</h2></u>');
	        //   document.write('<table border="1" width="100%">'); 
	        //    document.write('<tr>'); 
	        //   document.write('<th>CLICK TO VIEW FORM</th>'); 
	         //   document.write('<th>CLICK TO VIEW RESPONSE</th>'); 
	         //   document.write('</tr>'); 
	           
	         //   document.write('');
	          document.write('<table border="1" width="100%">');
	          document.write('<tr><th>VIEW FORM</th>');
	           document.write('<th>VIEW RESPONSE</th></tr>');
	            document.write('<h3><tr><ol style="line-height:30px; cursor:pointer;">');
	           
	          
	    
	            $.each(jd, function(i, val) { 
	              
	                  namex = val.formname;
	                
	              
	 document.write('<li class="link">'+namex+'</li>');
//	 document.write('<li class="link1">VIEW RESPONSE for id'+i+'</li>');
	
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
	            window.localStorage.setItem("index", link_index);
	            window.location.href="theform.html";

	            });

	       });
	});
