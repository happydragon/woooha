<script type="text/javascript">
    var urlmap = "${video.url}".toMap("||||", "=");
    var params = {allowfullscreen : "true", allowscriptaccess : "always", quality : "high", wmode : "opaque"};
    swfobject.embedSWF("http://static.youku.com/v1.0.0287/v/swf/loader.swf", "videoPlayer", "${video.width!588}", "${video.height!480}", "9.0.0", "expressInstall.swf",
            urlmap, params, {id : "playerObject"});
</script>
