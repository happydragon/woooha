$(function () {
    bind_cmp_events();


});

function bind_cmp_events() {
    bind_scroll_event();
}

function bind_scroll_event() {
    var isPlayerFixed = 0, isLrcFixed = 0, $playerPanel = $("#player-panel"), playerTop = $playerPanel.offset().top,
        $lrcPanel = $("#lrc-panel"), lrcTop = $lrcPanel.offset().top;
    function processScroll() {
        var scrollTop = $(window).scrollTop();
        if (fix_not_support || $.browser.mozilla) {
            if (scrollTop >= playerTop) {
                $playerPanel.css("top", scrollTop);
            } else {
                $playerPanel.css("top", playerTop);
            }
        } else {
            if (scrollTop >= playerTop && !isPlayerFixed) {
                isPlayerFixed = 1;
                $playerPanel.addClass("player-fixed");
            } else if (scrollTop <= playerTop && isPlayerFixed) {
                isPlayerFixed = 0;
                $playerPanel.removeClass("player-fixed");
            }
        }
        if (fix_not_support) {
            if (scrollTop >= lrcTop) {
                $lrcPanel.css("top", scrollTop);
            } else {
                $lrcPanel.css("top", lrcTop);
            }
        } else {
            if (scrollTop >= lrcTop && !isLrcFixed) {
                isLrcFixed = 1;
                $lrcPanel.addClass("lrc-fixed");
            } else if (scrollTop <= lrcTop && isLrcFixed) {
                isLrcFixed = 0;
                $lrcPanel.removeClass("lrc-fixed");
            }
        }
    }
    $(window).scroll(processScroll);
}


