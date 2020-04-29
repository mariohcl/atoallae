//preloader
window.onload = function(){
  $('#preloader').addClass('preloader-none');
}

//Header Sticky
$(document).scroll(function() {
    if ($(this).scrollTop() > 200){
        $('header.main-header').addClass("wrap-menu-stick");
    }
    else{
        $('header.main-header').removeClass("wrap-menu-stick");
    }
});


//Menu Tabs profile user
$(document).ready(function() {
    $(".tabs-menu a").click(function(event) {
        event.preventDefault();
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".tab-content").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
});


//Tooltips
$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

// Alertas
$(document).ready(function(){
  setInterval(function(){
    $('div.alert-cont').addClass("out")
  }, 2000);

});

//Modal
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
