(function() {
    ('.required-icon').tooltip({
        placement: 'left',
        title: 'Required field'
        });
});

$("#congratulation-text").keyup(function(){
    $("#text-count").text($(this).val().length + " symbols");
});

 function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            $('#img_prev')
              .attr('src', e.target.result)
              .width(300)
              .height(200);
          };

          reader.readAsDataURL(input.files[0]);
        }
      }