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
//= require turbolinks
//= require_tree .

$(function(){
	// Was working =/ now it's not. What the hell.
	$(".new").on("click", function(e){
		e.preventDefault();

		var url = e.target.href;
		console.log(url);
		$.get(url, function (response) {
			$(e.target.parentElement.parentElement).after(response);
		});
	});
  // $("#event_happen_at").datepicker();
});