// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery.matchHeight
//= require jquery.quickfit
//= require jquery_ujs
//= require underscore-min
//= require notify.js
//= require gmaps/google
//= require_tree .

$(".nav a").on("click", function() {
   $(".nav").find(".active").removeClass("active");
   $(this).parent().addClass("active");
});

$(function() {
  $(".dropdown-menu > li > a.trigger").on("click",function(e) {
    var current = $(this).next();
    var grandparent = $(this).parent().parent();

    if($(this).hasClass('left-caret') || $(this).hasClass('right-caret')) {
      $(this).toggleClass('right-caret left-caret');
    }

    grandparent.find('.left-caret').not(this).toggleClass('right-caret left-caret');
    grandparent.find(".sub-menu:visible").not(current).hide();
    current.toggle();
    e.stopPropagation();
  });

  $(".dropdown-menu > li > a:not(.trigger)").on("click",function() {
    var root = $(this).closest('.dropdown');
    root.find('.left-caret').toggleClass('right-caret left-caret');
    root.find('.sub-menu:visible').hide();
  });
});