let querySource = "None";

$(document).ready(function () {
    $(".brand-select").change(function () {
        querySource = $(".brand-select option:selected").val();        
        console.log(querySource);
        $('.tags-holder').tagsinput('add', querySource);
    });

 
});


