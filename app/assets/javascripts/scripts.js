

$(function(){

    $('.social-buttons').hide();

    $("#Sonifizer-Logo").hide();
    
    $("#Sonifizer-Logo").attr('src', "http://Sonifizer.com/sonifizer.png");

    setTimeout(function(){$('.social-buttons').fadeIn(1000);}, 1000);
    setTimeout(function(){$("#Sonifizer-Logo").fadeIn(1000);}, 1000);

});

