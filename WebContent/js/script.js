$(document).ready(function(){
	
	var link_index;
	var namex,namess, valu;
	var objc = {
			formfield:{
			title1:[],
			formelements:[]
			}
				
			
		};
	
//	int count=1;

	
	$("#div2").click(function(){
		
	


	// var Content;
       $.getJSON('JsonServlet', function(jd){
 
       	console.log("inside first get");
       	console.log(jd);
        var Content='<!DOCTYPE html>';
            Content+='<html><head>';
            Content+='<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>';
            Content+='<script type="text/javascript" src="js/bootstrap.min.js"></script>';
            Content+='';
            Content+= '<title>LIST OF FORMS</title></head><body>'; 
            Content+='<h2><u>LIST OF  FORMS</h2></u>';
            Content+='<h3><ol style="line-height:30px; cursor:pointer;" >';
     
         
            // for(key in jd)
            // {
            // 	Content+='<li class="link">'+jd[key1][key]+'<li>'
            // }
//         JSONArray jsonobj = new JSONArray();
            $.each(jd, function(i, val) { 
            	
            		  namex = val.formname;
            		
            	
 Content+='<li class="link" >'+namex+'</li>';
 console.log("jd:", jd);
 console.log("val", val);
 console.log("i", i);

            
            	 
});
        
      
       
            
            Content+='</h3></style></ol>';
            Content+='</body></html>';
            var win1;
         
win1 = window.open("","_self");
win1.document.write(Content);
 //win1.document.write(content);
 console.log(Content);

	console.log("outside first get");


		    // Content+= '<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">\n';
		    // Content+='<style>\n'+$("#content-styles").html()+'\n</style>\n';
		    // Content+= '</head>\n<body>';
		    // Content+= '<legend>'+legend_text+'</legend>';
		    // Content+= selected_content_html;
		    // Content+= '<button id="save">Save</button>';
		    // Content+= '\n</body></html>';
      //       var win = window.open("about:blank");
setTimeout(function(){


 var y1 = win1.document.getElementsByClassName("link");
 
 //var xy = win1.document.getElementByClassName("table");

     
 
 
  // for (var i = 0; i <= y1.length; i++) {
  //   $(y1[i]).click(function(){ 
  //     alert(y1[i]); 
  //   })
  // };
  $(y1).click(function(){
	  
dothis();
link_index=$(this).index();
namess = $(this).text();
valu = link_index + 1;


	


});

  function dothis(){
	 
	  
    var xmlhttp = new XMLHttpRequest(),
    json;
    xmlhttp.onreadystatechange = function(){
      if (xmlhttp.readyState===4 && xmlhttp.status===200)
      {
       json =xmlhttp.responseText?JSON.parse(xmlhttp.responseText):[];
        // console.log(json);
        list();
      }
    };
    xmlhttp.open("GET", "JsonServlet", true);
    console.log("inside second get");
    xmlhttp.send();
function list(){
 var Content2='<!DOCTYPE html>';
   Content2+='<html lang="en-US"><head>';
Content2+='<meta charset="UTF-8"><title></title><link href="css/bootstrap.min.css" rel="stylesheet" media="screen"><link rel="stylesheet" href="css/jquery-ui.css">';
Content2+='<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>';

Content2+='<script type="text/javascript" src="js/bootstrap.min.js"></script>';

Content+='<script type="text/javascript" src="js/script.js"></script>';
Content2+='<style>/* Styles that are also copied for Preview */';

    
Content2+='body {margin: 10px 0 0 10px;}';





var jsonx=json[link_index].formelements.formfield.title1;
console.log("title:",jsonx);
for(var j=0; j<jsonx.length; j++){
	
	var mytitle = jsonx[j].title2;
	
var jsonimg = json[link_index].formelements.logo;
console.log("jsonimg:",jsonimg);



//   var jsonx=json[link_index].formelements.formfield.title1;
// $.each(jsonx, function(key, value){
//	 titless=key.title2;
//	 console.log("titles:",titless);
// });
// 
    
Content2+='.control-label {display: inline-block !important; padding-top: 5px; text-align: right; vertical-align: baseline;padding-right: 10px;}';
Content2+= '.droppedField {padding-left:5px;} .droppedField > input,select, button, .checkboxgroup, .selectmultiple, .radiogroup { margin-top: 10px;margin-right: 10px; margin-bottom: 10px;}';
Content2+= '.action-bar .droppedField {float: left; padding-left:5px; }' ; 
Content2+= '</style></head><body>';
if(jsonimg.length!==0 || jsonimg===null || jsonimg!=="null" || jsonimg!=="[null]" || jsonimg!==[null]){
Content2+='<div style="height:40px; width:100%; border-bottom:1px solid #e5e5e5;"><div style="float:right; margin-top:2px; max-width:150px; max-height:33px;"><img style="max-width:150px; max-height:33px;" src="'+jsonimg+'"></div>'; 
Content2+='<div style="float:left;"><legend>'+mytitle+'</legend></div></div>';
}
else{
	Content2+='<legend style="width:100%">'+mytitle+'</legend>';
}
	
 Content2+= ' <!--[if lt IE 9]><div class="row-fluid" id="form-title-div"> <label>Type form title here...</label> </div><![endif]-->';
 Content2+= '<div class="row-fluid" style="z-index: 21;">'  ;
Content2+=  '<div id="selected-column-1" class="span5 droppedFields" style="z-index: 22; width:100%">';

 // json.each(function(i, val) {

   //}
}

console.log("middle of second");


         


//index=0;  
console.log("index:", link_index);
console.log("formid:", valu);
console.log("formname:", namess);


//if(link_index%2==1)
//	{
//var json1= json[(link_index-1)].formelements.formfield.formelements;
//	}
//else
//	{
//	var json1= json[3].formelements.formfield.formelements;
//}
var json1= json[link_index].formelements.formfield.formelements;
 console.log("json1", json1);
  for(var i=0;i < json1.length; i++){
  console.log("json1-type", json1[i].type); 
   if(json1[i].type==="text")
        {
	   console.log("text-one");
          Content2+='<div class="droppedField" name="text" style="z-index: 23;" id="CTRL-DIV-100'+i+'">';
          Content2+='<label class="control-label">'+json1[i].labell+'</label>';
          Content2+='<input type="text" placeholder="Text here..." class="ctrl-textbox">';
          Content2+='</div>';
        }

        if(json1[i].type==="password")
        {
          Content2+='<div class="droppedField" name="password" style="z-index: 24;" id="CTRL-DIV-100'+i+'">';
          Content2+='<label class="control-label">'+json1[i].labell+'</label>';
          Content2+='<input type="password" placeholder="Text here..." class="ctrl-passwordbox">';
          Content2+='</div>';
        }
        
        if(json1[i].type==="email")
        {
          Content2+='<div class="droppedField" name="email" style="z-index: 30;" id="CTRL-DIV-100'+i+'">';
          Content2+='<label class="control-label">'+json1[i].labell+'</label>';
          Content2+='<input type="email" placeholder="abc@xyz.com" class="ctrl-emailbox">';
          Content2+='';
          Content2+= '</div>';
        }
        
 if(json1[i].type==="selectlist")
        {
	   
          Content2+='<div class="droppedField" name="selectlist" style="z-index: 25;" id="CTRL-DIV-100'+i+'">';
          Content2+='<label class="control-label">'+json1[i].labell+'</label>';
          Content2+='<select id="sel" class="ctrl-combobox">';
          for(var j=0;j<json1[i].choice.length;j++){
             Content2+='<option>'+json1[i].choice[j]+'</option>';
          }
          // Content2+='<option>'+json1[i].choice+'</option>'
         
          Content2+='</select>';
          Content2+='</div>';
        }
if(json1[i].type==="radio")
        {
	
          Content2+='<div class="radiogroup droppedField" name="radio" style="z-index: 24;" id="CTRL-DIV-100'+i+'">';
          Content2+='<label class="control-label" style="vertical-align:top">'+json1[i].labell+'</label>';
          Content2+='<div style="display: inline-block; z-index: 25;" class="ctrl-radiogroup">';
          
          for(var j1=0;j1<json1[i].choice.length;j1++){
      
          Content2+='<label class="radio"><input type="radio" name="radioField'+i+'" value="option'+j1+'">'+json1[i].choice[j1]+'</label>';
        
          }
         
          // Content2+='<option>'+json1[i].choice+'</option>'
         
          Content2+='</div>';
          Content2+='</div>';
         
        }

if(json1[i].type==="checkbox")
        {
          Content2+='<div class="checkboxgroup droppedField" name="checkbox" style="z-index: 30;" id="CTRL-DIV-100'+i+'">';
          Content2+='<label class="control-label" style="vertical-align:top">'+json1[i].labell+'</label>';
          Content2+='<div style="display: inline-block; z-index: 25;" class="ctrl-checkboxgroup">';
          for(var j2=0;j2<json1[i].choice.length;j2++){
             Content2+='<label class="checkbox"><input type="checkbox" name="checkboxField'+i+'" value="option"'+j2+'>'+json1[i].choice[j2]+'</label>';
          }
          // Content2+='<option>'+json1[i].choice+'</option>'
         
          Content2+='</div>';
          Content2+='</div>';
        }

}
//       if(json1[i].labell.type===text)
//         {
//           Content2+='<div class="droppedField" name="text" style="z-index: 23;" id="CTRL-DIV-1001">'
//           Content2+='<label class="control-label">'+val.labell+'</label>'
//           Content2+='<input type="text" placeholder="Text here..." class="ctrl-textbox">'
//           Content2+='</div>'
//         }
        // });

         Content2+='</div></div>';
            // Content2+='</div>'
//         Content2+='<tr>';
//Content2+='<script src=js/common.js></script>';
//Content2+='<td align="center" colspan="2">';
//Content2+='<script src="js/common.js"></script>';
//Content2+='<script type="text/javascript" src="http://api.recaptcha.net/challenge?k=6Ldz3AYAAAAAAEufe8NxH7L_rZgQWTHT_IH8K6RC"></script><script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha.js"></script><div id="recaptcha_widget_div" class=" recaptcha_nothad_incorrect_sol recaptcha_isnot_showing_audio"><div id="recaptcha_area"><table id="recaptcha_table" class="recaptchatable recaptcha_theme_red"> <tbody><tr> <td colspan="6" class="recaptcha_r1_c1"></td> </tr> <tr> <td class="recaptcha_r2_c1"></td> <td colspan="4" class="recaptcha_image_cell"><center><div id="recaptcha_image" style="width: 300px; height: 57px;"><img id="recaptcha_challenge_image" alt="reCAPTCHA challenge image" height="57" width="300" src="http://www.google.com/recaptcha/api/image?c=03AHJ_Vuub6WAJFCLExS6iFSXDwT_KXxCxE-LxtIrPAw_D3OUCHgNmV1JBKAgz9giuTn57P1B8fxqtDm0OF2jl8vIigvdgNL9Oe58eH6t9t9cymkF55qo1Ile10-Ujhs_ZC6wC0DHnbCaEArzHhFVaiF6H2SkJ5fUAmYOgH8-IkJbZDQSWMqjqtikkUbqq6MWyS9-Q3R8_BOgMbYdQ1MFVgD6rFsgNatFw5HlGQw7nlTBR5RJMPowGFAMD2F-0ZUKfmkkgZhfNnZMo12qfeK9WeGuAunDl_6DSsg&amp;th=,8bCLm5832hiSl7ZbaDXgVZGdp_AAAACzoAAAAAzYAMkHgoHE3mKISzfF1YTvcLcpufYWT8nuwiV1ga1PTF9iT0dtZCjBqhoGuQVGjhVNJN2q4CLMV8tpfDWih2q2_whFB0VHi_aqEQY-TaSJ8ucKbAEpg4ct10JPSQBU3SKSyuw_ZAiAyosu94Oqfaq-FqX6ZQn9MKNSujMTPS15DMvI15YUC9AO1PPQncpPsajraDizRxF4mWWZ7f_jgStTZ_t6U_0kz17Rp8vnkqWvsgc041J3RP16xFiryM5BRVv6-R0sYg7U-qBe8xI"></div></center></td> <td class="recaptcha_r2_c2"></td> </tr> <tr> <td rowspan="6" class="recaptcha_r3_c1"></td> <td colspan="4" class="recaptcha_r3_c2"></td> <td rowspan="6" class="recaptcha_r3_c3"></td> </tr> <tr> <td rowspan="3" class="recaptcha_r4_c1" height="49"> <div class="recaptcha_input_area"> <span id="recaptcha_challenge_field_holder" style="display: none;"><input type="hidden" name="recaptcha_challenge_field" id="recaptcha_challenge_field" value="03AHJ_Vuub6WAJFCLExS6iFSXDwT_KXxCxE-LxtIrPAw_D3OUCHgNmV1JBKAgz9giuTn57P1B8fxqtDm0OF2jl8vIigvdgNL9Oe58eH6t9t9cymkF55qo1Ile10-Ujhs_ZC6wC0DHnbCaEArzHhFVaiF6H2SkJ5fUAmYOgH8-IkJbZDQSWMqjqtikkUbqq6MWyS9-Q3R8_BOgMbYdQ1MFVgD6rFsgNatFw5HlGQw7nlTBR5RJMPowGFAMD2F-0ZUKfmkkgZhfNnZMo12qfeK9WeGuAunDl_6DSsg"></span><input name="recaptcha_response_field" id="recaptcha_response_field" type="text" autocorrect="off" autocapitalize="off" placeholder="Type the text" autocomplete="off"> <span id="recaptcha_privacy" class="recaptcha_only_if_privacy"><a href="http://www.google.com/intl/en/policies/" target="_blank">Privacy &amp; Terms</a></span> </div> </td> <td rowspan="4" class="recaptcha_r4_c2"></td> <td><a id="recaptcha_reload_btn" title="Get a new challenge"><img id="recaptcha_reload" width="25" height="17" src="http://www.google.com/recaptcha/api/img/red/refresh.gif" alt="Get a new challenge"></a></td> <td rowspan="4" class="recaptcha_r4_c4"></td> </tr> <tr> <td><a id="recaptcha_switch_audio_btn" class="recaptcha_only_if_image" title="Get an audio challenge"><img id="recaptcha_switch_audio" width="25" height="16" alt="Get an audio challenge" src="http://www.google.com/recaptcha/api/img/red/audio.gif"></a><a id="recaptcha_switch_img_btn" class="recaptcha_only_if_audio" title="Get a visual challenge"><img id="recaptcha_switch_img" width="25" height="16" alt="Get a visual challenge" src="http://www.google.com/recaptcha/api/img/red/text.gif"></a></td> </tr> <tr> <td><a id="recaptcha_whatsthis_btn" title="Help"><img id="recaptcha_whatsthis" width="25" height="16" src="http://www.google.com/recaptcha/api/img/red/help.gif" alt="Help"></a></td> </tr> <tr> <td class="recaptcha_r7_c1"></td> <td class="recaptcha_r8_c1"></td> </tr> </tbody></table> </div></div>';
//Content2+='<noscript>&lt;iframe src="http://api.recaptcha.net/noscript?k=6Ldz3AYAAAAAAEufe8NxH7L_rZgQWTHT_IH8K6RC" height="300" width="500" frameborder="0" title="CAPTCHA test"&gt;&lt;/iframe&gt&lt;br /&gt&lt;label for="tswcaptcha"&gt;Copy and paste the code provided in above box here:&lt;/label&gt;&lt;br /&gt&lt;textarea name="recaptcha_challenge_field" id="tswcaptcha" rows="3" cols="40"&gt;&lt;/textarea&gt&lt;input type="hidden" name="recaptcha_response_field" value="manual_challenge" /&gt</noscript>';
//Content2+='</td>';
//Content2+='</tr>';
      
         Content2+= '<input type="button" value="Edit" id="edit" style="height:40px; width:60px; background:blue; color:white; font-size:20px;">';
     //  Content2+='<div class="abcd"; onclick="savmeme()">SAVE</div>'
         Content2+= '<input type="button" value="Save" id="saveme"  style="height:40px; width:60px; margin-left:10px; background:blue; color:white; font-size:20px;" >';      
         Content2+='</body></html>';

 // $.getJSON('result2.json', function(jd1) {
 
 // dothis("localhost:8080/FormBuilderDatabase/id/"+valu)

 
  win2 = window.open("localhost:8080/FormBuilderDatabase/id/"+valu);
  win2.document.write(Content2);
 
  console.log("outside second get");
  // });

  
  
  var y2 = win2.document.getElementById("saveme");

//console.log(y);
//console.log($(y));



$(y2).click(function(){

	

	var get = win2.document.getElementById("selected-column-1");
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

			// objc.typefield.textfield[inc].num= ind;
			// objc.typefield.textfield[inc].labell =obje.find(".control-label").text() ;
			// objc.typefield.textfield[inc].inputt =obje.find(".ctrl-textbox").val() ;

			// console.log(objc.typefield.textfield[inc].num);

			// console.log(objc.typefield.textfield[inc].labell);
			// console.log(objc.typefield.textfield[inc].inputt);
//                inc+= 1;
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
//               var x=obje.find("#sel option");
//                for(i=0;i<x.length;i++) {
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
               
              
               
//               var elt3 =obje.find(".ctrl-radiogroup");
//              elt4=elt3[($("input[type=radio]:checked").text())];
//             
//               te3.inputt.push(te3);
               
               
               
               //               var valxx="";
//               for(var n=0; n<elt3.length; n++){
//            	   if (elt3[n].checked){
//            		    valxx = elt3[n].text();
//            		    te3.inputt.push(valxx);
//            		    break;
//            	   }
//            	   else{
//            		   
//            	   }
//             
//               }
               
               
//             elt3=obje.find(".ctrl-radiogroup");
//            var elt4 =  $('input:radio[name=radioField]:checked:true');
//            var elt5=$(this).text();
//        	
//            
//            if(elt5!==null){
//            	te3.inputt.push(elt5);
//            }
//            else{
//            	
//            }
          
//          
//               var exx = obje.find(".radio");
//               for(var i = 0; i < exx.radio; i++)
//               {
//            	   
//         		  if(exx.radio[i].checked)
//         		  {
//                                var val = exx.radio[i].text();
//                                te3.inputt.push(val);
//         		  }
//          
//         	  }

               
               
               
               
               //            	var val = "";
//                var selected= $("input[type='radio'][name='radio']:checked");
//                if (selected.length>0)  
//                { 
//                      val = selected.text();
//                      te3.inputt.push(val);
//                   }
//                 else{
//                	   
//                   }
          
               
//               var x=obje.find("#sel option");
//                for(i=0;i<x.length;i++) {
			   //  te2.optionns.push(x.options[i].text)
				  // }
				
//			   	 console.log(te3.optionns);
//				 elt3=obje.find(".radio");
//				 var elt4=elt3["checked:true"]
//				 te3.inputt.push(elt4);

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
               	inputt:[]
               	
               	
                   
               };
               console.log(te4);
               	var opt=obje.find(".ctrl-checkboxgroup");
               opt.children().each(function() {
               
				    te4.optionns.push($(this).text());
				    

				});
               
               
//               var chkArray = [];
//           	
//           	/* look for all checkboes that have a class 'chk' attached to it and check if it was checked */
//           	$(".checkbox:checked").each(function() {
//           		chkArray.push($(this).val());
//           	});
//           	
//           	/* we join the array separated by the comma */
//           	var selected;
//           	selected = chkArray.join(',') + ",";
//           	
//           	/* check if there is selected checkboxes, by default the length is 1 as it contains one single comma */
//           	if(selected.length > 1){
//           		alert("You have selected " + selected);	
//           	}else{
//           		alert("Please at least one of the checkbox");	
//           	}
               
               
               
        
               
            
				 
           	
				 opt.children().each(function() {
					 val2=$(this).find('input[type="checkbox"]').val();
					 val4=$(this).find('input[type="checkbox"]:checked').val();
				 
					 if(val2===val4){
						 te4.inputt.push($(this).text());

           }
				 });
              
             
//             if (val4===val3){
//          	   te4.inputt.push($(this).text());
//             }
			
               
//               var x=obje.find("#sel option");
//                for(i=0;i<x.length;i++) {
			   //  te2.optionns.push(x.options[i].text)
				  // }
				
			//	console.log(te4.optionns);
			//	 elt5=obje.find(".checkbox");
			//	 var elt6=elt5[0].options[elt5[0].selectedIndex].text;
			//	 te4.selectedoption.push(elt6);

            //     console.log(te2.selectedoption);
               console.log(objc.formfield.formelements);
			 objc.formfield.formelements.push(te4);
			 console.log( objc.formfield.formelements[inc4]);
			 inc4+= 1;
}

console.log("middle");
});
	console.log("outside get");
//$.each( objc, function( key, value ) {
//$.each( value, function( key1, value1 ){
//alert( key1 + ": " + value1 );
//});
//});

var recursiveEncoded = $.param( objc );
var recursiveDecoded = decodeURIComponent( $.param( objc ) );


	// $(get).serializeArray();
	// console.log($(get).serializeArray());






$.ajax({
type: 'POST',
url: 'JsonServlet',

dataType: 'Json',
Json: 'Json',
data: {send: JSON.stringify(objc), name:namess, formid:valu},
error: function(data) {alert("There was a problem in saving the form"); },
success:function(data) { alert("Form saved and successfully updated to database"); }

});

win2.close();
location.reload();

 
});

  
//function validateForm() {
//    var x = document.forms["myForm"]["email"].value;
//    var atpos = x.indexOf("@");
//    var dotpos = x.lastIndexOf(".");
//    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
//        alert("Not a valid e-mail address");
//        return false;
//    }
//}

}  
}

//     console.log("in");
//     var Content2='<!DOCTYPE html>'
//    Content2+='<html lang="en-US"><head>'
// Content2+='<meta charset="UTF-8"><title></title><link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">'
//  Content2+='<style>/* Styles that are also copied for Preview */'

    
// Content2+='body {margin: 10px 0 0 10px;}'
   
    
    
// Content2+='.control-label {display: inline-block !important; padding-top: 5px; text-align: right; vertical-align: baseline;padding-right: 10px;}'
// Content2+= '.droppedField {padding-left:5px;} .droppedFiel  nd > input,select, button, .checkboxgroup, .selectmultiple, .radiogroup { margin-top: 10px;margin-right: 10px; margin-bottom: 10px;}'
// Content2+= '.action-bar .droppedField {float: left; padding-left:5px; }'   
//  Content2+= '</style></head><body><legend>Form builder demo</legend>'   
//  Content2+= ' <!--[if lt IE 9]><div class="row-fluid" id="form-title-div"> <label>Type form title here...</label> </div><![endif]-->'
//  Content2+= '<div class="row-fluid" style="z-index: 21;">'  
// Content2+=  '<div id="selected-column-1" class="span5 droppedFields" style="z-index: 22;">'
//      $.each(jd1.formelements , function(i, val) { 
//       if(val.type===text)
//         {
//           Content2+='<div class="droppedField" name="text" style="z-index: 23;" id="CTRL-DIV-1001">'
//           Content2+='<label class="control-label">'+val.labell+'</label>'
//           Content2+='<input type="text" placeholder="Text here..." class="ctrl-textbox">'
//           Content2+='</div>'
//         }
//         });
//          Content2+='</div></div>'
//          Content2+='<button id="save">Save</button>'
//          Content2+='</body></html>'
      
//  var win2 = window.open("about:blank");
//  win2=document.write(Content2);

//  });
// })

}, 100);
  // var y1 = win1.document.getElementsByClassName("link");
  // for (var i = 0; i <= y1.length; i++) {
  //   $(y1[i]).click(function(){
  //     alert(y1[i]); 
  //   })
  // };
// $(y1).click(function(){
//   $.getJSON('result2.json', function(jd1) {
//     console.log("in");
//     var Content2='<!DOCTYPE html>'
//    Content2+='<html lang="en-US"><head>'
// Content2+='<meta charset="UTF-8"><title></title><link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">'
//  Content2+='<style>/* Styles that are also copied for Preview */'

    
// Content2+='body {margin: 10px 0 0 10px;}'
   
    
    
// Content2+='.control-label {display: inline-block !important; padding-top: 5px; text-align: right; vertical-align: baseline;padding-right: 10px;}'
// Content2+= '.droppedField {padding-left:5px;} .droppedField > input,select, button, .checkboxgroup, .selectmultiple, .radiogroup { margin-top: 10px;margin-right: 10px; margin-bottom: 10px;}'
// Content2+= '.action-bar .droppedField {float: left; padding-left:5px; }'   
//  Content2+= '</style></head><body><legend>Form builder demo</legend>'   
//  Content2+= ' <!--[if lt IE 9]><div class="row-fluid" id="form-title-div"> <label>Type form title here...</label> </div><![endif]-->'
//  Content2+= '<div class="row-fluid" style="z-index: 21;">'  
// Content2+=  '<div id="selected-column-1" class="span5 droppedFields" style="z-index: 22;">'
//      $.each(jd1.formelements , function(i, val) { 
//       if(val.type===text)
//         {
//           Content2+='<div class="droppedField" name="text" style="z-index: 23;" id="CTRL-DIV-1001">'
//           Content2+='<label class="control-label">'+val.labell+'</label>'
//           Content2+='<input type="text" placeholder="Text here..." class="ctrl-textbox">'
//           Content2+='</div>'
//         }
//         });
//          Content2+='</div></div>'
//          Content2+='<button id="save">Save</button>'
//          Content2+='</body></html>'
      
//  var win2 = window.open("about:blank");
//  win2=document.write(Content2);

//  });
// })
  
});
}); 
// var y1 = win1.document.getElementById("link");
// $(y).click(function(){
//   var Content2='<!DOCTYPE html>'
//    Content2+='<html lang="en-US"><head>'
// Content2+='<meta charset="UTF-8"><title></title><link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">'
//  Content2+='<style>/* Styles that are also copied for Preview */'

    
// Content2+='body {margin: 10px 0 0 10px;}'
   
    
    
