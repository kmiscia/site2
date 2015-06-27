$(document).ready(function(){
  
  var defaultSearchText = $("#search_text").val();
  
  $("#search_text").focus(function(evt){
    if($(this).val() == defaultSearchText){
      $(this).val("");
    }
  });
  
  $("#search_text").blur(function(evt){
    if(!$(this).val().length){
      $(this).val(defaultSearchText);
    }
  });
  
  $('#search_form').bind('ajax:before', function(evt, data, status, xhr){
    if($("#search_text").val() == defaultSearchText)
      $("#search_text").val('');
  });
  
  $('#search_form').bind('ajax:success', function(evt, data, status, xhr){
    $('#article_list').hide().html(xhr.responseText).fadeIn('slow', function(){
      registerMouseEvents();
    });
    
  });
  
});