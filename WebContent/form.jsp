<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html ><head>
<script>
<%
String userId = (String)session.getAttribute("username");
if(userId == null) {
   response.sendRedirect("open.jsp");  
}
%>

</script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="css/jquery-ui.css">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
	
<script type="text/javascript" src="C:/Users/admin1/Desktop/java/FormBuilderDatabase/WebContent/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>

	
	<title>
		FORM BUILDER
	</title>
	
	<style>
		
		.activeDroppable {
			background-color: #eeffee;
		}

		.hoverDroppable {
			background-color: lightgreen;
		}

		.draggableField {
			/* float: left; */
			padding-left:5px;
		}
		
		.draggableField > input,select, button, .checkboxgroup, .selectmultiple, .radiogroup {
			margin-top: 10px;
			
			margin-right: 10px;
			margin-bottom: 10px;
		}

		.draggableField:hover{
			background-color: #ccffcc;
		}
		
		.doit{
	
	</style>
	
	<style id="content-styles">
		/* Styles that are also copied for Preview */
		body {
			margin: 10px 0 0 10px;
		}
		
		.control-label {
			display: inline-block !important;
			padding-top: 5px;
			text-align: right;
			vertical-align: baseline;
			padding-right: 10px;
			
		}
		
		.droppedField {
			padding-left:5px;
		}

		.droppedField > input,select, button, .checkboxgroup, .selectmultiple, .radiogroup {
			margin-top: 10px;
			
			margin-right: 10px;
			margin-bottom: 10px;
		}

		.action-bar .droppedField {
			float: left;
			padding-left:5px;
		}

	</style>
<script type="text/javascript" async="" src="js/ga.js"></script>

<script>
function validateForm() {
    var x = document.forms["myForm"]["email"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
}
</script>

<script>

var objc = {
		formfield:{
		title1:[],
		formelements:[]
		}
			
		
	}

	/* Make the control draggable */
	function makeDraggable() {
		$(".selectorField").draggable({ 
			helper: "clone",
			stack: "div",
			cursor: "move", 
			cancel: null  });
	}

	var _ctrl_index = 1001;
	function docReady() {
		console.log("document ready");
		compileTemplates();
		
		makeDraggable();
		
		
		$( ".droppedFields" ).droppable({
			  activeClass: "activeDroppable",
			  hoverClass: "hoverDroppable",
			  accept: ":not(.ui-sortable-helper)",
			  drop: function( event, ui ) {
				//console.log(event, ui);
				var draggable = ui.draggable;				
				draggable = draggable.clone();
				draggable.removeClass("selectorField");
				draggable.addClass("droppedField");
				draggable[0].id= "CTRL-DIV-"+(_ctrl_index++); // Attach an ID to the rendered control
				draggable.appendTo(this);				
				

				/* Once dropped, attach the customization handler to the control */
				draggable.click(function () {
										// The following assumes that dropped fields will have a ctrl-defined. 
										//   If not required, code needs to handle exceptions here. 
										var me = $(this)
										var ctrl = me.find("[class*=ctrl]")[0];
										var ctrl_type = $.trim(ctrl.className.match("ctrl-.*")[0].split(" ")[0].split("-")[1]);
										customize_ctrl(ctrl_type, this.id);
										//window["customize_"+ctrl_type](this.id);
								});

				makeDraggable();
			}
		});		

		/* Make the droppedFields sortable and connected with other droppedFields containers*/
		$( ".droppedFields" ).sortable({
										cancel: null, // Cancel the default events on the controls
										connectWith: ".droppedFields"
									}).disableSelection();
	}
	

	/*
		Preview the customized form 
			-- Opens a new window and renders html content there.
	*/
	function preview() {
		console.log('Preview clicked');
		 objc.formfield.title = []
	     objc.formfield.formelements = []
		 objc.logo = []
		

		 
	
		
		// Sample preview - opens in a new window by copying content -- use something better in production code

		var selected_logo = $("#imagename").clone()
		var selected_content = $("#selected-content").clone();
		selected_content.find("div").each(function(i,o) {
			                    console.log("value"+i);
								var obj = $(o)
								obj.removeClass("draggableField ui-draggable well ui-droppable ui-sortable");
								obj.removeClass("xyz");
							});
		var legend_text = $("#form-title")[0].value;
		
		if(legend_text=="") {
			legend_text="Form builder demo";
		}
		selected_content.find("#form-title-div").remove();
		
		var selected_content_html = selected_content.html();
		var selected_logo_html = selected_logo.html();
		
		var dialogContent  ='<!DOCTYPE HTML>\n<html lang="en-US">\n<head>\n<meta charset="UTF-8">\n<title></title>\n';
		dialogContent+= '<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">\n';
		dialogContent+='<style>\n'+$("#content-styles").html()+'\n</style>\n';
		dialogContent+= '</head>\n<body>';
 		dialogContent+ selected_logo_html;
		dialogContent+= '<legend>'+legend_text+'</legend>';
		dialogContent+= selected_content_html;
		dialogContent+= '<input type="button" class="btn btn-primary" id="edit" value="Edit" onclick="window.close()"   />';
		dialogContent+='       ';
		dialogContent+= '<input type="button" class="btn btn-primary" id="save" value="Save" />';
	
		dialogContent+= '\n</body></html>';

		

		dialogContent = dialogContent.replace('\n</body></html>','');
		dialogContent+= '\n</body></html>';

	
		// var objc = {
		// 	formfield:{
		// 		textfield:[],
		// 		passwordfield:[],
		// 		selectlistfield:[],
		// 		radiofield:[],
		// 		checkboxfield:[]
		// 	}
		// }
		

		win = window.open("Preview Window");
		console.log("hello1");
		win.document.write(dialogContent);
		console.log("hello2");
		var y = win.document.getElementById("save");
	
		// console.log(y);
		// console.log($(y));
	
		
		console.log("hello25");
		$(y).click(function(){
			var findingimg =$('#output').find('img').attr('src');
			console.log(findingimg);
			
			objc.logo.push(findingimg);
			
			console.log("hello3");
			var get = win.document.getElementById("selected-column-1");
			console.log(get);
			var get1=$(get)
			var inc=0;
			var inc1=0;
			var inc2=0;
			var inc3=0;
			var inc4=0;
			var inc5=0;
			var inc6=0;
			var tit={title2:""}
			objc.formfield.title1.push(tit);
			get1.children().each(function(ind,ob) {
                var obje=$(ob);
                console.log(ind);
				console.log( obje.attr("name"));
				var check = obje.attr("name");
				if(check==="image"){
				
				 	inputt:[obje.find(".image-url").val()]					
					objc.formfield.logo.push(inputt);
					inc6+=1;				
				}					
				
				if(check==="text"){
					console.log("in");
                        var te={
                        	num:ind,
                        	type:"text",
                        	labell:obje.find(".control-label").text(),
                        	inputt:[obje.find(".ctrl-textbox").val()], 
                        	choice:[]
                        }
                     console.log(objc.formfield.formelements);
					 objc.formfield.formelements.push(te);
					 console.log( objc.formfield.formelements[inc]);
					 inc+= 1;

					// objc.typefield.textfield[inc].num= ind;
					// objc.typefield.textfield[inc].labell =obje.find(".control-label").text() ;
					// objc.typefield.textfield[inc].inputt =obje.find(".ctrl-textbox").val() ;

					// console.log(objc.typefield.textfield[inc].num);

					// console.log(objc.typefield.textfield[inc].labell);
					// console.log(objc.typefield.textfield[inc].inputt);
     //                 inc+= 1;
					// console.log("in");
					// $("input").focus(function(){
					// 	console.log("inin");
					// 	var te=$("input").val();
					// 	console.log(te);
					// });
				
				// var te=$( obje.children(0)).text();
				// console.log(te);
				// console.log((obje.children(1)));
				// var te2=$( obje.children(0)).val();
				// console.log("te2"+te2);
				}
				if(check==="password"){
					console.log("in");
                        var te1={
                        	num:ind,
                        	type:"password",
                        	labell:obje.find(".control-label").text(),
                        	inputt:[obje.find(".ctrl-passwordbox").val()]
                      
                      
                        }
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
                      
                      
                        }
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
                            inputt:[],
                        	choice:[]
                        }
                        console.log(te2);
                        	var opt=obje.find("#sel option");
                        $(opt).each(function() {
                        
						    te2.optionns.push($(this).text());
						    te2.choice.push($(this).text());

						});
        //                var x=obje.find("#sel option");
        //                 for(i=0;i<x.length;i++) {
					   //  te2.optionns.push(x.options[i].text)
						  // }
						
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
                        	choice:[],
                            inputt:[]
                            
                        }
                        console.log(te3);
                        	var opt=obje.find(".ctrl-radiogroup");
                        opt.children().each(function() {
                        
						    te3.optionns.push($(this).text());
						    te3.choice.push($(this).text());

						});
                        
                        var val;
         				 if($('input[type="radio"]:checked')){
         					   
         					val = obje.find('input[type="radio"]:checked').val();
         				 
         				   
         				 }
         				 opt.children().each(function() {
                      val2=$(this).find('input[type="radio"]').val();
                      if (val2===val){
                   	   te3.inputt.push($(this).text());
                      }
         				 });
                        
          //              elt3=obje.find(".ctrl-radiogroup");
          //              var elt3 = $('input:radio[name=radioField]:checked').text()
         //               
         //               if(elt3!==null){
         //               	te3.inputt.push(elt3);
          //              } 
         //               else{
         //               	
         //               }
        //                var x=obje.find("#sel option");
        //                 for(i=0;i<x.length;i++) {
					   //  te2.optionns.push(x.options[i].text)
						  // }
						
					//	console.log(te3.optionns);
					//	 elt3=obje.find(".radio");
					//	 var elt4=elt3[0].options[elt3[0].selectedIndex].text;
					//	 te3.selectedoption.push(elt4);

                         // console.log(te2.selectedoption);
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
                        	inputt:[],
                        	choice:[]
                        	
                        	
                            
                        }
                        console.log(te4);
                        	var opt=obje.find(".ctrl-checkboxgroup");
                        opt.children().each(function() {
                        
						    te4.optionns.push($(this).text());
						    te4.choice.push($(this).text());
					

						});
                    
                      
        				
        				 opt.children().each(function() {
        					 val2=$(this).find('input[type="checkbox"]').val();
        					 val4=$(this).find('input[type="checkbox"]:checked').val();
        				 
        					 if(val2===val4){
        						 te4.inputt.push($(this).text());
    
                     }
        				 });
                        
                        
                        
                        
                        /*    
                        
                        function getSelectedChbox(frm) {
                        	slchbox : []
                        var inpfields = frm.getElementsByClass('checkbox');
                        var nr_inpfields = inpfields.length;
                       for(var i=0; i<nr_inpfields; i++) {
                        if(inpfields[i].type == 'checkbox' && inpfields[i].checked == true) selchbox.push(inpfields[i].value);
                        }
						alert("selchbox");
                        return selchbox;
                        	}
                        
                        var selchb = getSelectedChbox(this);     // gets the array returned by getSelectedChbox()
                        alert(selchb);
                        
                    */    
                        
                        
        //                var x=obje.find("#sel option");
        //                 for(i=0;i<x.length;i++) {
					   //  te2.optionns.push(x.options[i].text)
						  // }
						
					//	console.log(te4.optionns);
					//	 elt5=obje.find(".checkbox");
					//	 var elt6=elt5[0].options[elt5[0].selectedIndex].text;
					//	 te4.selectedoption.push(elt6);

             //             console.log(te2.selectedoption);
                        console.log(objc.formfield.formelements);
					 objc.formfield.formelements.push(te4);
					 console.log( objc.formfield.formelements[inc4]);
					 inc4+= 1;
}


});
// $.each( objc, function( key, value ) {
// 	$.each( value, function( key1, value1 ){
//   alert( key1 + ": " + value1 );
// });
// });

var recursiveEncoded = $.param( objc );
var recursiveDecoded = decodeURIComponent( $.param( objc ) );
 

			// $(get).serializeArray();
			// console.log($(get).serializeArray());
	
var jsoncheck = objc.formfield.formelements;

if(jsoncheck.length!==0){
var formname = prompt("Please enter the form name");
if ((formname!== "") && (formname!== null)){
$.ajax({
type: 'POST',
url: 'JsonServlet',
dataType: 'Json', 
Json: 'Json',
data: {items: JSON.stringify(objc), formname:formname},
error: function(data) {alert("There was a problem in saving the form"); },
success:function(data) { alert("Form saved and successfully updated to database"); }

});
		}
		else if(formname==null){
			return;
		}
		else if(formname==""){
			alert("please provide a name to the form");
			return;
			}
		else{}
		}

		else if(jsoncheck.length==0) { alert("please add some fields");
			}
		else{}
win.close();
window.location.href="main.jsp";
		});
	}
		
	
	function savee() {
		
		objc.formfield.title1 = []
	 objc.formfield.formelements = []
		objc.logo = []
		
		
	var findingimg =$('#output').find('img').attr('src');
		console.log(findingimg);
		
		objc.logo.push(findingimg);
		
         // objc.formfield = new objc.formfield("[{}]");
		var get4  = document.getElementById("form-title-div");
		var get5 = $(get4);
		var tit={
			title2:get5.find("#form-title").val()
		}
		// var tit=get5.find("#form-title").val()
		
		  objc.formfield.title1.push(tit);
		  console.log( objc.formfield.title1)
		var get2  = document.getElementById("selected-column-1");
		var get3=$(get2);
		

		
		
		
		
		/*		var getimg = document.getElementById("output");
		var getimg2 = $(getimg);
		getimg2.children().each(function(fb11, ob11){
			var obe11 = $(ob11);
			var check1=obe11.attr("name");
			console.log(check1);
			if(check1==="image"){
				
			 	inputt:[obe.find(".image-url").val()]					
				objc.formfield.logo.push(inputt);
				inc6+=1;				
			}				
		
		}); */
		
                get3.children().each(function(ind1,ob1) {
                var obje1=$(ob1);
                console.log(ind1);
				console.log( obje1.attr("name"));
				var check = obje1.attr("name");
				
				
				
				if(check==="text"){
					console.log("in");

                        var teone={
                        	num:ind1,
                        	type:"text",
					        labell:obje1.find(".control-label").text(),
					        choice:[]
                        }

                         // var opti1={
					                    //     	num:ind1,
					                    //     	labell:obje1.find(".control-label").text()
					                        	
					                    //     }
					   // teone.textfield.push(opti1);
      //                   console.log(objc.typefield.textfield);
					 objc.formfield.formelements.push(teone);
					 console.log( objc.formfield.formelements);
					 // inc+= 1;

					}

					if(check==="password"){
										console.log("in");

					                        var tetwo={
					                        	num:ind1,
					                        	type:"password",
					                        	labell:obje1.find(".control-label").text(),
					                        	choice:[]
					                        }

					                        //  var opti2={
					                        // 	num:ind1,
					                        // 	labell:obje1.find(".control-label").text()
					                        	
					                        // }
					                         // tetwo.passwordfield.push(opti2);
					      //                   console.log(objc.typefield.textfield);
										 objc.formfield.formelements.push(tetwo);
										 console.log( objc.formfield.formelements);
										 // inc+= 1;

										}
					
					if(check==="email"){
						console.log("in");

	                        var tefive={
	                        	num:ind1,
	                        	type:"email",
	                        	labell:obje1.find(".control-label").text(),
	                        	choice:[]
	                        }

	                        //  var opti2={
	                        // 	num:ind1,
	                        // 	labell:obje1.find(".control-label").text()
	                        	
	                        // }
	                         // tetwo.passwordfield.push(opti2);
	      //                   console.log(objc.typefield.textfield);
						 objc.formfield.formelements.push(tefive);
						 console.log( objc.formfield.formelements);
						 // inc+= 1;

						}

if(check==="selectlist"){
										console.log("in");

					                        var tethree={
					                            num:ind1,
					                            type:"selectlist",
					                        	labell:obje1.find(".control-label").text(),
					                        	choice:[]
					                        }
					                        // var opti={
					                        // 	num:ind1,
					                        // 	labell:obje1.find(".control-label").text(),
					                        // 	optionns:[]
					                        // }
					      //                   console.log(objc.typefield.textfield);
					       // console.log(te2);
					       var opt=obje1.find("#sel option");
                        
                        $(opt).each(function() {
                        
						    tethree.choice.push($(this).text());

						});
					       	// tethree.selectlistfield.push(opti);
                        	
										 objc.formfield.formelements.push(tethree);
										 console.log( objc.formfield.formelements);
										 // inc+= 1;

										}


if(check==="radio"){
										console.log("in");

					                        var tefour={
					                        	num:ind1,
					                        	type:"radio",
                        	                    labell:obje1.find(".control-label").text(),
                        	                    choice:[]
					                        }
					      //                   console.log(objc.typefield.textfield);
					      // var opti3={
					      // 	num:ind1,
           //              	labell:obje1.find(".control-label").text(),
           //              	optionns:[]
					      // }

					      var opt=obje1.find(".ctrl-radiogroup");
                        opt.children().each(function() {
                        
						   tefour.choice.push($(this).text());

						});
                            	// tefour.radiofield.push(opti3);

										 objc.formfield.formelements.push(tefour);
										 console.log( objc.formfield.formelements);
										 // inc+= 1;

										}


if(check==="checkbox"){
										console.log("in");

					                        var tefive={
					                        	num:ind1,
					                        	type:"checkbox",
                        	                    labell:obje1.find(".control-label").text(),
                        	                    choice:[]
					                        }

					                       // var opti4={
					                       // 	num:ind1,
                        	   //              labell:obje1.find(".control-label").text(),
                        	   //              optionns:[]
                            
					                       // }

					                       var opt=obje1.find(".ctrl-checkboxgroup");
                                           opt.children().each(function() {
                        
						                   tefive.choice.push($(this).text());

						});
                                           // tefive.checkboxfield.push(opti4);
					      //                   console.log(objc.typefield.textfield);
										 objc.formfield.formelements.push(tefive);
										 console.log( objc.formfield);
										 // inc+= 1;

										}
	});
             

var jsoncheck = objc.formfield.formelements;

if(jsoncheck.length!==0){
var formname = prompt("Please enter the form name");
if ((formname!== "") && (formname!== null)){
	
$.ajax({
type: 'POST',
url: 'JsonServlet',
dataType: 'Json',
Json: 'Json',
data: {items: JSON.stringify(objc), formname:formname},
error: function(data) {alert("There was a problem in saving the form"); },
success:function(data) { alert("Form saved and successfully updated to database"); 
window.location.href="main.jsp";
}


});
}
else if(formname==null){
	return;
} 
else if(formname==""){
	alert("please provide a name to the form");
	return;
	}
else{}
}

else if(jsoncheck.length==0) { alert("please add some fields");
	}
else{}

}
		
	if(typeof(console)=='undefined' || console==null) { console={}; console.log=function(){}}
	
	/* Delete the control from the form */
	function delete_ctrl() {
		if(window.confirm("Are you sure about this?")) {
			var ctrl_id = $("#theForm").find("[name=forCtrl]").val()
			console.log(ctrl_id);
			$("#"+ctrl_id).remove();
		}
	}
	
	/* Compile the templates for use */
	function compileTemplates() {
		window.templates = {};
		window.templates.common = Handlebars.compile($("#control-customize-template").html());
		
		/* HTML Templates required for specific implementations mentioned below */
		
		// Mostly we donot need so many templates
		
		window.templates.textbox = Handlebars.compile($("#textbox-template").html());
		window.templates.passwordbox = Handlebars.compile($("#textbox-template").html());
		window.templates.combobox = Handlebars.compile($("#combobox-template").html());
		window.templates.selectmultiplelist = Handlebars.compile($("#combobox-template").html());
		window.templates.radiogroup = Handlebars.compile($("#combobox-template").html());
		window.templates.checkboxgroup = Handlebars.compile($("#combobox-template").html());
		
		
	}
	
	// Object containing specific "Save Changes" method
	save_changes = {};
	
	// Object comaining specific "Load Values" method. 
	load_values = {};
	
	
	/* Common method for all controls with Label and Name */
	load_values.common = function(ctrl_type, ctrl_id) {
		var form = $("#theForm");
		var div_ctrl = $("#"+ctrl_id);
		
		form.find("[name=label]").val(div_ctrl.find('.control-label').text())
		var specific_load_method = load_values[ctrl_type];
		if(typeof(specific_load_method)!='undefined') {
			specific_load_method(ctrl_type, ctrl_id);		
		}
	}
	
	
	
	/* Specific method to load values from a textbox control to the customization dialog */
	load_values.textbox = function(ctrl_type, ctrl_id) {
		var form = $("#theForm");
		var div_ctrl = $("#"+ctrl_id);
		var ctrl = div_ctrl.find("input")[0];
		form.find("[name=name]").val(ctrl.name);		
		form.find("[name=placeholder]").val(ctrl.placeholder);		
}
	
	// Passwordbox uses the same functionality as textbox - so just point to that
	load_values.passwordbox = load_values.textbox;

	
	/* Specific method to load values from a combobox control to the customization dialog  */
	load_values.combobox = function(ctrl_type, ctrl_id) {
		var form = $("#theForm");
		var div_ctrl = $("#"+ctrl_id);
		var ctrl = div_ctrl.find("select")[0];
		form.find("[name=name]").val(ctrl.name)
		var options= '';
		$(ctrl).find('option').each(function(i,o) { options+=o.text+'\n'; });
		form.find("[name=options]").val($.trim(options));
	}
	// Multi-select combobox has same customization features
	load_values.selectmultiplelist = load_values.combobox;
	
	
	/* Specific method to load values from a radio group */
	load_values.radiogroup = function(ctrl_type, ctrl_id) {
		var form = $("#theForm");
		var div_ctrl = $("#"+ctrl_id);
		var options= '';
		var ctrls = div_ctrl.find("div").find("label");
		var radios = div_ctrl.find("div").find("input");
		
		ctrls.each(function(i,o) { options+=$(o).text()+'\n'; });
		form.find("[name=name]").val(radios[0].name)
		form.find("[name=options]").val($.trim(options));
	}
	
	// Checkbox group  customization behaves same as radio group
	load_values.checkboxgroup = load_values.radiogroup;
	
	/* Specific method to load values from a button */
	load_values.btn = function(ctrl_type, ctrl_id) {
		var form = $("#theForm");
		var div_ctrl = $("#"+ctrl_id);
		var ctrl = div_ctrl.find("button")[0];
		form.find("[name=name]").val(ctrl.name)		
		form.find("[name=label]").val($(ctrl).text().trim())		
};
	
	/* Common method to save changes to a control  - This also calls the specific methods */
	
	save_changes.common = function(values) {
		var div_ctrl = $("#"+values.forCtrl);
		div_ctrl.find('.control-label').text(values.label);
		var specific_save_method = save_changes[values.type];
		if(typeof(specific_save_method)!='undefined') {
			specific_save_method(values);		
		}
	}
	
	/* Specific method to save changes to a text box */
	save_changes.textbox = function(values) {
		var div_ctrl = $("#"+values.forCtrl);
		var ctrl = div_ctrl.find("input")[0];
		ctrl.placeholder = values.placeholder;
		ctrl.name = values.name;
		//console.log(values);
	}

	// Password box customization behaves same as textbox
	save_changes.passwordbox= save_changes.textbox;

	/* Specific method to save changes to a combobox */
	save_changes.combobox = function(values) {
		console.log(values);
		var div_ctrl = $("#"+values.forCtrl);
		var ctrl = div_ctrl.find("select")[0];
		ctrl.name = values.name;
		$(ctrl).empty();
		$(values.options.split('\n')).each(function(i,o) {
			$(ctrl).append("<option>"+$.trim(o)+"</option>");
		});
	}
	
	/* Specific method to save a radiogroup */
	save_changes.radiogroup = function(values) {
		var div_ctrl = $("#"+values.forCtrl);
		
		var label_template = $(".selectorField .ctrl-radiogroup label")[0];
		var radio_template = $(".selectorField .ctrl-radiogroup input")[0];
		
		var ctrl = div_ctrl.find(".ctrl-radiogroup");
		ctrl.empty();
		$(values.options.split('\n')).each(function(i,o) {
			var label = $(label_template).clone().text($.trim(o))
			var radio = $(radio_template).clone();
			radio[0].name = values.name;
			label.append(radio);
			$(ctrl).append(label);
		});
	}
	
	/* Same as radio group, but separated for simplicity */
	save_changes.checkboxgroup = function(values) {
		var div_ctrl = $("#"+values.forCtrl);
		
		var label_template = $(".selectorField .ctrl-checkboxgroup label")[0];
		var checkbox_template = $(".selectorField .ctrl-checkboxgroup input")[0];
		
		var ctrl = div_ctrl.find(".ctrl-checkboxgroup");
		ctrl.empty();
		$(values.options.split('\n')).each(function(i,o) {
			var label = $(label_template).clone().text($.trim(o))
			var checkbox = $(checkbox_template).clone();
			checkbox[0].name = values.name;
			label.append(checkbox);
			$(ctrl).append(label);
		});
	}
	
	// Multi-select customization behaves same as combobox
	save_changes.selectmultiplelist = save_changes.combobox;
	
	/* Specific method for Button */
	save_changes.btn = function(values) {
		var div_ctrl = $("#"+values.forCtrl);
		var ctrl = div_ctrl.find("button")[0];
		$(ctrl).html($(ctrl).html().replace($(ctrl).text()," "+$.trim(values.label)));
		ctrl.name = values.name;
		//console.log(values);
	}

	
	/* Save the changes due to customization 
		- This method collects the values and passes it to the save_changes.methods
	*/
	function save_customize_changes(e, obj) {
		//console.log('save clicked', arguments);
		var formValues = {};
		var val=null;
		$("#theForm").find("input, textarea").each(function(i,o) {
			if(o.type=="checkbox"){
				val = o.checked;
			} else {
				val = o.value;
			}
			formValues[o.name] = val;
		});
		save_changes.common(formValues);
	}
	
	/*
		Opens the customization window for this
	*/
	function customize_ctrl(ctrl_type, ctrl_id) {
		console.log(ctrl_type);
		var ctrl_params = {};

		/* Load the specific templates */
		var specific_template = templates[ctrl_type];
		if(typeof(specific_template)=='undefined') {
			specific_template = function(){return ''; };
		}
		var modal_header = $("#"+ctrl_id).find('.control-label').text();
		
		var template_params = {
			header:modal_header, 
			content: specific_template(ctrl_params), 
			type: ctrl_type,
			forCtrl: ctrl_id
		}
		
		// Pass the parameters - along with the specific template content to the Base template
		var s = templates.common(template_params)+"";
		
		
		$("[name=customization_modal]").remove(); // Making sure that we just have one instance of the modal opened and not leaking
		$('<div id="customization_modal" name="customization_modal" class="modal hide fade" />').append(s).modal('show');
		
		setTimeout(function() {
			// For some error in the code  modal show event is not firing - applying a manual delay before load
			load_values.common(ctrl_type, ctrl_id);
		},300);
	}


