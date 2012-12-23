<html>
<head>
    <title>woooha-list</title>
    <#assign woooha=JspTaglibs["/WEB-INF/tld/woooha-tags.tld"]>
    <link rel="stylesheet" href="<@s.url value="/css/music/packed_home.css"/>">
</head>
<body>
<div id="content">
    <div class="grid-16-8 clearfix">
        <div class="article">
            <div>
                <div id="song-chart" class="song-chart">
                    <div id="hold-panel" style="width: 590px;height: 99px;"></div>
                    <div id="player-panel" style="position: absolute; top:51px;">
                        <h2 class="tabs clearfix">
                        <div class="ll">本周热门单曲</div>
                        <a id="sc-tab-0" class="on" href="javascript:void(0)"><span>推荐</span></a>
                        <@s.iterator value="hotMusics.keys" status="hstat">
                            <a id="sc-tab-${hstat.index + 1}" href="javascript:void(0)"><span>${name}</span></a>
                        </@s.iterator>
                        <a href="#"><span>更多音乐</span></a>
                        </h2>
                        <div id="mainplayer" style="height: 64px;"></div>
                    </div>
                    <script type="text/javascript">
                        var fix_not_support = $.browser.msie && (eval(parseInt($.browser.version)) <= 6);
                        if (fix_not_support || $.browser.mozilla) {
                            $("#player-panel").css("top", $("#hold-panel").offset().top);
                        } else {
                            $("#player-panel").css("position", "");
                            $("#player-panel").css("top", "");
                            $("#hold-panel").remove();
                        }
                    </script>

                    <ul id="song-chart-0" class="chart-content" style="display: block;">
                    <@s.iterator value="recommendMusics">
                        <li class="clearfix songrow" data-url="<@woooha.Static resource="${playUrl}"/>" data-burl="<@woooha.Static resource="${playUrl}" outputBase64="true"/>"
                            data-sid="${id}" data-seconds="${seconds}">
                            <div class="play-icon stopped"></div>
                            <div class="play-count" style="display: block;">${playCount}次播放</div>
                            <div class="play-time" style="display: none;">-${secondsLabel}</div>
                            <a target="_blank" class="artist-name" href="http://site.douban.com/huguang/">
                                <img class="icon cover" src="<@woooha.Static resource="${cover}"/>">
                            </a>

                            <div class="name"><a href="javascript:void(0);">${title}</a></div>
                            <div class="artist">${(singer.name)?if_exists}</div>
                            <div style="line-height:10px;" class="clearfix"></div>
                        </li>
                    </@s.iterator>
                    </ul>
                    <@s.iterator value="hotMusics" var="musicsentry" status="hstat">
                    <ul id="song-chart-${hstat.index + 1}" class="chart-content" style="display: none;">
                        <@s.iterator value="#musicsentry.value">
                            <li class="clearfix songrow" data-url="<@woooha.Static resource="${playUrl}"/>" data-burl="<@woooha.Static resource="${playUrl}" outputBase64="true"/>"
                                data-sid="${id}" data-seconds="${seconds}">
                                <div class="play-icon stopped"></div>
                                <div class="play-count" style="display: block;">${playCount}次播放</div>
                                <div class="play-time" style="display: none;">-${secondsLabel}</div>

                                <a target="_blank" class="artist-name" href="http://site.douban.com/huguang/">
                                    <img class="icon cover" src="<@woooha.Static resource="${cover}"/>">
                                </a>

                                <div class="name"><a href="javascript:void(0);">${title}</a></div>
                                <div class="artist">${(singer.name)?if_exists}</div>
                                <div style="line-height:10px;" class="clearfix"></div>
                            </li>
                        </@s.iterator>
                    </ul>
                    </@s.iterator>
                </div>
            </div>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
            <p>11</p>
        </div>
        <div class="aside">
            <#include "/WEB-INF/pages/music/music-index-lyric.ftl">
        </div>
        <div class="extra"></div>
    </div>
