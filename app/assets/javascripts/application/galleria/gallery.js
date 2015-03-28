$(document).ready(function(){
  if($(".gallery_container").length){
    Galleria.loadTheme('galleria/themes/classic/galleria.classic.min.js');
    Galleria.run('.gallery_container');
  }
});