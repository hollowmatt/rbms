// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

// $(document).ready(function(){
//     // Set the interval to be 5 seconds
//     var t = setInterval(function(){
//         $("#carousel ul").animate({marginLeft:-480},1000,function(){
//             $(this).find("li:last").after($(this).find("li:first"));
//             $(this).css({marginLeft:0});
//         })
//     },5000);
// });

$(document).ready(function() {
    $('.carousel').tinycarousel({ display: 2 });
});