</script><style type="text/css"></style>
</head>
<body style="cursor: auto;">

	<!--[if lt IE 9]>
	<b class="text-error">All components may not work correctly on IE 8 or below </b><br/><br/>
	<![endif]-->
  <legend>WELCOME TO FORM BUILDER</legend>
  <div class="tabbable" style="z-index: 1;"> 
	<!-- List of controls rendered into Bootstrap Tabs -->
	<ul class="nav nav-tabs">
		<li class="active">
			<a href="#simple" data-toggle="tab">Simple input</a>
		</li>
		<li>
			<a href="#multiple" data-toggle="tab">Radio/Checkbox/List</a>
		</li>
		
	 <!--	<li class="uploadbutton"><form enctype="multipart/form-data" action="uploader.php" method="POST">
<input type="hidden" name="MAX_FILE_SIZE" value="100000" />
Choose a file to upload: <input name="uploadedfile" type="file" /><br />
<input type="submit" value="Upload File" />
</form></li> -->
	 			
		
	</ul>
	<div class="row-fluid" style="z-index: 13;">
	<div id="listOfFields" class="span3 well tab-content" style="z-index: 2;">
	  <div class="tab-pane active" id="simple" style="z-index: 3;">
		<div class="selectorField draggableField ui-draggable" name="text" style="z-index: 27;">
			<label class="control-label">Text Input</label>
			<input type="text" placeholder="Text here..." class="ctrl-textbox">
		</div>
		<div class="selectorField draggableField ui-draggable" name="password" style="z-index: 5;">
			<label class="control-label">Password</label>
			<input type="password" placeholder="Password..." class="ctrl-passwordbox">
		</div>
		<div class="selectorField draggableField ui-draggable" name="email" style="z-index: 9;">
			<label class="control-label">Email</label>
		
			<input type="email" placeholder="abc@xyz.com" class="ctrl-emailbox">
		</div>
		<div class="selectorField draggableField ui-draggable" name="selectlist" style="z-index: 6;">
			<label class="control-label">Selectlist</label>
			<select id="sel"class="ctrl-combobox">
				<option >Option 1</option>
				<option >Option 2</option>
				<option >Option 3</option>
			</select>
		</div>
	  </div>
	  
	  <div class="tab-pane" id="multiple" style="z-index: 8;">
		<div class="selectorField draggableField radiogroup ui-draggable" name="radio" style="z-index: 9;">
			<label class="control-label" style="vertical-align:top">Radio buttons</label>
			<div style="display: inline-block; z-index: 10;" class="ctrl-radiogroup" >
			
				<label class="radio"><input type="radio" name="radio" class="radio" value="option1">Option 1</label>
				<label class="radio"><input type="radio" name="radio" class="radio" value="option2">Option 2</label>
				<label class="radio"><input type="radio" name="radio" class="radio" value="option3">Option 3</label>
			
			</div>
		</div>
		<div class="selectorField draggableField checkboxgroup ui-draggable" name="checkbox" style="z-index: 11;">
			<label class="control-label" style="vertical-align:top">Checkboxes</label>
			<div style="display: inline-block; z-index: 12;" class="ctrl-checkboxgroup">
				<label class="checkbox"><input type="checkbox"  class="checkbox" value="option1">Option 1</label>
				<label class="checkbox"><input type="checkbox"  class="checkbox" value="option2">Option 2</label>
				<label class="checkbox"><input type="checkbox"  class="checkbox" value="option3">Option 3</label>
			</div>
		</div>
		<div class="selectorField draggableField  ui-draggable" name="upload">
		<input type="file" name="datafile" class="doit" data-toggle="tab" size="40">
		</div>
		<!-- <div class="selectorField draggableField selectmultiple ui-draggable" name="multiple" style="z-index: 0;">
			<label class="control-label" style="vertical-align:top">Select multiple</label>
			<div style="display: inline-block; z-index: 14;">
				<select multiple="multiple" style="width:150px" class="ctrl-selectmultiplelist">
					<option value="option1">Option 1</option>
					<option value="option2">Option 2</option>
					<option value="option3">Option 3</option>
				</select>
			</div>
		</div> -->
	  </div>

    </div>
	<!-- End of list of controls -->
	
	<!-- 
		Below we have the columns to drop controls
			-- Removed the TABLE based implementations from earlier code
			-- Grid system used for rendering columns 
			-- Columns can be simply added by defining a div with droppedFields class
	-->
	<div class="span8" id="selected-content" style="z-index: 20;">
		<!--[if lt IE 9]>
		<div class="row-fluid" id="form-title-div">
			<label>Type form title here...</label>
		</div>
		<![endif]-->
		<div><div id="output" class="xyz" style="max-width:10%; height:auto; margin-bottom:10px; float:right; margin-right:200px; margin-top:-55px;" ></div>
	  <div class="row-fluid" id="form-title-div" style="z-index: 21; float:left">
		<input type="text" class="input-large span10" placeholder="Type form title here" id="form-title">
	  </div></div>
	  
	  <div class="row-fluid" style="z-index: 22;">
		<div id="selected-column-1" class="span5 well droppedFields ui-droppable ui-sortable activeDroppable" style="z-index: 23;"></div>
		
	  </div>
	  <!-- Action bar - Suited for buttons on form -->
	  <div class="row-fluid" style="z-index: 24;">
		
	  </div>
	</div>
	</div>

		<div style="margin-top:10px;"  name="image" >



    <input type="text" id="imagename" class="image-url" style="background:#eeffee; margin-left:25px; margin-top: -7px;" /></div>
   <p><b style="margin-left:29px;">Please provide logo url above</b></p>
  


