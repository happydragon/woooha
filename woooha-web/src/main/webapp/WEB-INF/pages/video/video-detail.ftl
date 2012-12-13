<html>
	<head>
        <#setting date_format="yyyy-MM-dd"/>
		<title>${video.title}</title>
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
	</head>
	<body>
		<div id="content">
			<div class="base">
                <input type="hidden" id="videoid" value="${video.id}">
			    <div class="base_info">
			        <h1 class="title">
			        	<span class="label">视频:</span>
						<span id="subtitle">${video.title}</span>
			        </h1>
		            <!--引导-->
					<div class="guide">
						<div class="crumbs">
							<span id="cateInfo">
								<a href="#" class="todo" target="_blank" charset="400-02-1">所属标签</a>
							</span>  
							&gt;
                            <@s.iterator value="tags">
                                <a href="#" class="todo" target="_blank">${name}</a>&nbsp;
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
								<div class="edtext pl">介绍：${video.comment?if_exists}</div>
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

                    <div class="sns-bar" id="score_container">
                        <#include "/WEB-INF/pages/video/video-detail-score.ftl">
                    </div>

                    <div class="clear"></div>
                    <a name="commentLocation" id="commentLocation"></a>

                    <!-- begin of comment -->
                    <div id="comments">
                        <div id="comments_container">
                            <#include "/WEB-INF/pages/video/video-detail-comments.ftl">
                        </div>

						<div id="last"></div>
					    <h2>
					 		你的回应(最多200字)&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·&nbsp;·
						</h2>
						<div class="comment-form txd" id="add_comment">
                            <div class="item">
                                <a name="newCommentLoc" id="newCommentLoc"></a>
                                <textarea name="comment.content" id="comment_content" rows="4" cols="64"></textarea>
                                <br />
                            </div>
                            <div class="item">
                                <span class="error" id="comment-err"></span>
                                <span class="bn-flat-hot rr"><input type="submit" id="add-comment-btn" value="加上去"></span>
                            </div>
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
        <script type="text/javascript" src="<@s.url value="/js/swfobject.js"/>"></script>
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