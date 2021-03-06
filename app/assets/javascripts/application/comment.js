$(document).ready(function(){

  $(".comments").on("click", function(){
    $comments_container = $(".comments-container", $(this).parents(".article_body"))
    
    var hideComments = $comments_container.is(':visible');
    
    hideComments ? $comments_container.slideUp() : $comments_container.slideDown();
    $(this).html($(this).html().replace(/^[a-zA-Z]{4}/, hideComments ? 'Show' : 'Hide'));
    
    return false;
  });

  $('.create_comment_form').bind("ajax:success", function(evt, data, status, xhr){
    $("ul", $(evt.target).parents(".comments-container")).append(xhr.responseText);
    
    $comments_link = $(".comments" , $(this).parents(".article_body"))
    $comments_link.html($comments_link.html().replace(/[0-9+]/, parseInt($comments_link.html().match(/[0-9+]/)) + 1))  
    
    $comments_body = $(".text_input" , $(this).parents(".article_body"))
    $comments_body.val("")
  });

});