</div>
<script type="text/javascript" src="<@s.url value="/js/swfobject.js"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/packed_audio_player.js"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/packed_playlist_widget.js"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/music/music-index.js"/>"></script>
<script type="text/javascript">
    $(function () {
//    $("#player-panel").css("top", $("#hold-panel").offset().top);
////    alert($("#hold-panel").offset().top);
//    var isPlayerFixed = 0, isLrcFixed = 0, $playerPanel = $("#player-panel"), playerTop = $playerPanel.offset().top,
//            $lrcPanel = $("#lrc-panel"), lrcTop = $lrcPanel.offset().top;
//    $(window).scroll(processScroll);
//    function processScroll() {
//        var scrollTop = $(window).scrollTop();
//        if (scrollTop >= playerTop/* && !isPlayerFixed*/) {
////            $playerPanel.css("position", "absolute");
//            $playerPanel.css("top", scrollTop);
////            isPlayerFixed = 1;
////            $playerPanel.addClass("player-fixed");
//        } else if (scrollTop <= playerTop/* && isPlayerFixed*/) {
//            $playerPanel.css("top", playerTop);
////            isPlayerFixed = 0;
////            $playerPanel.removeClass("player-fixed");
//        }
//        if (scrollTop >= lrcTop && !isLrcFixed) {
//            isLrcFixed = 1;
//            $lrcPanel.addClass("lrc-fixed");
//        } else if (scrollTop <= lrcTop && isLrcFixed) {
//            isLrcFixed = 0;
//            $lrcPanel.removeClass("lrc-fixed");
//        }
//    }
    $(".lrc-wrapper").scrollTop(0);
    $("#song-chart .tabs").delegate("a", "click", function (a) {
        if (this.id) {
            $("#song-chart .tabs a").removeClass("on");
            $(this).addClass("on");
            $("#song-chart .chart-content").hide();
            $("#song-chart-" + this.id.slice(-1)).show()
        }
    });

    var playcount = function (b, a) {
        if (!b) {
            return
        }
//        $.get("/j/artist/incplaycount", {
//            song_id:b,
//            worked:a ? 1 : 0
//        })
    };

    Song.config({lyrics_src:"http://site.douban.com/nanwu/widget/playlist/8577929/get_song_lyrics",
        comments_src:"http://site.douban.com/nanwu/widget/playlist/8577929/get_latest_song_comments",
        add_comment_src:"http://site.douban.com/nanwu/widget/playlist/8577929/add_song_comment",
        del_comment_src:"http://site.douban.com/nanwu/widget/playlist/8577929/delete_song_comment"
    });

    var widget = PlaylistWidget.findOrCreate(8577929);
    $(".songrow").each(function() {
        $this = $(this);
        var name = $this.find(".name").text();
        var cover = $this.find("img.cover").attr("src");
        var singer = $this.find(".artist").text();
        var song = Song.create($this.data("sid"), name, $this.data("burl"), $this.data("url"), false, cover, singer);
        widget.addSong(song);
    });

    var auto = false;
    var swfurl = ('/swf/~playlist_player.swf?ver=' + 53023).prependcontext(),
        params = {wmode:"transparent"},
        song_info = widget.getCurrentSong(),
        flashvars = {
            url:song_info.url,
            autoplay:(auto ? '1' : '0'),
            songid:song_info.id,
            isdemo:(song_info.isDemo ? '1' : '0'),
            descri:song_info.name,
            singer:song_info.singer,
            widgetid:'8577929',
            cover:song_info.cover
        },
        attributes = {
            id:"mplayer_8577929",
            name:"mplayer_8577929",
            "class":"mlplayer"
        };

    window.alll = function() {
        alert("ok");
    }
    swfobject.embedSWF(swfurl, "mainplayer", "580",
            "64", "9.0.0", "/swf/expressInstall.swf", flashvars, params, attributes);

    $(".listening-icon").click(function() {
//        alert($(".lrc-wrapper li.00\\:50").offset().top - $(".lrc-wrapper").offset().top - 125);
//        $(".lrc-wrapper").scrollTop(249);
    });

    window.changeTime = function(time) {
        if ($(".lrc-wrapper .no_lyric").length == 0) {
            var $loc_row, $prev_row, $cur_row, located = false;
            $(".lrc-wrapper li").each(function() {
                $prev_row = $cur_row;
                $cur_row = $(this);
                var tag = $cur_row.data("tag");
                if (time < tag) {
                    located = true;
                    return false;
                }
            });
            $loc_row = located ? $prev_row : $cur_row;
            if ($loc_row != null) {
                var $lrc_wrapper = $(".lrc-wrapper");
                var top = $loc_row.offset().top + $lrc_wrapper.scrollTop() - $(".lrc-wrapper").offset().top;
                if (top - 115 > 0) {
                    $(".lrc-wrapper").animate({scrollTop : top - 115}, 500);
                } else {
                    if ($lrc_wrapper.scrollTop() != 0) {
                        $(".lrc-wrapper").animate({scrollTop : 0}, 400);
                    }
                }
                $(".lrc-wrapper li.curr").removeClass("curr");
                $loc_row.addClass("curr");
            }
        }
    };

//    window.audio_player = new AudioPlayer();
//    var prog_handler = function (b) {
//        var a = audio_player.total_ms || b.total;
//        audio_player.time_txt.html("-" + audio_player.mmsstime(a - b.progress))
//    }, stop_audio = function (b) {
//        audio_player.pause();
//        var a = $("#song-chart li.now");
//        if (!a.length) {
//            return
//        }
//        if (b) {
//            playcount(a.data("sid"), true)
//        }
//        a.removeClass("now");
//        a.find(".play-icon").removeClass("playing").addClass("stopped");
//        a.find(".play-time").hide();
//        a.find(".play-count").show();
//        var c = a.find(".detail");
//        c.slideUp("fast")
//    }, play_audio = function (a) {
//        if (!audio_player.prepared) {
//            return
//        }
//        a.addClass("now");
//        a.find(".play-icon").removeClass("stopped").addClass("playing");
//        a.find(".detail").slideDown("fast");
//        a.find(".play-count").hide();
//        a.find(".play-time").show().html("00:00");
//        var b = parseInt(a.data("seconds"));
//        audio_player.total_ms = b ? b * 1000 : 0;
//        audio_player.time_txt = a.find(".play-time");
//        audio_player.play(a.data("url").prependIfNotStart("http://").replace(/%/g, "mp3"));
//        playcount(a.data("sid"), false)
//    };
//    audio_player.config({
//        on_progress:prog_handler,
//        on_end:function () {
//            stop_audio(true)
//        },
//        on_error:stop_audio,
//        on_prepared:function () {
//            audio_player.prepared = true
//        }
//    });
//    audio_player.init();
    $("#song-chart").delegate("li", "mouseenter",function () {
        $(this).addClass("hover_on")
    }).delegate("li", "mouseleave",function () {
        $(this).removeClass("hover_on")
    }).delegate("li", "click", function (a) {
        var index = widget.findSong($(this).data("sid"));
        if (index !== -1) {
            widget.setCurrentSong(index);
            playSong('8577929', widget.getCurrentSong());
        }
//
//
//                e.preventDefault();
//                var songId = $(this).parent('tr').attr('song_id'),
//                        index = widget.findSong(songId);
//                if (index !== -1) {
//                    widget.setCurrentSong(index);
//                    var song = widget.getCurrentSong();
//                    playSong('8577929', song);
//                }


//        var mplayer = $("#mplayer_8577929")[0];
//        if (mplayer !== undefined && mplayer.playsong !== undefined) {
//
//        }
//        if (a.target.className == "icon") {
//            return true
//        }
//        if (!$(this).hasClass("now")) {
//            stop_audio();
//            play_audio($(this))
//        } else {
//            stop_audio()
//        }
    });
    });
</script>
</body>
</html>