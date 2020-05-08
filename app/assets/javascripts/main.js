$(window).on('turbolinks:load',function() {
    $("#status").fadeOut();
    $("#preloader").delay(1000).fadeOut("slow");
})

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

// TopUp
$(document).ready(function(){

	$('.top-up').click(function(){
		$('body, html').animate({
			scrollTop: '0px'
		}, 400);
	});

	$(window).scroll(function(){
		if( $(this).scrollTop() > 0 ){
			$('.top-up').slideDown(300);
		} else {
			$('.top-up').slideUp(300);
		}
	});

});
