<div class="sns-bar-fav">
    <div class="rec-sec">
        <span>
            <@s.if test="recommended">
                <a href="#" class="j a_show_login lnk-sharing" data-to-recommend="false">取消推荐</a>
            </@s.if>
            <@s.else>
                <a href="#" class="j a_show_login lnk-sharing" data-to-recommend="true">推荐</a>
            </@s.else>
        </span>
        <span class="rec-num">${video.recommendCount}人推荐</span>
    </div>
</div>

<div class="sns-bar-rec">
    <!--
    <span id="Photo-1784781807">
        <a href="#" data-url="http://www.douban.com/photos/photo/1784781807/" data-desc=""
           data-title="booolala"
           data-pic="http://img3.douban.com/view/photo/photo/public/p1784781807.jpg"
           class="bn-sharing">分享到</a> &nbsp;&nbsp;
    </span>
    -->
    <div id="interest_sectl2">
        <div class="rating_wrap clearbox" rel="v:rating">
            <p class="rating_self clearfix" typeof="v:Rating">
                <span class="ll bigstar${video.userStar}"></span>
                <strong class="ll rating_num" property="v:average">${video.userScore?string('0.0')}</strong>
                <span class="ll commentcount">(${video.userScoreCount}人评分)</span>
            </p>
            <span class="stars5 starstop" title="力荐"></span><div class="power" style="width:${scoreStatsMap["10"].percentage}px"></div>${scoreStatsMap["10"].percentage?string('0.0')}%<br>
            <span class="stars4 starstop" title="推荐"></span><div class="power" style="width:${scoreStatsMap["8"].percentage}px"></div>${scoreStatsMap["8"].percentage?string('0.0')}%<br>
            <span class="stars3 starstop" title="还行"></span><div class="power" style="width:${scoreStatsMap["6"].percentage}px"></div>${scoreStatsMap["6"].percentage?string('0.0')}%<br>
            <span class="stars2 starstop" title="较差"></span><div class="power" style="width:${scoreStatsMap["4"].percentage}px"></div>${scoreStatsMap["4"].percentage?string('0.0')}%<br>
            <span class="stars1 starstop" title="很差"></span><div class="power" style="width:${scoreStatsMap["2"].percentage}px"></div>${scoreStatsMap["2"].percentage?string('0.0')}%<br>
        </div>
    </div>
    <div class="ll j a_stars rec-sec">我要评分:
        <span id="rating">
            <span id="stars">
                <a href="#" class="j a_show_login" name="pbtn-6781967-1" data-label="很差" data-score="2">
                    <@s.if test="currentUserScore != null && currentUserScore >= 2">
                        <img src="<@s.url value="/img/video/st.gif"/>" data-src="<@s.url value="/img/video/st.gif"/>" id="star1">
                    </@s.if>
                    <@s.else>
                        <img src="<@s.url value="/img/video/nst.gif"/>" data-src="<@s.url value="/img/video/nst.gif"/>" id="star1">
                    </@s.else>
                </a>
                <a href="#" class="j a_show_login" name="pbtn-6781967-2" data-label="较差" data-score="4">
                    <@s.if test="currentUserScore != null && currentUserScore >= 4">
                        <img src="<@s.url value="/img/video/st.gif"/>" data-src="<@s.url value="/img/video/st.gif"/>" id="star2">
                    </@s.if>
                    <@s.else>
                        <img src="<@s.url value="/img/video/nst.gif"/>" data-src="<@s.url value="/img/video/nst.gif"/>" id="star2">
                    </@s.else>
                </a>
                <a href="#" class="j a_show_login" name="pbtn-6781967-3" data-label="还行" data-score="6">
                    <@s.if test="currentUserScore != null && currentUserScore >= 6">
                        <img src="<@s.url value="/img/video/st.gif"/>" data-src="<@s.url value="/img/video/st.gif"/>" id="star3">
                    </@s.if>
                    <@s.else>
                        <img src="<@s.url value="/img/video/nst.gif"/>" data-src="<@s.url value="/img/video/nst.gif"/>" id="star3">
                    </@s.else>
                </a>
                <a href="#" class="j a_show_login" name="pbtn-6781967-4" data-label="推荐" data-score="8">
                    <@s.if test="currentUserScore != null && currentUserScore >= 8">
                        <img src="<@s.url value="/img/video/st.gif"/>" data-src="<@s.url value="/img/video/st.gif"/>" id="star4">
                    </@s.if>
                    <@s.else>
                        <img src="<@s.url value="/img/video/nst.gif"/>" data-src="<@s.url value="/img/video/nst.gif"/>" id="star4">
                    </@s.else>
                </a>
                <a href="#" class="j a_show_login" name="pbtn-6781967-5" data-label="力荐" data-score="10">
                    <@s.if test="currentUserScore != null && currentUserScore >= 10">
                        <img src="<@s.url value="/img/video/st.gif"/>" data-src="<@s.url value="/img/video/st.gif"/>" id="star5">
                    </@s.if>
                    <@s.else>
                        <img src="<@s.url value="/img/video/nst.gif"/>" data-src="<@s.url value="/img/video/nst.gif"/>" id="star5">
                    </@s.else>
                </a>
            </span>
            <span id="rateword" class="pl"></span>
            <input id="n_rating" type="hidden" value="">
        </span>
    </div>
</div>