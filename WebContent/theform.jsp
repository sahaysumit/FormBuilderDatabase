<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script>
$(document).ready(function(){

	var namex,namess, valu;
	var objc = {
			formfield:{
			title1:[],
			formelements:[]
			}
		
		};

       $.getJSON('JsonServlet', function(jd){
 
       	console.log("inside first get");
       	console.log(jd);

            $.each(jd, function(i, val) { 

 console.log("jd:", jd);
 console.log("val", val);
 console.log("i", i);

});

	console.log("outside first get");

setTimeout(function(){

dothis();

	  function dothis(){
	   
	    
	    var xmlhttp = new XMLHttpRequest(),
	    json;
	    xmlhttp.onreadystatechange = function(){
	      if (xmlhttp.readyState===4 && xmlhttp.status===200)
	      {
	       json =xmlhttp.responseText?JSON.parse(xmlhttp.responseText):[];
	 
	        list();
	      }
	    };
	    xmlhttp.open("GET", "JsonServlet", true);
	    console.log("inside second get");
	    xmlhttp.send();
	function list(){


	var link_index =window.localStorage.getItem("index");
	var valu =window.localStorage.getItem("ids");
	var namess =window.localStorage.getItem("namu");



	var jsonx=json[link_index].formelements.formfield.title1;
	console.log("title:",jsonx);
	var jsonimg = json[link_index].formelements.logo;
	console.log("jsonimg:",jsonimg);

	for(var j=0; j<jsonx.length; j++){
	  
	  var mytitle = jsonx[j].title2;
	  
	document.write('<head>');
	document.write('<meta charset="UTF-8"><title></title>');
	document.write('<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">');
	document.write('<link rel="stylesheet" href="css/jquery-ui.css">');
	document.write('<style>/* Styles that are also copied for Preview */');
	document.write('body {margin: 10px 0 0 10px;}');
	document.write('.control-label {display: inline-block !important; padding-top: 5px; text-align: right; vertical-align: baseline;padding-right: 10px;}');
	document.write( '.droppedField {padding-left:5px;} .droppedField > input,select, button, .checkboxgroup, .selectmultiple, .radiogroup { margin-top: 10px;margin-right: 10px; margin-bottom: 10px;}');
	document.write( '.action-bar .droppedField {float: left; padding-left:5px; }') ; 
	document.write( '</style></head><body>');
	if(jsonimg.length!==0 || jsonimg===null || jsonimg!=="null" || jsonimg!=="[null]" || jsonimg!==[null]){
	document.write('<div style="height:40px; width:100%; border-bottom:1px solid #e5e5e5;"><div style="float:right; margin-top:2px; max-width:150px; max-height:33px;"><img style="max-width:150px; max-height:33px;" src="'+jsonimg+'"></div>'); 
	document.write('<div style="float:left;"><legend>'+mytitle+'</legend></div></div>');
	}
	else{
	  document.write('<legend style="width:100%">'+mytitle+'</legend>');
	}
	  
	 document.write('<!--[if lt IE 9]><div class="row-fluid" id="form-title-div"> <label>Type form title here...</label> </div><![endif]-->');
	 document.write('<div class="row-fluid" style="z-index: 21;">')  ;
	 document.write('<div id="selected-column-1" class="span5 droppedFields" style="z-index: 22; width:100%">');

	}

	console.log("middle of second");

	console.log("index:", link_index);
	console.log("formid:", valu);
	console.log("formname:", namess);


	var json1= json[link_index].formelements.formfield.formelements;
	 console.log("json1", json1);
	  for(var i=0;i < json1.length; i++){
	  console.log("json1-type", json1[i].type); 
	   if(json1[i].type==="text")
	        {
	     console.log("text-one");
	          document.write('<div class="droppedField" name="text" style="z-index: 23;" id="CTRL-DIV-100'+i+'">');
	          document.write('<label class="control-label">'+json1[i].labell+'</label>');
	          document.write('<input type="text" placeholder="Text here..." class="ctrl-textbox">');
	          document.write('</div>');
	        }

	        if(json1[i].type==="password")
	        {
	          document.write('<div class="droppedField" name="password" style="z-index: 24;" id="CTRL-DIV-100'+i+'">');
	          document.write('<label class="control-label">'+json1[i].labell+'</label>');
	          document.write('<input type="password" placeholder="Text here..." class="ctrl-passwordbox">');
	          document.write('</div>');
	        }
	        
	        if(json1[i].type==="email")
	        {
	          document.write('<div class="droppedField" name="email" style="z-index: 30;" id="CTRL-DIV-100'+i+'">');
	          document.write('<label class="control-label">'+json1[i].labell+'</label>');
	          document.write('<input type="email" placeholder="abc@xyz.com" class="ctrl-emailbox">');
	 
	          document.write( '</div>');
	        }
	        
	 if(json1[i].type==="selectlist")
	        {
	     
	          document.write('<div class="droppedField" name="selectlist" style="z-index: 25;" id="CTRL-DIV-100'+i+'">');
	          document.write('<label class="control-label">'+json1[i].labell+'</label>');
	          document.write('<select id="sel" class="ctrl-combobox">');
	          for(var j=0;j<json1[i].choice.length;j++){
	             document.write('<option>'+json1[i].choice[j]+'</option>');
	          }
	          // document.write('<option>'+json1[i].choice+'</option>'
	         
	          document.write('</select>');
	          document.write('</div>');
	        }
	if(json1[i].type==="radio")
	        {
	  
	          document.write('<div class="radiogroup droppedField" name="radio" style="z-index: 24;" id="CTRL-DIV-100'+i+'">');
	          document.write('<label class="control-label" style="vertical-align:top">'+json1[i].labell+'</label>');
	          document.write('<div style="display: inline-block; z-index: 25;" class="ctrl-radiogroup">');
	          
	          for(var j1=0;j1<json1[i].choice.length;j1++){
	      
	          document.write('<label class="radio"><input type="radio" name="radioField'+i+'" value="option'+j1+'">'+json1[i].choice[j1]+'</label>');
	        
	          }
	         
	          // document.write('<option>'+json1[i].choice+'</option>'
	         
	          document.write('</div>');
	          document.write('</div>');
	         
	        }

	if(json1[i].type==="checkbox")
	        {
	          document.write('<div class="checkboxgroup droppedField" name="checkbox" style="z-index: 30;" id="CTRL-DIV-100'+i+'">');
	          document.write('<label class="control-label" style="vertical-align:top">'+json1[i].labell+'</label>');
	          document.write('<div style="display: inline-block; z-index: 25;" class="ctrl-checkboxgroup">');
	          for(var j2=0;j2<json1[i].choice.length;j2++){
	             document.write('<label class="checkbox"><input type="checkbox" name="checkboxField'+i+'" value="option"'+j2+'>'+json1[i].choice[j2]+'</label>');
	          }
	      
	          document.write('</div>');
	          document.write('</div>');
	        }

	}


	         document.write('</div></div>');
	 
	      
	         document.write( '<input type="button" value="Edit" id="edit" style="height:40px; width:60px; background:blue; color:white; font-size:20px;">');
	   
	         document.write( '<input type="button" value="Save" id="saveme"  style="height:40px; width:60px; margin-left:10px; background:blue; color:white; font-size:20px;" >');      
	         document.write('</body>');
	         
	         console.log("outside second get");
	 
	  var y2 = document.getElementById("saveme");

	$(y2).click(function(){

	    

	  var get = document.getElementById("selected-column-1");
	  console.log("inside get");
	  console.log(get);
	  var get1=$(get);
	  var inc=0;
	  var inc1=0;
	  var inc2=0;
	  var inc3=0;
	  var inc4=0;
	  var inc5=0;
	  var tit={title2:""};
	  objc.formfield.title1.push(tit);
	  get1.children().each(function(ind,ob) {
	       var obje=$(ob);
	       console.log(ind);
	    console.log( obje.attr("name"));
	    var check = obje.attr("name");
	    if(check==="text"){
	      console.log("in");
	               var te={
	                num:ind,
	                type:"text",
	                labell:obje.find(".control-label").text(),
	                inputt:[obje.find(".ctrl-textbox").val()], 
	                choice:[]
	               };
	            console.log(objc.formfield.formelements);
	       objc.formfield.formelements.push(te);
	       console.log( objc.formfield.formelements[inc]);
	       inc+= 1;

	    }
	    if(check==="password"){
	      console.log("in");
	               var te1={
	                num:ind,
	                type:"password",
	                labell:obje.find(".control-label").text(),
	                inputt:[obje.find(".ctrl-passwordbox").val()]
	             
	             
	               };
	               console.log(objc.formfield.formelements);
	       objc.formfield.formelements.push(te1);
	       console.log( objc.formfield.formelements[inc1]);
	       inc1+= 1;
	}
	    
	    if(check==="email"){
	      console.log("in");
	      
	               var te5={
	                num:ind,
	                type:"email",
	                labell:obje.find(".control-label").text(),
	               
	                inputt:[obje.find(".ctrl-emailbox").val()]
	             
	             
	               };
	               console.log(objc.formfield.formelements);
	       objc.formfield.formelements.push(te5);
	       console.log( objc.formfield.formelements[inc5]);
	       inc5+= 1;
	    }

	if(check==="selectlist"){
	      console.log("in");
	               var te2={
	                num:ind,
	                type:"selectlist",
	                labell:obje.find(".control-label").text(),
	                optionns:[],
	                inputt:[]
	                
	               };
	               console.log(te2);
	                var opt=obje.find("#sel option");
	               $(opt).each(function() {
	               
	            te2.optionns.push($(this).text());
	      

	        });

	        console.log(te2.optionns);
	        elt=obje.find("#sel");
	        var elt2=elt[0].options[elt[0].selectedIndex].text;
	        te2.inputt.push(elt2);

	                console.log(te2.inputt);
	               console.log(objc.formfield.formelements);
	       objc.formfield.formelements.push(te2);
	       console.log( objc.formfield.formelements[inc2]);
	       inc2+= 1;
	}




	if(check==="radio"){
	      console.log("in"); 
	               var te3={
	                num:ind,
	                type:"radio",
	                labell:obje.find(".control-label").text(),
	                optionns:[],
	                inputt:[]
	                   
	               };
	               console.log(te3);
	                var opt=obje.find(".ctrl-radiogroup");
	               opt.children().each(function() {
	               
	            te3.optionns.push($(this).text());
	            
	        
	        });
	               
	          
	           
	               
	               
	         if($('input[type="radio"]:checked')){
	             
	          val = obje.find('input[type="radio"]:checked').val();
	         
	           
	         }
	         opt.children().each(function() {
	             val2=$(this).find('input[type="radio"]').val();
	             if (val2===val){
	               te3.inputt.push($(this).text());
	             }
	         });
	               
	    
	               console.log(objc.formfield.formelements);
	       objc.formfield.formelements.push(te3);
	       console.log( objc.formfield.formelements[inc3]);
	       inc3+= 1;
	}

	if(check==="checkbox"){
	  
	  
	      console.log("in");
	               var te4={
	                num:ind,
	                type: "checkbox",
	                labell:obje.find(".control-label").text(),
	                optionns:[],
	                inputt:[]
	                
	                
	                   
	               };
	               console.log(te4);
	                var opt=obje.find(".ctrl-checkboxgroup");
	               opt.children().each(function() {
	               
	            te4.optionns.push($(this).text());
	            

	        });
	               
	  
	         opt.children().each(function() {
	           val2=$(this).find('input[type="checkbox"]').val();
	           val4=$(this).find('input[type="checkbox"]:checked').val();
	         
	           if(val2===val4){
	             te4.inputt.push($(this).text());

	           }
	         });
	              

	               console.log(objc.formfield.formelements);
	       objc.formfield.formelements.push(te4);
	       console.log( objc.formfield.formelements[inc4]);
	       inc4+= 1;
	}

	console.log("middle");
	});
	  console.log("outside get");

	var recursiveEncoded = $.param( objc );
	var recursiveDecoded = decodeURIComponent( $.param( objc ) );

	$.ajax({
	type: 'POST',
	url: 'JsonServlet',
	dataType: 'Json',
	Json: 'Json',
	data: {send: JSON.stringify(objc), name:namess, formid:valu},
	error: function(data) {alert("There was a problem in saving the form"); },
	success:function(data) { alert("Form saved and successfully updated to database"); }

	});
	window.location.href="main.jsp";

	 
	});

	}  
	}


	}, 100);

	  
	
	
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
</html>