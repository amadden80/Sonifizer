// Sonifizer
//  by Andrew Madden
 
var Sonifizer_Base_URL = "http://www.Sonifizer.com";


// ******* URL API *******

// Current TYPE supported: string

// var Sonifizer_Response_TYPE = "";

// Sonifizer_Response_TYPE starts as an empty string
// Calling any version of Sonifizer_TYPE, this variable will contain audio data
// You can set Sonifizer_Response_TYPE as the src of any audio tag or call: Sonifizer_Play(Sonifizer_Response_TYPE)
 
// Sonifizer_TYPE(variable_of_TYPE)
//  ... will load the converted audio into the variable Sonifizer_Response_TYPE

// Sonifizer_TYPE(variable_of_TYPE, callback)
//  ... will load the converted audio into the variable Sonifizer_Response_TYPE
//  ... and in 1000 milliseconds run the callback function on Sonifizer_Response_TYPE

// Sonifizer_TYPE(variable_of_TYPE, callback, delay)
//  ... will load the converted audio into the variable Sonifizer_Response_TYPE
//  ... and in delay milliseconds run the callback function on Sonifizer_Response_TYPE


//  Example Call:  Sonifizer_TYPE('A_STRING_TO_LISTEN_TO', Sonifizer_Play, 1000)


var Sonifizer_Response_string = "";
  
function Sonifizer_string(string, Sonifizer_Play, delay){

    var _body = document.getElementsByTagName('body') [0];
    var Sonifizer_Script = document.createElement('script');
    Sonifizer_Script.type = "application/javascript";
    Sonifizer_Script.src = Sonifizer_Base_URL+"/api/string/"+ string +"/json";
    _body.appendChild(Sonifizer_Script);

    var callback_function = callback || function(response){};
    var callback_delay = delay || 1000;
    setTimeout(function(){
        callback_function(Sonifizer_Response_string);
    }, callback_delay);

}

// ******* Non-URL API *******

// Current TYPE supported: array

// Sonifizer_Response_TYPE starts as an empty string
// Calling any version of Sonifizer_TYPE, this variable will contain audio data
// You can set Sonifizer_Response_TYPE as the scr of any audio tag or call: Sonifizer_Play(Sonifizer_Response_TYPE)
 
// Sonifizer_TYPE(variable_of_TYPE)
//  ... will load the converted audio into the variable Sonifizer_Response_TYPE

// Sonifizer_TYPE(variable_of_TYPE, callback)
//  ... will load the converted audio into the variable Sonifizer_Response_TYPE
//      ... and when successful, run the callback function on Sonifizer_Response_TYPE

// Sonifizer_TYPE(variable_of_TYPE, callback, seconds)
//  ... will load the converted audio into the variable Sonifizer_Response_TYPE
//  ... it will return seconds of audio
//      ... and when successful, run the callback function on Sonifizer_Response_TYPE



//  Example Call:  Sonifizer_TYPE(variable_of_TYPE, Sonifizer_Play, 1)


var Sonifizer_Response_array = "";

function Sonifizer_array(data_array, callback, seconds){
    var callback_function = callback || function(response){};
    var audio_seconds = seconds || 1;
    var url = Sonifizer_Base_URL+"/api/array";
    $.post(url, {data: data_array, seconds: audio_seconds},
    function(data){
                callback_function(Sonifizer_Response_array);
            });
}


// ******* Helpers *******

// Create and autoplays an <audio> node with a Base64 audio src
function Sonifizer_Play(Audio_Data_Base_64){
    var _body = document.getElementsByTagName('body') [0];
    var Sonifizer_audio = document.createElement('audio');
    Sonifizer_audio.controls = false;
    Sonifizer_audio.autoplay = true;
    var Sonifizer_source = document.createElement('source');
    Sonifizer_source.src = Audio_Data_Base_64;
    Sonifizer_audio.appendChild(Sonifizer_source);
    _body.appendChild(Sonifizer_audio);
}


