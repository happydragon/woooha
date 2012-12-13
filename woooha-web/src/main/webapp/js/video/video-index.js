var auto_slide_timeout;

$(function () {
    bind_cmp_events();
    start_auto_slide();
});

function bind_cmp_events() {
    $(".toggle-reply").click(function() {
        $(this).siblings(".short").hide();
        $(this).siblings(".all").show();
        $(this).hide();
        return false;
    });

    $(".btn-prev").click(function() {
        if (!$(this).hasClass("btn-disabled")) {slide2left();}
    });
    $(".btn-next").click(function() {
        if (!$(this).hasClass("btn-disabled")) {slide2right();}
    });

    $("#slide-plane").hover(function() {
        stop_auto_slide();
    }, function() {
        start_auto_slide();
    });

//    $(".ui-slide-item img").hover(function(event) {
//        _showtip = setTimeout(function() {
//            $("#subject-tip").remove();
//            var h = $(event.target), g = h.parents(".ui-slide-item").data(), j = $("#db-tmpl-subject-tip").tmpl(g), i = h.offset(), e = h.width();
//            j.addClass("screening-tip");
//            j.css({left:i.left + h.width() + 8, top:i.top}).appendTo($("body")).show();
//        }, 400);
//    }, function(event) {
//        clearTimeout(_showtip);
//        $("#subject-tip").remove();
//    });
//    $(document).unbind("click.removeTip").bind("click.removeTip", function(event) {
//        if (!$(event.target).parents("#subject-tip").length) {
//            $("#subject-tip").remove();
//        }
//    });
}

function slide2left() {
    stop_auto_slide();
    var left = parseInt($(".ui-slide-content").attr("data-left"));
    var newLeft = left + 608;
    var newIndex = changeSlideIndex(-1);
    updateSlideBtnStatus(newIndex);
    $(".ui-slide-content").attr("data-left", newLeft);
    $(".ui-slide-content").animate({left : newLeft + "px"}, 700);
    start_auto_slide();
}

function slide2right() {
    stop_auto_slide();
    var index = parseInt($(".ui-slide-index").text());
    if (index < 6) {
        var left = parseInt($(".ui-slide-content").attr("data-left"));
        var newLeft = left - 608;
        var newIndex = changeSlideIndex(1);
        updateSlideBtnStatus(newIndex);
        $(".ui-slide-content").attr("data-left", newLeft);
        $(".ui-slide-content").animate({left : newLeft + "px"}, 700);
    } else {
        var left = parseInt($(".ui-slide-content").attr("data-left"));
        var newLeft = left - 250;
        $(".ui-slide-content").animate({left : newLeft + "px"}, 150, function() {
            $(".ui-slide-content").attr("data-left", 0).css("left", "578px").animate({left : "0px"}, 550);
            $(".ui-slide-index").text(1);
            $(".btn-prev").addClass("btn-disabled");
        });
    }
    start_auto_slide();
}

function start_auto_slide() {
    auto_slide_timeout = setTimeout(slide2right, 20000);
}

function stop_auto_slide() {
    if (auto_slide_timeout) {clearTimeout(auto_slide_timeout);}
}

function changeSlideIndex(increment) {
    var index = parseInt($(".ui-slide-index").text());
    var newIndex = index + (increment);
    $(".ui-slide-index").text(newIndex);
    return newIndex;
}

function updateSlideBtnStatus(index) {
    if (index <= 0) {
        $(".btn-prev").addClass("btn-disabled");
    } else {
        $(".btn-prev").removeClass("btn-disabled");
    }
}

