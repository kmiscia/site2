$(document).ready(function(){
  $('.Collage').removeWhitespace().collagePlus({
    'fadeSpeed': 1000,
    'targetHeight': 200,
    'allowPartialLastRow': true
  });
  $('.Collage').collageCaption();
});