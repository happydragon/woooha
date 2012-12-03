$(function () {
    bind_cmp_events();
});

function bind_cmp_events() {
    $("#stars .a_show_login").hover(function() {
        $(this).prevAll(".a_show_login").add(this).find("img").attr("src", "/img/video/sth.gif".prependcontext());
        $("#rateword").text($(this).attr("data-label"));
    }, function() {
        $("#stars img").attr("src", "/img/video/nst.gif".prependcontext());
        $("#rateword").text("");
    });

    $(".toggle-reply").click(function() {
        $(this).siblings(".short").hide();
        $(this).siblings(".all").show();
        $(this).hide();
        return false;
    });
}