// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// import '../javascripts/keisan'
console.log('test');
console.log('test2')

document.addEventListener("DOMContentLoaded",function(){

    var keisan_tests= document.getElementsByClassName("keisan_test")
    for(var keisan_test of keisan_tests){
        keisan_test.onchange = 
        function keisan(){
            //var price = document.form.goods.selectedIndex * 100; // 単価
            var price = this.value * this.getAttribute('price');
            document.form.field.value = price; // 小計
            var total = price ;
            var sid=this.getAttribute('sid');
            //document.form.field_total.value = total; // 合計
            document.getElementById('subtotal_'+sid).value=total;
            get_total();
        }
    }
    
    
    function get_total(){
        var st = document.getElementsByClassName('subtotal');
        var total =0;
        for(var i=0;i<st.length;i++){
            total += Number(st[i].value);
        }
            
        document.form.field_total.value=total;
    }
});
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
