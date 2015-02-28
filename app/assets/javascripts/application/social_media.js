var social_media_in = function(el){
  $(el).css({backgroundPosition: '0px -30px'});
}

var social_media_out = function(el){
  $(el).css({backgroundPosition: '0px 0px'});
}

$(document).ready(function() {
  $(".social_media").on('mouseover mouseout', function(evt) {
    evt.type == 'mouseover' ? social_media_in(evt.target) : social_media_out(evt.target);
  });
});