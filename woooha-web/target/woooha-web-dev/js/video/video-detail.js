$(function () {
    bind_cmp_events();
});

function bind_cmp_events() {
    bind_score_cmp_events();
    bind_comment_cmp_events();

    $("#add-comment-btn").click(function() {
        var $content = $("#comment_content");
        var content = $content.val();
        if (validateComment(content)) {
            $.ajax("/video/addCommentAjax.vhtml".prependcontext(), {
                data : $.param({
                    "id" : $("#videoid").val(),
                    "comment.content" : content
                }, true),
                dataType:"html",
                success: function(result) {
                    renderCommentPaginater(result);
                    $content.val("");
                }
            });
        }
    });
}

function bind_score_cmp_events() {
    $("#stars .a_show_login").hover(function() {
        $(this).prevAll(".a_show_login").add(this).find("img").attr("src", "/img/video/sth.gif".prependcontext());
        $("#rateword").text($(this).attr("data-label"));
    }, function() {
        $("#stars img").each(function() {$(this).attr("src", $(this).attr("data-src"));});
        $("#rateword").text("");
    });

    $("#stars .a_show_login").click(function() {
        var score = $(this).attr("data-score");
        $.ajax("/video/makeScoreAjax.vhtml".prependcontext(), {
            data : $.param({
                "id" : $("#videoid").val(),
                "score" : score
            }, true),
            dataType:"html",
            success: function(result) {
                $("#score_container").html(result);
                bind_score_cmp_events();
            }
        });
        return false;
    });

    $("a.lnk-sharing").click(function() {
        $.ajax("/video/recommendAjax.vhtml".prependcontext(), {
            data : $.param({
                "id" : $("#videoid").val(),
                "recommend" : $(this).attr("data-to-recommend")
            }, true),
            dataType:"html",
            success: function(result) {
                $("#score_container").html(result);
                bind_score_cmp_events();
            }
        });
        return false;
    });
}

function bind_comment_cmp_events() {
    $(".toggle-reply").click(function() {
        $(this).siblings(".short").hide();
        $(this).siblings(".all").show();
        $(this).hide();
        return false;
    });
}

function validateComment(comment) {
    clearCommentError();
    if (comment.isBlank()) {
        return false;
    }
    if (comment.length > 200) {
        setCommentError("字数不能超过200字.");
        return false;
    }
    return true;
}

function clearCommentError() {
    setCommentError("");
}

function setCommentError(msg) {
    $("#comment-err").text(msg);
}

function jump2page(pageNo, this_) {
    $.ajax("/video/videoCommentsAjax.vhtml".prependcontext(), {
        data : $.param({
            "id" : $("#videoid").val(),
            "commentPaginater.pageNumber" : pageNo
        }, true),
        dataType:"html",
        success: function(result) {
            renderCommentPaginater(result);
        }
    });
}

function renderCommentPaginater(result) {
    $("#comments_container").html(result);
    bind_comment_cmp_events();
    var pos = $("#commentLocation").offset().top;//获取该点到头部的距离
    $("html,body").animate({scrollTop : pos}, 100);
}