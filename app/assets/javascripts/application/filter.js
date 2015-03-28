var disableHoverOut = {};

var outSteps = {
  '0px 0px':'0px -90px',
  '0px -30px':'0px -0px',
  '0px -60px':'0px -30px',
  '0px -90px':'0px -60px'
}

var inSteps = {
  '0px 0px':'0px -30px',
  '0px -30px':'0px -60px',
  '0px -60px':'0px -90px',
  '0px -90px':'0px -0px'
}

var extract_filter_id = function(str){
  return str.match(/^filter_image_([0-9]*$)/)[1];
}

var filter_image_in = function(el){
  $filter = $(el).parent(".filter");
  $filter_image = $("div", $filter);
  $filter_image.css({backgroundPosition: inSteps[$filter_image.css('backgroundPosition')]});
  return false;
}

var filter_image_out = function(el){

  filter_id = extract_filter_id(el.id);

  if(disableHoverOut[filter_id] == null || !disableHoverOut[filter_id]){
    $filter = $(el).parent(".filter");
    $filter_image = $("div", $filter);
    $filter_image.css({backgroundPosition: outSteps[$filter_image.css('backgroundPosition')]});
  }
  
  disableHoverOut[filter_id] = false;
  
  return false;
}

$(document).ready(function(){
  
  $(document).on('ajax:success', '.sidebar_window', function(evt, data, status, xhr) {
    $('#article_list').hide().html(xhr.responseText).fadeIn('slow');
  });
  
  $(".filter_image").click(function(evt){
    
    filter_id = extract_filter_id(evt.target.id);
    
    $filter = $(evt.target).parent(".filter");
    $filter_image = $("div", $filter);

    backgroundPosition = inSteps[$filter_image.css('backgroundPosition')];
    
    if(disableHoverOut[filter_id] && disableHoverOut[filter_id] == true) 
      backgroundPosition = inSteps[backgroundPosition];
    
    $filter_image.css({backgroundPosition:backgroundPosition});

    disableHoverOut[filter_id] = true;
  });

  $("div.filter").mouseover(function(evt) {
    filter_image_in(evt.target);
  });

  $("div.filter").mouseout(function(evt) {
    filter_image_out(evt.target);
  });
  
});