// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

function keisan(obj){
	//var price = document.form.goods.selectedIndex * 100; // 単価
	var price = obj.value * obj.getAttribute('price');
	document.form.field.value = price; // 小計
	var total = price ;
	var sid=obj.getAttribute('sid');
	//document.form.field_total.value = total; // 合計
	document.getElementById('subtotal_'+sid).value=total;
	get_total();
}

function get_total(){
	var st = document.getElementsByClassName('subtotal');
	var total =0;
	for(var i=0;i<st.length;i++){
		total += Number(st[i].value);
	}
		
	document.form.field_total.value=total;
}


// function testText(){
// 	var text = document.getElementById('field_total');
// 	text.innerHTML = "200";
// }

// window.onload = function(){
// 	var button = document.getElementById('testButton');
// 	button.addEventListener('click', testText, false);
// };


