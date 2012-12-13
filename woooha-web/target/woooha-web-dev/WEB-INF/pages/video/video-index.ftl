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

                    <#--
                    <script id="db-tmpl-subject-tip" type="text/x-jquery-tmpl">
                        <div id="subject-tip">
                            <div class="subject-tip-hd">
                                <h3>{{= title}}</h3>
                            </div>
                            <div class="subject-tip-bd">
                                {{if intro}}
                                <div class="">
                                    {{= intro}}
                                </div>
                                {{/if}}
                            </div>
                        </div>
                    </script>
                    -->

					<div id="screening">
					    <div class="screening-hd">
					        <div class="ui-slide-control">
					            <span class="prev-btn"><a class="btn-prev btn-disabled" href="javascript:void(0)"></a></span>
					            <span class="next-btn"><a class="btn-next" href="javascript:void(0)"></a></span>
					        </div>
					        <div class="slide-tip"><span class="ui-slide-index">1</span> / <span class="ui-slide-max">6</span></div>
					        <h2>
                                最新推荐<span><a onclick="moreurl(this, {from:'mv_l_a'})" href="./nowplaying/">推荐排行榜»</a></span><span>
                            </h2>
					    </div>
					    <div class="screening-bd" id="slide-plane">
					        <ul class="ui-slide-content" data-slide-index="1" data-index-max="9" data-left="0" style="left: 0px;"><!-- -608px; -->
                                <@s.iterator value="recommendVideos" var="videoVo" status="videoStat">
                                    <li class="ui-slide-item" data-title="${video.title}" data-star="40" data-rate="7.5" data-rater="150" data-intro="${video.comment?if_exists}">
                                        <ul>
                                            <li class="poster">
                                                <a onclick="moreurl(this, {from:'mv_a_pst'})" href="<@s.url action="videoDetail" namespace="/video"/>?id=${video.id}">
                                                    <img src="<@s.url value="/img/video"/>/${video.pic}" alt="2012 3D" rel="nofollow">
                                                </a>
                                            </li>
                                            <li class="title">
                                                <a onclick="moreurl(this, {from:'mv_a_tl'})" href="<@s.url action="videoDetail" namespace="/video"/>?id=${video.id}">${video.abbrTitle}</a>
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
                                <span><a onclick="moreurl(this, {from:'mv_new_mr'})" href="/chart">更多最新»</a></span>
                            </h2>
                            <ul class="movies-list">
                                <@s.iterator value="latestVideos">
                                <li class="list-item">
                                    <ul>
                                        <li class="poster">
                                            <a onclick="moreurl(this, {from:'mv_new_ptr_hot_2'})" href="http://movie.douban.com/subject/10438426/">
                                                <img class="lazy" data-original="http://img3.douban.com/mpic/s22708748.jpg" src="<@s.url value="/img/video"/>/${video.pic}" alt="${video.abbrTitle}"
                                                     rel="nofollow" style="display: inline-block;">
                                            </a>
                                        </li>
                                        <li class="title"><a onclick="moreurl(this, {from:'mv_new_tl_hot_2'})" href="http://movie.douban.com/subject/10438426/">${video.abbrTitle}</a></li>
                                    </ul>
                                </li>
                                </@s.iterator>
                            </ul>
                        </div>
                    </div>
					
					<!-- begin of content -->
					<div id="reviews">
						<div class="reviews-hd">
							<h2>热门视频<span><a href="/review/best/">更多热门视频»</a></span><!--<span><a href="/review/latest/">最新视频(TODO)»</a></span>--></h2>
						</div>
						<div class="reviews-bd">
                            <@s.iterator value="topHotVideos" var="videoVo" status="videoStat">
                                <div class="review<@s.if test="#videoStat.last"> last</@s.if>">
                                    <div class="review-hd" style="border:1px solid #D7D7D7;">
                                        <div>
                                            <a href="http://movie.douban.com/subject/1851857/">
                                                <img class="lazy" data-original="<@s.url value="/img/video"/>/${video.pic}"
                                                    src="<@s.url value="/img/video"/>/${video.pic}"
                                                    alt="${video.abbrTitle}" style="display: inline-block;">
                                            </a>
                                        </div>
                                        <div>
                                            <a href="http://www.taobide.com/redirect/170914-1" class="source-link" target="_blank" class="buylink">来源：${video.fromSiteLabel}</a>
                                        </div>
                                    </div>
                                    <div class="review-bd">
                                        <h3><a href="http://movie.douban.com/review/5660132/">${video.title}</a></h3>
                                        <div class="review-meta">
                                            网友推荐：<span class="allstar${video.userStar}"></span>
                                            <span class="fright">喔哈推荐：<span class="allstar${video.wooohaStar}"></span></span>
                                        </div>
                                        <div class="review-content">
                                            ${video.comment}
                                        </div>
                                    </div>
                                </div>
                            </@s.iterator>
						</div>
                    </div>
					<!-- end of content -->
					
				</div>
				<div class="aside">
                    <div id="subject-tags">
                        <div class="subject-tags-hd">
                            <h2>视频标签<!--span><a onclick="moreurl(this, {from:'mv_l_atg'})" href="http://movie.douban.com/tag/?view=type">所有分类»</a></span--></h2>
                        </div>
                        <div class="subject-tags-hd">
                            <ul class="tags-list">
                                <@s.iterator value="videoTags">
                                    <li class="list-item">
                                        <a onclick="moreurl(this, {from:'mv_l_tg'})" href="<@s.url value="/video/videoListByTag.vhtml"/>?tagId=${id}">${name}</a>
                                    </li>
                                </@s.iterator>
                            </ul>
                        </div>
                    </div>
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
										<a class="mimic" href="http://www.douban.com/location/drama/20283652/">${videoAbbrTitle}</a>
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
        <script type="text/javascript" src="<@s.url value="/js/video/video-index.js"/>"></script>
	</body>
</html>
