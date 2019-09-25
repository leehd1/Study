$(document).ready(function() {
        $('.hideme').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            if( bottom_of_window > bottom_of_object/2 ){
                $(this).animate({'opacity':'1'},500);
            }
        }); 
    
});
$(document).ready(function() {
    $(window).scroll( function(){
    	$('.hidemm').each( function(i){
    		var el = $(this);
            var bottom_of_object = ($(this).offset().top + $(this).outerHeight())*4/7;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            if( bottom_of_window > bottom_of_object ){
            	el.addClass('fadeInUp animated');
            }
        });   
    });
});

$(document).ready(function() {
    $(window).scroll(function(){
    	$('.hhh').each( function(i){
            var bottom_of_object = ($(this).offset().top + $(this).outerHeight())*0.9;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            if( bottom_of_window > bottom_of_object ){
            $(this).animate({'opacity':'1'},1000);
            }
        });   
    });
});


window.onload = function () {
    var elm = ".box";
    $(elm).each(function (index) {   	
        // 개별적으로 Wheel 이벤트 적용
        $(this).on("mousewheel DOMMouseScroll", function (e) {
            e.preventDefault();
            var delta = 0;
            if (!event) event = window.event;
            if (event.wheelDelta) {
                delta = event.wheelDelta / 120;
                if (window.opera) delta = -delta;
            } 
            else if (event.detail)
                delta = -event.detail / 3;
            var moveTop = $(window).scrollTop();
            var elmSelecter = $(elm).eq(index);
            
            // 마우스휠을 위에서 아래로
            if (delta < 0) {
                if ($(elmSelecter).next() != undefined) {
                    try{                    	
                        moveTop = $(elmSelecter).next().offset().top;
                    }catch(e){}
                }
            // 마우스휠을 아래에서 위로
            } else {
                if ($(elmSelecter).prev() != undefined) {
                    try{
                        moveTop = $(elmSelecter).prev().offset().top;
                    }catch(e){}
                }
            }                     
            // 화면 이동 0.8초(800)
            $("html,body").stop().animate({
                scrollTop: moveTop + 'px'
            }, {
                duration: 1000, complete: function () {
                }
            });
            
        });        
    });
}


