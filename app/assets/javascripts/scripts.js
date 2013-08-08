

$(function(){

    $('.social-buttons').hide();

    $("#Sonifizer-Logo").hide();

    $("#Sonifizer-Logo").attr('src', "http://Sonifizer.com/sonifizer.png");

    setTimeout(function(){$('.social-buttons').fadeIn(1000);}, 1000);
    setTimeout(function(){$("#Sonifizer-Logo").fadeIn(1000);}, 1000);



    $("#Sonifizer-Logo").on('mouseenter', function(){
        console.log('Sonifizer converts data into sound.')
        Sonifizer_array([01010011, 
                         01101111,
                         01101110,
                         01101001,
                         01100110,
                         01101001,
                         01111010,
                         01100101,
                         01110010,
                         00100000,
                         01100011,
                         01101111,
                         01101110,
                         01110110,
                         01100101,
                         01110010,
                         01110100,
                         01110011,
                         00100000,
                         01100100,
                         01100001,
                         01110100,
                         01100001,
                         00100000,
                         01101001,
                         01101110,
                         01110100,
                         01101111,
                         00100000,
                         01110011,
                         01101111,
                         01110101,
                         01101110,
                         01100100,
                         00101110], Sonifizer_Play, 1);
    });

});

