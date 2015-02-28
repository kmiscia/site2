$(document).ready(function(){

  $(".sidebar_heading").click(function(evt){

    $sidebar_container = $(evt.currentTarget).parents(".sidebar_container");
    
    $sidebar_window = $(".sidebar_window", $sidebar_container);
    if($sidebar_window.is(":visible"))
      $sidebar_window.slideUp('fast');
    else
      $sidebar_window.slideDown('fast');

    $sidebar_window_image = $(".background", $sidebar_container);
    if($sidebar_window_image.css('backgroundPosition') == "0px 0px")
      $sidebar_window_image.css({backgroundPosition: '0px -40px'});
    else
      $sidebar_window_image.css({backgroundPosition: '0px 0px'});

    return false;
  });
  
});