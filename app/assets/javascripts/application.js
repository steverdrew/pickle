// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require jquery_ujs
//= require jquery.easing.1.3.js
//= require jquery.timers-1.2.js
//= require jquery.dualSlider.0.3.min
//= require_tree .


//featured properties
$(document).ready(function() {
	
	$(".carousel").dualSlider({
		auto:true,
		autoDelay: 6000,
		easingCarousel: "swing",
		easingDetails: "easeOutBack",
		durationCarousel: 1000,
		durationDetails: 600
	});
		
	});		
	


