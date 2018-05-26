//parallax effect
materialKitDemo = {

  checkScrollForParallax:function(){
      oVal = ($(window).scrollTop() / 3);
      big_image.css({
          'transform':'translate3d(0,' + oVal +'px,0)',
          '-webkit-transform':'translate3d(0,' + oVal +'px,0)',
          '-ms-transform':'translate3d(0,' + oVal +'px,0)',
          '-o-transform':'translate3d(0,' + oVal +'px,0)'
      });
  },
}

// ekko lightbox
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
});

//slick slider
$(".slider").slick({
    infinite:true,
    slideToShow: 1,
    slideToScroll: 1
});
