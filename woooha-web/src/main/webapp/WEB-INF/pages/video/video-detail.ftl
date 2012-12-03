<html>
	<head>
		<title>${video.title}</title>
        <#setting datetime_format="yyyy-MM-dd HH:mm:ss"/>
		<style type="text/css">
			.suggest-overlay{position:absolute;z-index:10001;width:auto;background:#fff;border:1px solid #c5c7d2;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px}.suggest-overlay .bd{min-width:220px;line-height:1;background:#fafafa;color:#b3b3b3;padding:5px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px}.suggest-overlay ul{color:#333;padding:3px 0;min-width:214px}.suggest-overlay li{margin:0;padding:0}.suggest-overlay li b{font-weight:bold}.suggest-overlay li span{color:#999}.suggest-overlay img{margin-right:5px;width:20px;height:20px;vertical-align:middle}.suggest-overlay li.on{background:#e9f0f8}.suggest-overlay li a{display:block;padding:3px 7px;color:#333}.suggest-overlay li a:hover,.suggest-overlay li a:focus,.suggest-overlay li a:active{outline:0;color:#333;background:0;background:#e9f0f8}
			
			.lnk-reply { margin-right:20px; }
			.op-lnks { visibility:hidden;text-align:right; }
			.over .op-lnks { visibility:visible; }
			.reply-quote { width:30em;padding-left:7px;margin:20px 0;border-left:1px solid;  }
			.reply-quote .all { display: none }
			
			.reply-comment { width:90%;position:relative;padding:3px 4px;margin-bottom:5px;background-color:#e8eef2; }
			.reply-comment .lnk-close { position:absolute;right:10px;top:10px;line-height:1;padding:0 2px; }
			.reply-comment .lnk-close:link,
			.reply-comment .lnk-close:visited,
			.reply-comment .lnk-close:hover,
			.reply-comment .lnk-close:active { font-size:16px; }
			.reply-comment .lnk-close:link { color:#999; }
			.reply-comment .lnk-close:hover { background-color:#999;color:#fff; }
			.reply-comment p { width:30em;padding:6px;margin:0; }
			.reply-comment .pubdate { white-space:nowrap;margin-left:10px; }
		</style>
        <script type="text/javascript" src="<@s.url value="/js/swfobject.js"/>"></script>
	</head>
	<body>
		<div id="content">
			<div class="base">
			    <div class="base_info">
			        <h1 class="title">
			        	<span class="label">视频:</span>
						<span id="subtitle">${video.title}</span>
			        </h1>
		            <!--引导-->
					<div class="guide">
						<div class="crumbs">
							<span id="cateInfo">
								<a href="http://ent.youku.com/" target="_blank" charset="400-02-1">所属标签</a>
							</span>  
							&gt;
                            <@s.iterator value="tags">
                                <a href="http://www.youku.com/v_showlist/t2d1c86.html" charset="400-02-2" target="_blank">${name}</a>&nbsp;
                            </@s.iterator>
						</div>
					</div>
			    </div>
			    <div class="clear"></div> 
			</div>
			<div class="clear"></div>
			<div class="grid-16-8 clearfix">
				<div class="article">
					<div>
						<div id="link-report">
							<div style="text-align:left">
                                <div id="videoPlayer" style="width: 588px; height: 480px;"><p>视频加载中...</p></div>

							</div>
							<div class="photo_descri">
								<div class="edtext pl">介绍：${video.comment}。</div>
							</div>
							<!--
							<div class="report" style="visibility: visible;"><a rel="nofollow" href="#">举报</a></div>
							-->
					    </div>
						<style>
						    #link-report .report { text-align: right; font-size: 12px; visibility: hidden; }
						    #link-report .report a { color: #BBB; }
						    #link-report .report a:hover { color: #FFF; background-color: #BBB; }
						</style>
					    <div style="color:#999;margin-bottom:5px" class="report-link">
					        上传于${video.createTime?date}
					    </div>
					</div>
					<div class="sns-bar">
						<div class="sns-bar-fav">
							<div class="rec-sec">
								<span>
									<a href="https://www.douban.com/accounts/register?reason=collect" class="j a_show_login lnk-sharing lnk-douban-sharing">推荐</a>
								</span>
								<span class="rec-num">${video.recommendCount}人</span>
							</div>
						</div>
						
						<div class="sns-bar-rec">
							<span id="Photo-1784781807">
								<a href="#" data-url="http://www.douban.com/photos/photo/1784781807/" data-desc="" 
									data-title="【Elsewhere in fall】巴黎圣母院顶上 望着铁塔思考的小怪兽" 
									data-pic="http://img3.douban.com/view/photo/photo/public/p1784781807.jpg" 
									class="bn-sharing">分享到</a> &nbsp;&nbsp;
							</span>
							<div id="interest_sectl">
							    <div class="rating_wrap clearbox" rel="v:rating">
                                    <p class="rating_self clearfix" typeof="v:Rating">
                                        <span class="ll bigstar${video.userStar}"></span>
                                        <strong class="ll rating_num" property="v:average">${video.userScore}</strong>
                                        <span property="v:best" content="10.0"></span>
                                    </p>
                                    <p class="rating_self font_normal">(<a href="collections"><span property="v:votes">${video.commentCount}</span>人评价</a>)</p>
                                    <span class="stars5 starstop" title="力荐"></span><div class="power" style="width:${scoreStatsMap["10"].percentage}px"></div>${scoreStatsMap["10"].percentage?string('0.0')}%<br>
                                    <span class="stars4 starstop" title="推荐"></span><div class="power" style="width:${scoreStatsMap["8"].percentage}px"></div>${scoreStatsMap["8"].percentage?string('0.0')}%<br>
                                    <span class="stars3 starstop" title="还行"></span><div class="power" style="width:${scoreStatsMap["6"].percentage}px"></div>${scoreStatsMap["6"].percentage?string('0.0')}%<br>
                                    <span class="stars2 starstop" title="较差"></span><div class="power" style="width:${scoreStatsMap["4"].percentage}px"></div>${scoreStatsMap["4"].percentage?string('0.0')}%<br>
                                    <span class="stars1 starstop" title="很差"></span><div class="power" style="width:${scoreStatsMap["2"].percentage}px"></div>${scoreStatsMap["2"].percentage?string('0.0')}%<br>
								</div>
							</div>
							<div class="ll j a_stars rec-sec">评价:
							    <span id="rating">
							    	<span id="stars">
									    <a href="http://www.douban.com/register?reason=rate" class="j a_show_login" name="pbtn-6781967-1" data-label="很差">
									    	<img src="http://img3.douban.com/pics/nst.gif" id="star1">
									    </a>
									    <a href="http://www.douban.com/register?reason=rate" class="j a_show_login" name="pbtn-6781967-2" data-label="较差">
									    	<img src="http://img3.douban.com/pics/nst.gif" id="star2">
									    </a>
									    <a href="http://www.douban.com/register?reason=rate" class="j a_show_login" name="pbtn-6781967-3" data-label="还行">
									    	<img src="http://img3.douban.com/pics/nst.gif" id="star3">
									    </a>
									    <a href="http://www.douban.com/register?reason=rate" class="j a_show_login" name="pbtn-6781967-4" data-label="推荐">
									    	<img src="http://img3.douban.com/pics/nst.gif" id="star4">
									    </a>
									    <a href="http://www.douban.com/register?reason=rate" class="j a_show_login" name="pbtn-6781967-5" data-label="力荐">
									    	<img src="http://img3.douban.com/pics/nst.gif" id="star5">
									    </a>
								    </span>
							    	<span id="rateword" class="pl"></span>
							    	<input id="n_rating" type="hidden" value="">
							    </span>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<br />
					
					<!-- begin of comment -->
					<div id="comments">
                        <@s.iterator value="comments">
						<div class="comment-item" id="${id}">
						    <div class="pic">
						        <a href="http://www.douban.com/people/akiaki/"><img src="<@s.url value="/img/user"/>/${userPic}" alt="${userNickName}"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/akiaki/">${userNickName}</a> ${createTime?datetime}
						        </div>

                                <@s.if test="replyTo != null">
                                <div class="reply-quote">
                                    <span class="short">${replyTo.shortContent}</span>
                                    <span class="all">${replyTo.content}</span>
                                    <a href="#" class="toggle-reply">
                                        <@s.if test="replyTo.shortContent.length() != replyTo.content.length()">
                                        ...
                                        </@s.if>
                                    </a>
                                    <span class="pubdate"><a href="http://www.douban.com/people/Charlotte666/">${replyTo.userNickName}</a></span>
                                </div>
                                </@s.if>

						        <p>${content}</p>
						        <div class="op-lnks">
						          <a href="?cid=118902543#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						        <div class="group_banned">
						            <span class="gact hidden p_u1990157 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118902543" class="j a_confirm_link" title="删除秋秋的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
                        </@s.iterator>

						<div class="comment-item" id="118902630" data-cid="118902630" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/bluenilo/"><img src="http://img3.douban.com/icon/u1799911-13.jpg" alt="尼洛"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/bluenilo/">尼洛</a> 2012-11-21 17:46:49
						        </div>
						
						
						        <p>啊啊啊啊！</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118902630#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1799911 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118902630" class="j a_confirm_link" title="删除尼洛的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118903202" data-cid="118903202" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/FogFog/"><img src="http://img3.douban.com/icon/u4677797-11.jpg" alt="洁身自好曲无力"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/FogFog/">洁身自好曲无力</a> 2012-11-21 17:54:47
						        </div>
						
						
						        <p>《夜行神龙》.............</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118903202#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u4677797 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118903202" class="j a_confirm_link" title="删除洁身自好曲无力的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118903502" data-cid="118903502" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/akiaki/"><img src="http://img3.douban.com/icon/u1990157-6.jpg" alt="秋秋"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/akiaki/">秋秋</a> 2012-11-21 17:59:37
						        </div>
						
						
						        <p>↑就是这个，哈哈哈哈哈哈</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118903502#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1990157 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118903502" class="j a_confirm_link" title="删除秋秋的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118904026" data-cid="118904026" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/17851257/"><img src="http://img3.douban.com/icon/u17851257-271.jpg" alt="伤逝2.0"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/17851257/">伤逝2.0</a> 2012-11-21 18:07:32
						        </div>
						
						
						        <p>最近地铁的佳能广告就是这个。
						<br>
						<br>记得luna sea也有一个专辑用这个做封面。</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118904026#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u17851257 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118904026" class="j a_confirm_link" title="删除伤逝2.0的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118906555" data-cid="118906555" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/sukemodo/"><img src="http://img3.douban.com/icon/u1894499-10.jpg" alt="蜕"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/sukemodo/">蜕</a> 2012-11-21 18:45:08
						        </div>
						
						
						        <p>我的头像。。。。。</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118906555#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1894499 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118906555" class="j a_confirm_link" title="删除蜕的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118908211" data-cid="118908211" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/annie-bean/"><img src="http://img3.douban.com/icon/u2498857-33.jpg" alt="霉君"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/annie-bean/">霉君</a> 2012-11-21 19:09:01
						        </div>
						
						
						        <p>托腮吐舌卖萌状</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118908211#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u2498857 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118908211" class="j a_confirm_link" title="删除霉君的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118916388" data-cid="118916388" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/4413882/"><img src="http://img3.douban.com/icon/u4413882-8.jpg" alt="默默梦"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/4413882/">默默梦</a> 2012-11-21 20:54:44
						        </div>
						
						
						        <p>乖得安心</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118916388#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u4413882 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118916388" class="j a_confirm_link" title="删除默默梦的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118923002" data-cid="118923002" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/later17/"><img src="http://img3.douban.com/icon/u53317598-12.jpg" alt="bsh．"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/later17/">bsh．</a> 2012-11-21 22:00:25
						        </div>
						
						
						        <p>布拉塞</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118923002#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u53317598 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118923002" class="j a_confirm_link" title="删除bsh．的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118924678" data-cid="118924678" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/Charlotte666/"><img src="http://img3.douban.com/icon/u1114382-4.jpg" alt="刃"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/Charlotte666/">刃</a> 2012-11-21 22:16:46
						        </div>
						
						
						        <p>彩虹的Real也是用的这个做封面</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118924678#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1114382 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118924678" class="j a_confirm_link" title="删除刃的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118928542" data-cid="118928542" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/3197168/"><img src="http://img3.douban.com/icon/u3197168-19.jpg" alt="牛小姐"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/3197168/">牛小姐</a> 2012-11-21 22:55:43
						        </div>
						
						
						        <p>啊!!!</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118928542#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u3197168 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118928542" class="j a_confirm_link" title="删除牛小姐的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118939103" data-cid="118939103" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/bluenilo/"><img src="http://img3.douban.com/icon/u1799911-13.jpg" alt="尼洛"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/bluenilo/">尼洛</a> 2012-11-22 08:59:34
						        </div>
						
						            
						                
						                <div class="reply-quote">
						                <span class="short">彩虹的Real也是用的这个做封面</span>
						                <span class="all">彩虹的Real也是用的这个做封面</span>
						                <a href="#" class="toggle-reply">
						                </a><span class="pubdate"><a href="http://www.douban.com/people/Charlotte666/">刃</a></span></div>
						
						        <p>就是！！！</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118939103#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1799911 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118939103" class="j a_confirm_link" title="删除尼洛的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118941317" data-cid="118941317" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/zhaoxiaojiezc/"><img src="http://img3.douban.com/icon/u57724245-11.jpg" alt="咩咩喵喵小草莓"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/zhaoxiaojiezc/">咩咩喵喵小草莓</a> 2012-11-22 09:46:56
						        </div>
						
						
						        <p>不是说那个其实不是这个小怪物么</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118941317#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u57724245 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118941317" class="j a_confirm_link" title="删除咩咩喵喵小草莓的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118941989" data-cid="118941989" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/moemoeplanet/"><img src="http://img3.douban.com/icon/u2173362-44.jpg" alt="Jany"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/moemoeplanet/">Jany</a> 2012-11-22 10:00:08
						        </div>
						
						
						        <p>彩虹！</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118941989#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u2173362 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118941989" class="j a_confirm_link" title="删除Jany的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118942139" data-cid="118942139" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/pigforest/"><img src="http://img3.douban.com/icon/u1313296-34.jpg" alt="Max.Z"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/pigforest/">Max.Z</a> 2012-11-22 10:02:57
						        </div>
						
						
						        <p>夜行神龙+10086</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118942139#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1313296 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118942139" class="j a_confirm_link" title="删除Max.Z的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118949739" data-cid="118949739" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/1731384/"><img src="http://img3.douban.com/icon/u1731384-51.jpg" alt="Pan小平"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/1731384/">Pan小平</a> 2012-11-22 12:16:07
						        </div>
						
						
						        <p>少年撒旦的烦恼</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118949739#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1731384 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118949739" class="j a_confirm_link" title="删除Pan小平的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118952030" data-cid="118952030" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/berrysolo/"><img src="http://img3.douban.com/icon/u3179166-1.jpg" alt="solo"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/berrysolo/">solo</a> 2012-11-22 12:52:18
						        </div>
						
						
						        <p>啊，这个怪物，我也拍过~和lz的角度神吻合哪~</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118952030#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u3179166 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118952030" class="j a_confirm_link" title="删除solo的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118952326" data-cid="118952326" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/momo100200/"><img src="http://img3.douban.com/icon/u3715986-11.jpg" alt="淡"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/momo100200/">淡</a> 2012-11-22 12:56:06
						        </div>
						
						
						        <p>夜行神龙+10086
						<br>
						<br></p>
						
						        <div class="op-lnks">
						          <a href="?cid=118952326#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u3715986 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118952326" class="j a_confirm_link" title="删除淡的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118964721" data-cid="118964721" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/53499360/"><img src="http://img3.douban.com/icon/u53499360-3.jpg" alt="_某个远方、"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/53499360/">_某个远方、</a> 2012-11-22 15:52:26
						        </div>
						
						
						        <p>让我想起了卡西莫多</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118964721#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u53499360 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118964721" class="j a_confirm_link" title="删除_某个远方、的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118964973" data-cid="118964973" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/papaya7/"><img src="http://img3.douban.com/icon/u1970124-198.jpg" alt="侧脸君"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/papaya7/">侧脸君</a> 2012-11-22 15:56:08
						        </div>
						
						
						        <p>哈哈之前看有人雨天拍他显得可寂寞了，晴天看还挺卖萌的感觉诶！</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118964973#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u1970124 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118964973" class="j a_confirm_link" title="删除侧脸君的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118967404" data-cid="118967404" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/48760313/"><img src="http://img3.douban.com/icon/u48760313-2.jpg" alt="nobska"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/48760313/">nobska</a> 2012-11-22 16:31:09
						        </div>
						
						
						        <p>看完整个相册觉得心里又激动又平静，忽然觉得自己不多看点书多沉淀一下，都不配去这些地方。</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118967404#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u48760313 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118967404" class="j a_confirm_link" title="删除nobska的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						
						
						<div class="comment-item" id="118976650" data-cid="118976650" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/2164760/"><img src="http://img3.douban.com/icon/u2164760-2.jpg" alt="青猫"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/2164760/">青猫</a> 2012-11-22 18:55:07
						        </div>
						
						
						        <p>全部胶片?赞的!</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118976650#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u2164760 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118976650" class="j a_confirm_link" title="删除青猫的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118980185" data-cid="118980185" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/vicenie/"><img src="http://img3.douban.com/icon/u63525563-22.jpg" alt="Vicenie"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/vicenie/">Vicenie</a> 2012-11-22 19:46:18
						        </div>
						
						
						        <p>好喜欢这张！！！=3= 可以拿来当头像吗？！！！！</p>
						
						        <div class="op-lnks">
						          <a href="?cid=118980185#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						
						        <div class="group_banned">
						            <span class="gact hidden p_u63525563 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118980185" class="j a_confirm_link" title="删除Vicenie的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
						
						    
						
						<div class="comment-item" id="118989735" data-cid="118989735" data-target_id="1784781807" data-target_kind="1025">
						    <div class="pic">
						        <a href="http://www.douban.com/people/she2d/"><img src="http://img3.douban.com/icon/u1533848-12.jpg" alt="席二德"></a>
						    </div>
						    <div class="content report-comment">
						        <div class="author">
						          <a href="http://www.douban.com/people/she2d/">席二德</a> 2012-11-22 21:38:27
						        </div>
						        <p>彩虹《real》</p>
						        <div class="op-lnks">
						          <a href="?cid=118989735#add_comment" class="lnk-reply">回应</a>
						        <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div></div>
						        <div class="group_banned">
						            <span class="gact hidden p_u1533848 p_admin p_intern fright">&gt;
						                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118989735" class="j a_confirm_link" title="删除席二德的发言?">删除</a>
						            </span>
						        </div>
						    </div>
						</div>
					
						<div id="last"></div>
					    <h2>
					 		你的回应&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
						</h2>
						<div class="comment-form txd" id="add_comment">
							<form name="comment_form" method="post" action="add_comment"><div style="display:none;"><input type="hidden" name="ck" value="cyc4"></div>
								<div class="item">
									<textarea name="rv_comment" rows="4" cols="64"></textarea><br>
								</div>
								<input type="hidden" name="start" value="0">
							    <div class="item">
									<span class="bn-flat-hot "><input type="submit" value="加上去"></span>
							    </div>
							</form>
						</div>
					</div>
					
					<!-- end of comment -->
					
				</div>
				<div class="aside">
					这里可以打打广告...
				</div>
				<div class="extra"></div>
			</div>
		</div>
        <@s.if test="video.fromSite == 'Youku'">
            <#include "/WEB-INF/pages/video/video-detail-youku.ftl">
        </@s.if>
        <@s.elseif test="video.fromSite == 'Tudou'">
            <#include "/WEB-INF/pages/video/video-detail-tudou.ftl">
        </@s.elseif>
        <@s.elseif test="video.fromSite == 'Qiyi'">
            <#include "/WEB-INF/pages/video/video-detail-qiyi.ftl">
        </@s.elseif>
        <script type="text/javascript" src="<@s.url value="/js/video/video-detail.js"/>"></script>
	</body>
</html>