// Content2+='.control-label {display: inline-block !important; padding-top: 5px; text-align: right; vertical-align: baseline;padding-right: 10px;}'
// Content2+= '.droppedField {padding-left:5px;} .droppedField > input,select, button, .checkboxgroup, .selectmultiple, .radiogroup { margin-top: 10px;margin-right: 10px; margin-bottom: 10px;}'
// Content2+= '.action-bar .droppedField {float: left; padding-left:5px; }'   
//  Content2+= '</style></head><body><legend>Form builder demo</legend>'   
//  Content2+= ' <!--[if lt IE 9]><div class="row-fluid" id="form-title-div"> <label>Type form title here...</label> </div><![endif]-->'
//  Content2+= '<div class="row-fluid" style="z-index: 21;">'  
// Content2+=  '<div id="selected-column-1" class="span5 droppedFields" style="z-index: 22;">'

//    $.getJSON('result1.json', function(jd1) {
//      $.each(jd1.formelements , function(i, val) { 
//       if(val.type===text)
//         { 
//           Content2+='<div class="droppedField" name="text" style="z-index: 23;" id="CTRL-DIV-1001">'
//           Content2+='<label class="control-label">'+val.labell+'</label>'
//           Content2+='<input type="text" placeholder="Text here..." class="ctrl-textbox">'
//           Content2+='</div>'
//         }
//         });
//          Content2+='</div></div>'
//          Content2+='<button id="save">Save</button>'
//          Content2+='</body></html>'
//        });
//  var win2 = window.open("about:blank");
//  win2=document.write(Content2);

// })
	  
	
	
	
});

	
