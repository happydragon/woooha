var AudioPlayer = function () {
    this.id = "" + parseInt(Math.random() * 10000, 10);
    this.prepared = false
};
AudioPlayer.prototype.config = function (b) {
    var a = this;
    var c = function () {
    };
    window["on_progress_" + this.id] = b.on_progress || c;
    window["on_end_" + this.id] = b.on_end || c;
    window["on_error_" + this.id] = b.on_error || c;
    window["on_prepared_" + this.id] = function () {
        a.prepared = true;
        a.player = document.getElementById("minplayer" + a.id);
        if (b.on_prepared) {
            b.on_prepared()
        }
    };
    return a
};
AudioPlayer.prototype.init_with_html5 = function (b) {
    var c = this;
    var d = "minplayer" + c.id;
    b.id = b.name = d;
    b._play = function (a) {
        b.src = a;
        b.load();
        b.play()
    };
    b._pause = b.pause;
    b._resume = b.play;
    b.addEventListener("ended", window["on_end_" + c.id]);
    b.addEventListener("error", window["on_error_" + c.id]);
    b.addEventListener("timeupdate", function () {
        (window["on_progress_" + c.id])({total:1000 * (b.duration && (b.duration !== Infinity) ? b.duration : 0), progress:1000 * (b.currentTime || 0)})
    });
    document.body.appendChild(b);
    (window["on_prepared_" + c.id])()
};
AudioPlayer.prototype.init_with_flash = function () {
    var b = "/swf/minplayer.swf".prependcontext();
    var d = "minplayer" + this.id;
    var a = {onprogress:"on_progress_" + this.id, onend:"on_end_" + this.id, onerror:"on_error_" + this.id, onprepared:"on_prepared_" + this.id};
    var e = {};
    var c = {id:d, name:d};
    var f = document.createElement("div");
    f.id = d;
    f.name = d;
    setTimeout(function () {
        document.body.appendChild(f);
        swfobject.embedSWF(b, d, "1", "1", "8.0.0", "", a, e, c)
    }, 0)
};
AudioPlayer.prototype.init = function () {
    var c = swfobject.getFlashPlayerVersion();
    if (c.major > 7) {
        this.init_with_flash()
    } else {
        var b = document.createElement("audio");
        if (!!(b.canPlayType && b.canPlayType("audio/mpeg;").replace(/no/, ""))) {
            this.init_with_html5(b)
        }
    }
    return this
};
AudioPlayer.prototype.play = function (a) {
    if (this.prepared) {
        this.player._play(a)
    }
};
AudioPlayer.prototype.pause = function () {
    if (this.prepared) {
        this.player._pause()
    }
};
AudioPlayer.prototype.resume = function () {
    if (this.prepared) {
        this.player._resume()
    }
};
AudioPlayer.prototype.mmsstime = function (a) {
    var c = parseInt(a / 1000, 10), d = parseInt(c / 60, 10), b = c - d * 60;
    d = d < 0 ? "00" : d < 10 ? "0" + d : d;
    b = b < 0 ? "00" : b < 10 ? "0" + b : b;
    return d + ":" + b
};