<script>
$(function(){
    $("#imagename").blur(function(){
        $('#output').html('<img alt="" src="'+$(this).val()+'">');
    });
})
</script>
	<!-- Preview button -->
	
	
	<div class="row-fluid" style="z-index: 7;">	
		<div class="span12" style="z-index: 25; margin-top:10px; margin-left:40px;">
			<input type="button" class="btn btn-primary" value="Preview" onclick="preview()">
			
			
			
			
			<input type="button" class="btn btn-primary" value="Save" onclick="savee()" style="margin-left:10px;" />
	
		</div>
	</div>

  </div>



<!-- using handlebars for templating, but DustJS might be better for the current purpose -->
<script type="text/javascript" src="js/handlebars.min.js"></script>

<!-- 
	Starting templates declaration
	DEV-NOTE: Keeping the templates and code simple here for demo  -- use some better template inheritance for multiple controls 
  -->

<script id="control-customize-template" type="text/x-handlebars-template">
	<div class="modal-header">
		<h3>{{header}}</h3>
	</div>
	<div class="modal-body">
		<form id="theForm" class="form-horizontal">
			<input type="hidden" value="{{type}}" name="type"></input>
			<input type="hidden" value="{{forCtrl}}" name="forCtrl"></input>
			<p><label class="control-label">Label</label> <input type="text" name="label" value=""></input></p>
			
			{{{content}}}
		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" data-dismiss="modal" onclick='save_customize_changes()'>Save changes</button>
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick='delete_ctrl()'>Delete</button>
	</div>