Do.add('playlist', {path:'http://img3.douban.com/js/music/packed_playlist_widget2046866548.js', type:'js'});
Do('common', 'swf', 'playlist', function () {
    Song.config({lyrics_src:"http://site.douban.com/nanwu/widget/playlist/8577929/get_song_lyrics",
        comments_src:"http://site.douban.com/nanwu/widget/playlist/8577929/get_latest_song_comments",
        add_comment_src:"http://site.douban.com/nanwu/widget/playlist/8577929/add_song_comment",
        del_comment_src:"http://site.douban.com/nanwu/widget/playlist/8577929/delete_song_comment"
    });
    var widget = PlaylistWidget.findOrCreate(8577929),
        song_records = [
            {"name":"第二张全新专辑同名主打歌-《我是你的大猩猩》", "url":"aHR0cDovL21yNC5kb3ViYW4uY29tLzIwMTIxMjE4MjE0NS8zZTMxNDFhMTZkM2E3NGQ4ZTZiODE4Y2M4ZmZkYWFhOS92aWV3L211c2ljaWFubXAzL21wMy94MTMxNTE0NzIubXAz", "cover":"http:\/\/img3.douban.com\/view\/site\/small\/public\/30413ae5d1b9e60.jpg", "isDemo":false, "rawUrl":"http:\/\/mr4.douban.com\/201212182145\/3e3141a16d3a74d8e6b818cc8ffdaaa9\/view\/musicianmp3\/mp3\/x13151472.mp3", "id":"247795"},
            {"name":"轮回（第二张全新专辑收录）", "url":"aHR0cDovL21yMy5kb3ViYW4uY29tLzIwMTIxMjE4MjE0NS9kMjk3NmI3YzIwYTE5NjUyNGVhM2U4NjQyOTBiMzk3ZS92aWV3L211c2ljaWFubXAzL21wMy94MTM5MTg3MjgubXAz", "cover":"http:\/\/img3.douban.com\/view\/site\/small\/public\/30413ae5d1b9e60.jpg", "isDemo":false, "rawUrl":"http:\/\/mr3.douban.com\/201212182145\/d2976b7c20a196524ea3e864290b397e\/view\/musicianmp3\/mp3\/x13918728.mp3", "id":"312447"},
            {"name":"不知道（第二张全新专辑收录）", "url":"aHR0cDovL21yNC5kb3ViYW4uY29tLzIwMTIxMjE4MjE0NS9mODczYTM3MDZiM2EyMWNhMWM5NDE4MTkwMzgwODEyZC92aWV3L211c2ljaWFubXAzL21wMy94MTM5MTg3MTIubXAz", "cover":"http:\/\/img3.douban.com\/view\/site\/small\/public\/30413ae5d1b9e60.jpg", "isDemo":false, "rawUrl":"http:\/\/mr4.douban.com\/201212182145\/f873a3706b3a21ca1c9418190380812d\/view\/musicianmp3\/mp3\/x13918712.mp3", "id":"312446"},
            {"name":"两只小花狗（第二张全新专辑收录）", "url":"aHR0cDovL21yMy5kb3ViYW4uY29tLzIwMTIxMjE4MjE0NS8xM2E3MjVmYWY3ZGEwNzBiNGJlNzBiMjQyNDE2MDg1ZS92aWV3L211c2ljaWFubXAzL21wMy94MTM5MTkxODcubXAz", "cover":"http:\/\/img3.douban.com\/view\/site\/small\/public\/30413ae5d1b9e60.jpg", "isDemo":false, "rawUrl":"http:\/\/mr3.douban.com\/201212182145\/13a725faf7da070b4be70b242416085e\/view\/musicianmp3\/mp3\/x13919187.mp3", "id":"312487"}
        ];
    $(song_records).each(function () {
        var song = Song.create(this.id, this.name, this.url, this.rawUrl,
            this.isDemo, this.cover);
        widget.addSong(song);
    });

    var auto = false;

    if (playSong.default_play === undefined) {
        var default_play = paras(location.href)['s'],
            index = default_play ? widget.findSong(default_play) : -1;
        if (index != -1) {
            playSong.default_play = default_play;
            auto = true;
            widget.setCurrentSong(index);
        }
    }

    var swfurl = '/swf/playlist_player.swf?ver=' + 53023,
        params = {wmode:"transparent"},
        song_info = widget.getCurrentSong(),
        flashvars = {
            url:song_info.url,
            autoplay:(auto ? '1' : '0'),
            songid:song_info.id,
            isdemo:(song_info.isDemo ? '1' : '0'),
            descri:song_info.name,
            widgetid:'8577929',
            cover:song_info.cover
        },
        attributes = {
            id:"mplayer_8577929",
            name:"mplayer_8577929",
            "class":"playlist_player"
        };
    swfobject.embedSWF(swfurl, "mainplayer_8577929", "580",
        "64", "9.0.0", "/swf/expressInstall.swf", flashvars, params, attributes);
    if (auto) {
        $('.tr' + song_info.id, '.table_' + 8577929).addClass('selsong');
    }

    $('.table_8577929').delegate('td.title', "click", function (e) {
        e.preventDefault();
        var songId = $(this).parent('tr').attr('song_id'),
            index = widget.findSong(songId);
        if (index !== -1) {
            widget.setCurrentSong(index);
            var song = widget.getCurrentSong();
            playSong('8577929', song);
        }
    });

    if (!(window.PLAYLIST && window.PLAYLIST.initialized)) {
        window.PLAYLIST = {};
        window.PLAYLIST.initialized = true;

        var LYRICS_TMPL = $.template(null, $("#lyrics_tmpl").html()),
            SHARE_LINKS_TMPL = $.template(null, $("#share_links_tmpl").html()),
            COMMENTS_TMPL = $.template(null, $("#comments_tmpl").html()),
            CONMENT_LI_TMPL = $.template(null, $("#comment_li_tmpl").html()),
            $root = $("div.playlist");

        $root.delegate("tbody tr:not(.expansion)", "hover", function () {
            $(this).toggleClass('hoverSong');
        });

        $root.delegate("td.clickable", "hover", function () {
            $(".icon_btn", this).toggleClass('hover');
        });

        $("td.lyrics.clickable", $root).click(
            function (e) {
                e.preventDefault();
                var el = $(this),
                    container = el.closest('tr'),
                    expansion = container.next('.expansion');
                if (!expansion.length || !expansion.find('td').hasClass('lyrics_container')) {
                    if (expansion.length) {
                        expansion.remove();
                    }
                    if (!el.data("loading")) {
                        el.data("loading", true);
                        var song_id = container.attr('song_id'),
                            song = Song.getSong(song_id);
                        song.getLyrics(
                            function (res) {
                                if (res.status === 0) {
                                    el.data("loading", false);
                                    var content = $($.tmpl(LYRICS_TMPL, {lyrics:res.lyrics}));
                                    content.hide().insertAfter(container).fadeIn('slow');
                                } else {
                                    alert(res.msg);
                                }
                            }
                        );
                    }
                } else {
                    expansion.remove();
                }
            }
        );

        $root.delegate("td.download.clickable", "click", function (e) {
            var el = $(this),
                btn = el.find('.icon_btn'),
                link = btn.attr('href');
            if (link) {
                return true;
            } else {
                Douban.init_show_login();
                return false;
            }
        });

        $("td.share", $root).hover(function (e) {
            var el = $(this),
                shareBlock = $("#share-song", $root);

            if (!shareBlock.length) {
                shareBlock = $($.tmpl(SHARE_LINKS_TMPL));
                shareBlock.hide().appendTo($root);
                $root.delegate("#share-song .sina", "click", function (e) {
                    e.preventDefault();
                    $(this).shareToSina();
                });
            }
            var song_id = el.closest('tr').attr('song_id'),
                song = Song.getSong(song_id),
                doubanLink = shareBlock.find('.douban a'),
                sinaLink = shareBlock.find('.sina');
            doubanLink.data('share-id', song.id)
                .data('name', song.name)
                .data('href', song.rawUrl)
                .data('desc', "http://site.douban.com/nanwu/?s=" + song.id)
                .data('music', song.url)
                .data('target_type', "rec")
                .data('target_action', 0)
                .data('object_kind', "2005")
                .data('object_id', song.id)
                .data('action_props', {"site_title":"南无",
                    "song_url":"http://site.douban.com/nanwu/?s=" + song.id,
                    "song_title":song.name});
            sinaLink.attr("sina-content",
                '推荐: 豆瓣音乐·音乐人' + "南无" + '的歌曲 ' + song.name)
                .attr("sina-url", 'http://site.douban.com/nanwu/?s=' + song.id);

            var offset = el.offset(),
                width = el.width(),
                height = el.height()
            t = shareBlock.data('fadeTimeout');
            if (t) {
                clearTimeout(t);
            }
            shareBlock.css({top:(offset.top + height / 2 - 12) + "px",
                left:(offset.left + width - 24) + "px"}).fadeIn();
        }, function (e) {
            var el = $(this),
                shareBlock = $("#share-song", $root),
                t = setTimeout(function () {
                    shareBlock.fadeOut();
                }, 300);
            shareBlock.data('fadeTimeout', t);
        });

        $root.delegate("td.comment.clickable", "click", function () {
            var el = $(this),
                container = el.closest('tr'),
                expansion = container.next('.expansion');
            if (!expansion.length || !expansion.find('td').hasClass('comment_container')) {
                if (expansion.length) {
                    // 找到的expansion不是对应评论的, 先把它删掉
                    expansion.remove();
                }
                if (!el.data("loading")) {
                    var song_id = container.attr('song_id'),
                        song = Song.getSong(song_id);
                    el.data('loading', true);
                    song.getComments(
                        function (res) {
                            if (res.status === 0) {
                                el.data('loading', false);
                                var content = $($.tmpl(COMMENTS_TMPL, {comments:res.comments}));
                                content.hide().insertAfter(container).fadeIn('slow');
                            } else {
                                alert(res.msg);
                            }
                        }
                    );
                }
            } else {
                expansion.remove();
            }
        });

        $root.delegate("#share-song", "mouseover",function (e) {
            var el = $(this),
                t = el.data('fadeTimeout');
            if (t) {
                clearTimeout(t);
            }
        }).delegate("#share-song", "mouseleave", function (e) {
                var t = setTimeout(function () {
                    $("#share-song").fadeOut();
                }, 300);
                $("#share-song").data('fadeTimeout', t);
            });

        $root.delegate(".comment_wrapper textarea.mini", "click", function (e) {
            var el = $(this),
                btn = el.next('span.bn-flat');
            el.removeClass('mini');
            btn.removeClass('hidden');
        });

        $root.delegate(".comment_wrapper .bn-flat", "click", function (e) {
            e.preventDefault();
            var el = $(this),
                textarea = el.prev('textarea'),
                comment = textarea.val(),
                song_id = el.closest('tr').prev('tr').attr('song_id'),
                song = Song.getSong(song_id);
            song.addComment(comment,
                function (res) {
                    var comment = res.comment,
                        li = $.tmpl(CONMENT_LI_TMPL, {comments:[comment]}),
                        list = el.closest('form').next('ul.comments');
                    list.find(".no-comment").remove();
                    li.prependTo(list);
                    textarea.val('');
                },
                function (res) {
                    alert(res.msg);
                });
        });


        var commentSongId = paras(location.href)['c'];
        if (commentSongId) {
            commentSongId = commentSongId.split('#')[0];
            $('tr[song_id=' + commentSongId + '] td.comment.clickable').click();
        }
    }
});
