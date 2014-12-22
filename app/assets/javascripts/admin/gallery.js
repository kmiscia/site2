$(document).on('cocoon:after-insert', function(e, el) {
  $(el).find(".gllpLatlonPicker").each(function() {
		(new GMapsLatLonPicker()).init( $(this) );
	});  
});