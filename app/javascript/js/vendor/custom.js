(function($) {

    'use strict';
    // Mean Menu JS
    jQuery('.mean-menu').meanmenu({ 
        meanScreenWidth: "991"
    });

    // Nice Select JS
    $('.select1').niceSelect();
    
    // Header Sticky, Go To Top JS JS
    $(window).on('scroll', function() {
        // Header Sticky JS
        if ($(this).scrollTop() >150){  
            $('.navbar-area').addClass("is-sticky");
        }
        else{
            $('.navbar-area').removeClass("is-sticky");
        };

        // Go To Top JS
        var scrolled = $(window).scrollTop();
        if (scrolled > 300) $('.go-top').addClass('active');
        if (scrolled < 300) $('.go-top').removeClass('active');
    });

    // Testimonials Slider JS
    $('.testimonials-slider').owlCarousel({
        items:1,
        loop: true,
        margin: 0,
        nav: true,
        dots: true,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
        navText: [
            "<i class='flaticon-left-arrow'></i>",
            "<i class='flaticon-right-arrow'></i>",
        ],
    });

    // Partner Slider JS
    $('.partner-slider').owlCarousel({
        loop: true,
        margin: 30,
        nav: true,
        dots: false,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
        navText: [
            "<i class='flaticon-left-arrow'></i>",
            "<i class='flaticon-right-arrow'></i>",
        ],
        responsive: {
            0: {
                items: 1,
            },
            414: {
                items: 1,
            },
            576: {
                items: 3,
            },
            768: {
                items: 3,
            },
            992: {
                items: 4,
            },
            1200: {
                items: 5,
            },
        },
    });

    // Hiring List Slider JS
    $('.hiring-list-slider').owlCarousel({
        items:1,
        loop: true,
        margin: 0,
        nav: true,
        dots: false,
        autoplay: true,
        smartSpeed: 1000,
        autoplayHoverPause: true,
        navText: [
            "<i class='flaticon-left-arrow'></i>",
            "<i class='flaticon-right-arrow'></i>",
        ],
    });

    // Testimonials Slider Three
    $('.testimonials-slider-three').owlCarousel({
        loop: true,
        nav: true,
        autoplay: true,
        autoplayHoverPause: true,
        mouseDrag: true,
        margin: 30,
        center: true,
        dots: true,
        smartSpeed: 1000,
        navText: [
            "<i class='flaticon-left-arrow'></i>",
            "<i class='flaticon-right-arrow'></i>",
        ],
        responsive: {
            0: {
                items: 1,
            },
            576: {
                items: 1,
            },
            768: {
                items: 1,
            },
            992: {
                items: 3,
            },
            1200: {
                items: 3,
            },
        },
    }); 
    
    // Click Event JS
    $('.go-top').on('click', function() {
        $("html, body").animate({ scrollTop: "0" },  1800);
    });

    // FAQ Accordion JS
    $('.accordion').find('.accordion-title').on('click', function(){
        // Adds Active Class
        $(this).toggleClass('active');
        // Expand or Collapse This Panel
        $(this).next().slideToggle('fast');
        // Hide The Other Panels
        $('.accordion-content').not($(this).next()).slideUp('fast');
        // Removes Active Class From Other Titles
        $('.accordion-title').not($(this)).removeClass('active');       
    });

    // Accordion Widget
    $('.accordion-widget').find('.accordion-widget-title').on('click', function(){
        // Adds Active Class
        $(this).toggleClass('active');
        // Adds Open Class
        $('.accordion-widget-content').toggleClass('open');
        // Expand or Collapse This Panel
        $(this).next().slideToggle('800');
    });

    // Count Time JS
    function makeTimer() {
        var endTime = new Date("november  30, 2021 17:00:00 PDT");          
        var endTime = (Date.parse(endTime)) / 1000;
        var now = new Date();
        var now = (Date.parse(now) / 1000);
        var timeLeft = endTime - now;
        var days = Math.floor(timeLeft / 86400); 
        var hours = Math.floor((timeLeft - (days * 86400)) / 3600);
        var minutes = Math.floor((timeLeft - (days * 86400) - (hours * 3600 )) / 60);
        var seconds = Math.floor((timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60)));
        if (hours < "10") { hours = "0" + hours; }
        if (minutes < "10") { minutes = "0" + minutes; }
        if (seconds < "10") { seconds = "0" + seconds; }
        $("#days").html(days + "<span>Days</span>");
        $("#hours").html(hours + "<span>Hours</span>");
        $("#minutes").html(minutes + "<span>Minutes</span>");
        $("#seconds").html(seconds + "<span>Seconds</span>");
    }
    setInterval(function() { makeTimer(); }, 300);

    // Preloader
    jQuery(window).on('load', function() {
        $('.preloader').addClass('preloader-deactivate');
    })

    // Others Option For Responsive JS
    $(".others-option-for-responsive .dot-menu").on("click", function(){
        $(".others-option-for-responsive .container .container").toggleClass("active");
    });

    // WOW JS
    if($('.wow').length){
        var wow = new WOW({
            mobile: false
        });
        wow.init();
    }

    //skill JS
    jQuery('.skill-bar').each(function() {
        jQuery(this).find('.progress-content').animate({
        width:jQuery(this).attr('data-percentage')
        },2000);
        
        jQuery(this).find('.progress-number-mark').animate(
        {left:jQuery(this).attr('data-percentage')},
        {
            duration: 2000,
            step: function(now, fx) {
            var data = Math.round(now);
            jQuery(this).find('.percent').html(data + '%');
            }
        });  
    });

    // Range Slider JS
    $( "#range-slider").slider({
        range: true,
        min: 500,
        max: 10000,
        values: [500, 10000],
        slide: function( event, ui ) {
            $( "#price-amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        }
    });
    $( "#price-amount" ).val( "$" + $( "#range-slider" ).slider( "values", 0 ) +
    " - $" + $( "#range-slider" ).slider( "values", 1 ));

})(jQuery);



