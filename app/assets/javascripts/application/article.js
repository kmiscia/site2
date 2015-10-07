/*
var homepage_image_over = function(el){
  $(".overlay_el", $(el)).show();
}

var homepage_image_out = function(el){
  $(".overlay_el", $(el)).hide();
  $(".article_body", $(el)).slideUp('fast');
}

var articleEnterListener = function(){
  homepage_image_over(this);
}

var articleLeaveListener = function(){
  homepage_image_out(this);
}


// Attaching by explicity ID so we can remove by ID later with off()
// (off() requires the selector to match the on() selector)
var registerMouseEvents = function(){
  
  $('.article').each(function(index, element){
    $('#' + element.id)
      .on('mouseenter', articleEnterListener)
      .on('mouseleave', articleLeaveListener);
  });

  $('#article_pagination a').on('ajax:success', function(evt, data, status, xhr){
    $('#article_list').hide().html(xhr.responseText).fadeIn('slow', function(){
      registerMouseEvents();
    });
  });

  $(".article").on("click", function(){
    $article_body = $(".article_body", $(this).parent(".article_wrapper"));
    
    // See .on() attachment comment for why we're doing it this way
    $this_article = $('#' + $(this).attr('id'))
    
    if($article_body.is(":visible")){
      $article_body.slideUp('fast');
      $this_article
        .on('mouseenter', articleEnterListener)
        .on('mouseleave', articleLeaveListener);
    }
    else {
      $article_body.show('fast');
      $this_article
        .off('mouseenter', articleEnterListener)
        .off('mouseleave', articleLeaveListener);
    }
      
    return false;
  });
}

$(document).ready(function(){
  registerMouseEvents();
  $(".article:first").mouseenter().click();
});
*/
