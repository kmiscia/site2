var initializeGPSPicker = function($gpsPicker) {
  (new GMapsLatLonPicker()).init($gpsPicker);
}

$(document).on('ready', function() {
  $(".gllpLatlonPicker").each(function() {
		initializeGPSPicker($(this))    
	});  
});

$(document).on('cocoon:after-insert', function(e, el) {
  initializeGPSPicker($(el).find(".gllpLatlonPicker"));
});

