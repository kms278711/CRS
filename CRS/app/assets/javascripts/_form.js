(function() {
    ('.required-icon').tooltip({
        placement: 'left',
        title: 'Required field'
        });
});

$("#congratulation-text").keyup(function(){
    $("#text-count").text($(this).val().length + " symbols");
});

