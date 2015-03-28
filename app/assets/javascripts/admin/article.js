$(document).ready(function(){

  function update_crop(coords){
    $("#crop_x").val(Math.round(coords.x));
    $("#crop_y").val(Math.round(coords.y));
    $("#crop_w").val(Math.round(coords.w));
    $("#crop_h").val(Math.round(coords.h));
  }

  $("#edit_current_image").on('click', function(event){
    event.preventDefault();

    if($("#cropbox").not('visible')){

      $(event.currentTarget).text("Start Editing Image");

      $("#cropbox").Jcrop({
        onChange: update_crop,
        onSelect: update_crop,
        setSelect: [0, 0, 700, 100]
      }).show();
    }
  });
});