</script>

<script id="textbox-template" type="text/x-handlebars-template">
	<p><label class="control-label">Placeholder</label> <input type="text" name="placeholder" value=""></input></p>
</script>

<script id="combobox-template" type="text/x-handlebars-template">
	<p><label class="control-label">Options</label> <textarea name="options" rows="5"></textarea></p>
</script>




<script>
	$(document).ready(docReady); 
	



	

</script>

<div id="customization_modal" name="customization_modal" class="modal hide fade" aria-hidden="true" style="display: none;">
	<div class="modal-header">
		<h3>Text Input</h3>
	</div>
	<div class="modal-body">
		<form id="theForm" class="form-horizontal">
			<input type="hidden" value="textbox" name="type">
			<input type="hidden" value="CTRL-DIV-1001" name="forCtrl">
			<p><label class="control-label">Label</label> <input type="text" name="label" value=""></p>
			<!--  -->
			
	<p><label class="control-label">Placeholder</label> <input type="text" name="placeholder" value=""></p>

		</form>
	</div>
	<div class="modal-footer">
		<button class="btn btn-primary" data-dismiss="modal" onclick="save_customize_changes()">Save changes</button>
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		<button class="btn btn-danger" data-dismiss="modal" aria-hidden="true" onclick="delete_ctrl()">Delete</button>
	</div>
</div></body></html></div></body></html>