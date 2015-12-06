$(document).ready(function(){

$("#btnm").click(function(){
var valxxx = document.getElementById('imagename').value,
	        src = valxxx,
	        img = document.createElement('img');

	    img.src = src;
	    body.appendChild(img);
});

});