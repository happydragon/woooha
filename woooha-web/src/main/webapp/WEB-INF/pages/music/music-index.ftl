<html>
<head>
    <title>woooha-list</title>
    <link rel="stylesheet" href="<@s.url value="/css/music/packed_home.css"/>">
</head>
<body>
<div id="content">
    <div class="grid-16-8 clearfix">
        <div class="article">
            <div>
                <div id="song-chart" class="song-chart">
                    <h2 class="tabs clearfix">
                        <div class="ll">本周热门单曲</div>
                        <a id="sc-tab-0" class="on" href="javascript:void(0)"><span>最热</span></a>
                        <a id="sc-tab-1" href="javascript:void(0)"><span>摇滚</span></a>
                        <a id="sc-tab-2" href="javascript:void(0)"><span>民谣</span></a>
                        <a id="sc-tab-3" href="javascript:void(0)"><span>流行</span></a>
                        <a href="#"><span>更多</span></a>
                    </h2>
                    <ul id="song-chart-0" class="chart-content" style="display: block;">
                        <li class="clearfix" data-url="mr3.douban.com/201212171634/c1acfcbf83f3bcabe8fd1ba3401fbdf8/view/musician%/%/x13939426.%"
                            data-sid="314197" data-seconds="195">
                            <div class="play-icon stopped"></div>
                            <div class="play-count" style="display: block;">4862次播放</div>
                            <div class="play-time" style="display: none;">-03:14</div>
                            <a target="_blank" class="artist-name" href="http://site.douban.com/huguang/">
                                <img class="icon" src="<@s.url value="/img/todo/6b71c127d44bcbf.jpg"/>">
                            </a>

                            <div class="name"><a href="javascript:void(0);">鬼猫</a></div>
                            <div class="artist">湖光</div>
                            <div style="line-height:10px;" class="clearfix"></div>
                        </li>
                        <li class="clearfix" data-url="mr3.douban.com/201212171634/5f31677b9fd5d13abd08332d292eaff7/view/musician%/%/x13850595.%"
                            data-sid="314197" data-seconds="326">
                            <div class="play-icon stopped"></div>
                            <div class="play-count" style="display: block;">77685次播放</div>
                            <div class="play-time" style="display: none;">-05:25</div>
                            <a target="_blank" class="artist-name" href="http://site.douban.com/huguang/">
                                <img class="icon" src="<@s.url value="/img/todo/2144ad5967a38a6.jpg"/>">
                            </a>

                            <div class="name"><a href="javascript:void(0);">全世界最温暖的情歌RemixDewen Feat 拖鞋 （prod by T-Crash）</a></div>
                            <div class="artist">Jazzilipper~性感的拖鞋</div>
                            <div style="line-height:10px;" class="clearfix"></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="aside">

        </div>
        <div class="extra"></div>
    </div>
</div>
<script type="text/javascript" src="<@s.url value="/js/swfobject.js"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/packed_audio_player.js"/>"></script>
<script type="text/javascript" src="<@s.url value="/js/music/music-index.js"/>"></script>
<script type="text/javascript">
    var playcount = function (b, a) {
        if (!b) {
            return
        }
//        $.get("/j/artist/incplaycount", {
//            song_id:b,
//            worked:a ? 1 : 0
//        })
    };
    $("#song-chart .tabs").delegate("a", "click", function (a) {
        if (this.id) {
            $("#song-chart .tabs a").removeClass("on");
            $(this).addClass("on");
            $("#song-chart .chart-content").hide();
            $("#song-chart-" + this.id.slice(-1)).show()
        }
    });
    window.audio_player = new AudioPlayer();
    var prog_handler = function (b) {
        var a = audio_player.total_ms || b.total;
        audio_player.time_txt.html("-" + audio_player.mmsstime(a - b.progress))
    }, stop_audio = function (b) {
        audio_player.pause();
        var a = $("#song-chart li.now");
        if (!a.length) {
            return
        }
        if (b) {
            playcount(a.data("sid"), true)
        }
        a.removeClass("now");
        a.find(".play-icon").removeClass("playing").addClass("stopped");
        a.find(".play-time").hide();
        a.find(".play-count").show();
        var c = a.find(".detail");
        c.slideUp("fast")
    }, play_audio = function (a) {
        if (!audio_player.prepared) {
            return
        }
        a.addClass("now");
        a.find(".play-icon").removeClass("stopped").addClass("playing");
        a.find(".detail").slideDown("fast");
        a.find(".play-count").hide();
        a.find(".play-time").show().html("00:00");
        var b = parseInt(a.data("seconds"));
        audio_player.total_ms = b ? b * 1000 : 0;
        audio_player.time_txt = a.find(".play-time");
        audio_player.play("http://" + a.data("url").replace(/%/g, "mp3"));
//        audio_player.play("/upload/music/wodegeshengli.mp3".prependcontext());
        playcount(a.data("sid"), false)
    };
    audio_player.config({
        on_progress:prog_handler,
        on_end:function () {
            stop_audio(true)
        },
        on_error:stop_audio,
        on_prepared:function () {
            audio_player.prepared = true
        }
    });
    audio_player.init();
    $("#song-chart").delegate("li", "mouseenter",function () {
        $(this).addClass("hover_on")
    }).delegate("li", "mouseleave",function () {
        $(this).removeClass("hover_on")
    }).delegate("li", "click", function (a) {
        if (a.target.className == "icon") {
            return true
        }
        if (!$(this).hasClass("now")) {
            stop_audio();
            play_audio($(this))
        } else {
            stop_audio()
        }
    });
</script>
</body>
</html>