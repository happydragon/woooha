<html>
	<head>
		<title>喔哈视频</title>
        <#assign woooha=JspTaglibs["/WEB-INF/tld/woooha-tags.tld"]>
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
					            <span class="prev-btn"><a class="btn-prev" href="javascript:void(0)"></a></span>
					            <span class="next-btn"><a class="btn-next" href="javascript:void(0)"></a></span>
					        </div>
					        <div class="slide-tip"><span class="ui-slide-index">2</span> / <span class="ui-slide-max">6</span></div>
					        <h2>最新推荐<span><a onclick="moreurl(this, {from:'mv_l_a'})" href="./nowplaying/">谁推荐了这些»</a></span><span><!--a onclick="moreurl(this, {from:'mv_l_w'})" href="./later/">即将上映»</a></span--></h2>
					    </div>
					    <div class="screening-bd">
					        <ul class="ui-slide-content" data-slide-index="1" data-index-max="9" style="left: 0px;"><!-- -608px; -->
                                <@s.iterator value="recommendVideos" var="videoVo" status="videoStat">
                                <li class="ui-slide-item" data-title="${video.abbrTitle}">
                                    <ul>
                                        <li class="poster">
                                            <a onclick="moreurl(this, {from:'mv_a_pst'})" href="http://movie.douban.com/subject/3005875/">
                                                <img src="<@s.url value="/img/video"/>/${video.pic}" alt="2012 3D" rel="nofollow">
                                            </a>
                                        </li>
                                        <li class="title">
                                            <a onclick="moreurl(this, {from:'mv_a_tl'})" href="http://movie.douban.com/subject/3005875/">${video.abbrTitle}</a>
                                        </li>
                                        <li class="rating">
                                                <span class="rating-star allstar${video.userStar}"></span><span class="subject-rate">${video.userScore}</span>
                                        </li>
                                    </ul>
                                </li>
                                </@s.iterator>
                                <!-- 需要补满整格滚动屏 -->
                                <!--
					               <li class="ui-slide-item" data-title="2012 3D" data-release="2009" data-rate="7.6" data-star="40" data-trailer="http://movie.douban.com/subject/3005875/trailer" data-ticket="http://movie.douban.com/subject/3005875/cinema/" data-duration="158分钟" data-region="美国" data-director="Roland" data-actors="约翰·库萨克 切瓦特·埃加福特 阿曼达·皮特" data-intro="2012欢迎来到中国。" data-enough="True" data-rater="191034">
					                   <ul>
					                       <li class="poster"><a onclick="moreurl(this, {from:'mv_a_pst'})" href="http://movie.douban.com/subject/3005875/"><img src="http://img3.douban.com/lpic/s3964805.jpg" alt="2012 3D" rel="nofollow"></a></li>
					                       <li class="title">
					                           <a onclick="moreurl(this, {from:'mv_a_tl'})" href="http://movie.douban.com/subject/3005875/">2012 3D...</a>
					                       </li>
					                       <li class="rating">
					                               <span class="rating-star allstar40"></span><span class="subject-rate">7.6</span>
					                       </li>
					                   </ul>
					               </li>
					               <li class="ui-slide-item"></li>
					            -->
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
										1小时前评论
										<a class="mimic" href="http://www.douban.com/location/drama/20283652/">${videoAbbrTitle}</a>
										<span class="stars stars${videoUserIntStar}"></span>
									</p>
									<p class="comment">${content}</p>
								</div>
							</li>
                            </@s.iterator>
                            <!--
							<li>
								<a class="ll" tabindex="-1"
									href="http://www.douban.com/location/people/aliceliang0907/drama/">
									<img width="48" height="48"
										src="http://img3.douban.com/icon/u56463119-8.jpg" alt="默片晓">
								</a>
								<div class="info">
									<p class="title">
										<a href="http://www.douban.com/location/people/aliceliang0907/drama/">默片晓</a>
									</p>
									<p class="tip">
										2小时前评论
										<a class="mimic" href="http://www.douban.com/location/drama/10863588/">喜剧的忧伤</a>
										<span class="stars stars4"></span>
									</p>
									<p class="comment">一开始，何冰比陈道明更入戏，后来好很多，真是喜欢死何冰了…没有在谢幕各路姑娘们喊道哥我爱你的时候喊上一句何冰我爱你，真是一大憾事啊……
									</p>
								</div>
							</li>
							<li>
								<a class="ll" tabindex="-1"
									href="http://www.douban.com/location/people/3530338/drama/">
									<img width="48" height="48"
										src="http://img3.douban.com/icon/u3530338-2.jpg" alt="Iberian">
								</a>
								<div class="info">
									<p class="title">
										<a href="http://www.douban.com/location/people/3530338/drama/">Iberian</a>
									</p>
									<p class="tip">
										2小时前评论
										<a class="mimic" href="http://www.douban.com/location/drama/20256960/">冠军季节</a>
										<span class="stars stars3"></span>
									</p>
									<p class="comment">这版阵容可强大了，Chris Noth和Kiefer
										Sutherland，但是我还是买到了终场5块钱的票，而且没觉得engaging....</p>
								</div>
							</li>
							<li>
								<a class="ll" tabindex="-1"
									href="http://www.douban.com/location/people/1562338/drama/">
									<img width="48" height="48"
										src="http://img3.douban.com/icon/u1562338-5.jpg" alt="ne">
								</a>
								<div class="info">
									<p class="title">
										<a href="http://www.douban.com/location/people/1562338/drama/">ne</a>
									</p>
									<p class="tip">
										今天上午评论
										<a class="mimic" href="http://www.douban.com/location/drama/10540049/">空中花园谋杀案</a>
										<span class="stars stars3"></span>
									</p>
									<p class="comment">没有原来预想的好。虽然音乐很好听，演员表演也很到位，但我还是有些失望。</p>
								</div>
							</li>
                            -->
						</ul>
					</div>
				</div>
				<div class="extra"></div>
			</div>
		</div>
	</body>
</html>
