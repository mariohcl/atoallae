$(window).on('turbolinks:load',function() {
    $("#status").fadeOut();
    $("#preloader").delay(1000).fadeOut("slow");
})

//Menu Tabs profile user
$(document).on('ready turbolinks:load', function() {
    $(".tabs-menu a").click(function(event) {
        event.preventDefault();
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".tab-content").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
});

//Header Sticky
$(document).scroll(function() {
    if ($(this).scrollTop() > 200){
        $('header.main-header').addClass("wrap-menu-stick");
    }
    else{
        $('header.main-header').removeClass("wrap-menu-stick");
    }
});

// search
$(document).on('ready turbolinks:load', function(){
  $("#search-btn").click(function(){
    $("#search-block").addClass("search-active");
  });

  $("a.close-form").click(function(){
    $("#search-block").removeClass("search-active");
  });

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
$(document).on('ready turbolinks:load', function(){

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
