<html>
	<head>
		<title>woooha-list</title>
		<#include "/WEB-INF/pages/video/video-index-seg-css.ftl">
	</head>
	<body>
		<#include "/WEB-INF/pages/video/video-header.ftl">
		<div id="content">
			<div class="grid-16-8 clearfix">
				<div class="article">
					<div id="dale_movie_home_main_top"></div>
					<div id="screening">
					    <div class="screening-hd">
					        <div class="ui-slide-control">
					            <span class="prev-btn"><a class="btn-prev btn-disabled" href="javascript:void(0)"></a></span>
					            <span class="next-btn"><a class="btn-next" href="javascript:void(0)"></a></span>
					        </div>
					        <div class="slide-tip"><span class="ui-slide-index">1</span> / <span class="ui-slide-max">6</span></div>
					        <h2>
                                最新推荐<span><a href="<@s.url value="/video/recommendList.vhtml"/>">推荐排行榜»</a></span><span>
                            </h2>
					    </div>
					    <div class="screening-bd" id="slide-plane">
					        <ul class="ui-slide-content" data-slide-index="1" data-index-max="9" data-left="0" style="left: 0px;"><!-- -608px; -->
                                <@s.iterator value="recommendVideos" var="videoVo" status="videoStat">
                                    <li class="ui-slide-item">
                                        <ul>
                                            <li class="poster">
                                                <a href="<@s.url action="videoDetail" namespace="/video"/>?id=${video.id}">
                                                    <img src="<@s.url value="/img/video"/>/${video.pic}" alt="${video.title}" rel="nofollow">
                                                </a>
                                            </li>
                                            <li class="title">
                                                <a href="<@s.url action="videoDetail" namespace="/video"/>?id=${video.id}">${video.abbrTitle}</a>
                                            </li>
                                            <li class="rating">
                                                    <span class="rating-star allstar${video.userStar}"></span><span class="subject-rate">${video.userScore?string('0.0')}</span>
                                            </li>
                                        </ul>
                                    </li>
                                </@s.iterator>
                                <@s.iterator value="(24 - recommendVideos.size).{#this}" status="stat">
                                    <li class="ui-slide-item"></li>
                                </@s.iterator>
					        </ul>
					    </div>
					</div>

                    <div id="new-movies">
                        <div class="new-movies-bd">
                            <h2>
                                最新视频
                                <span><a href="<@s.url value="/video/newList.vhtml"/>">更多最新»</a></span>
                            </h2>
                            <ul class="movies-list">
                                <@s.iterator value="latestVideos">
                                <li class="list-item">
                                    <ul>
                                        <li class="poster">
                                            <a href="<@s.url value="/video/videoDetail.vhtml?id=${video.id}"/>">
                                                <img class="lazy" src="<@s.url value="/img/video"/>/${video.pic}" alt="${video.abbrTitle}"
                                                     rel="nofollow" style="display: inline-block;">
                                            </a>
                                        </li>
                                        <li class="title">
                                            <a href="<@s.url value="/video/videoDetail.vhtml?id=${video.id}"/>">${video.abbrTitle}</a>
                                        </li>
                                    </ul>
                                </li>
                                </@s.iterator>
                            </ul>
                        </div>
                    </div>
					
					<!-- begin of content -->
					<div id="reviews">
						<div class="reviews-hd">
							<h2>一周最热</h2>
						</div>
						<div class="reviews-bd">
                            <@s.iterator value="topHotVideos" var="videoVo" status="videoStat">
                                <div class="review<@s.if test="#videoStat.last"> last</@s.if>">
                                    <div class="review-hd" style="border:1px solid #D7D7D7;">
                                        <div>
                                            <a href="<@s.url value="/video/videoDetail.vhtml?id=${video.id}"/>">
                                                <img class="lazy" data-original="<@s.url value="/img/video"/>/${video.pic}"
                                                    src="<@s.url value="/img/video"/>/${video.pic}"
                                                    alt="${video.abbrTitle}" style="display: inline-block;">
                                            </a>
                                        </div>
                                        <div>
                                            <a href="#" class="source-link nomark" class="buylink">来源：${video.fromSiteLabel}</a>
                                        </div>
                                    </div>
                                    <div class="review-bd">
                                        <h3><a href="<@s.url value="/video/videoDetail.vhtml?id=${video.id}"/>">${video.title}</a></h3>
                                        <div class="review-meta">
                                            网友推荐：<span class="allstar${video.userStar}"></span>
                                            <span class="fright">喔哈推荐：<span class="allstar${video.wooohaStar}"></span></span>
                                        </div>
                                        <div class="review-content">
                                            ${video.comment?if_exists}
                                        </div>
                                    </div>
                                </div>
                            </@s.iterator>
						</div>
                    </div>
					<!-- end of content -->
					
				</div>
				<div class="aside">
                    <#include "/WEB-INF/pages/video/video-seg-tags.ftl">

					<div class="mod">
						<h2>最新短评</h2>
						<ul class="inline-list simple-list-1col collectors">
                            <@s.iterator value="latestComments" var="comment" status="commentStat">
							<li>
								<a class="ll" tabindex="-1" href="http://www.douban.com/location/people/amelie_11/drama/">
									<img width="48" height="48" src="<@s.url value="/img/user"/>/${userPic}" alt="11">
								</a>
								<div class="info">
									<p class="title">
										<a href="http://www.douban.com/location/people/amelie_11/drama/">${userNickName}</a>
									</p>
									<p class="tip">
                                        <@s.set name="beforeHours" value="%{#comment.beforeHours}"/>
                                        <@s.if test="%{#beforeHours > 1 && #beforeHours < 5}"><@s.property value="#beforeHours"/>小时前评论</@s.if>
                                        <@s.elseif test="%{#beforeHours >= 5}">5小时前评论</@s.elseif>
                                        <@s.else>1小时内评论</@s.else>
										<a class="mimic" href="<@s.url value="/video/videoDetail.vhtml?id=${videoId}"/>">${videoAbbrTitle}</a>
										<span class="stars stars${videoUserIntStar}"></span>
									</p>
									<p class="comment reply-quote">
                                        <span class="short">${shortContent}</span>
                                        <span class="all">${content}</span>
                                        <a href="#" class="toggle-reply"><@s.if test="shortContent.length() != content.length()">...</@s.if></a>
                                    </p>
								</div>
							</li>
                            </@s.iterator>
						</ul>
					</div>
				</div>
				<div class="extra"></div>
			</div>
		</div>
        <script type="text/javascript" src="<@s.url value="/js/video/video.js"/>"></script>
        <script type="text/javascript" src="<@s.url value="/js/video/video-index.js"/>"></script>
	</body>
</html>
