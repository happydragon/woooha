<html>
	<head>
		<title>喔哈视频</title>
        <#assign woooha=JspTaglibs["/WEB-INF/tld/woooha-tags.tld"]>
        <link rel="stylesheet" href="<@s.url value="/css/core/packed_init2.css"/>">
        <link rel="stylesheet" href="<@s.url value="/css/core/packed__all.css"/>">
        <#include "/WEB-INF/pages/video/video-list-seg-css.ftl">
	</head>
	<body>
		<#include "/WEB-INF/pages/video/video-header.ftl">
		<div id="content">
			<div class="grid-16-8 clearfix">
				<div class="article">
                    <h1 id="ghostTit">推荐总排行</h1>
                    <div class="bd">
                        <div id="showing-now" class="tab-bd">
                            <@s.iterator value="recommendVideos" var="rVideo" status="videoStat">
                                <div class="item mod<@s.if test="#videoStat.odd == false"> odd</@s.if>">
                                    <a class="thumb" href="<@s.url action="videoDetail" namespace="/video"/>?id=${video.id}">
                                        <img src="<@woooha.Static resource="${video.pic}"/>" alt="${video.title}">
                                    </a>
                                    <div class="intro">
                                        <h3>
                                        <span class="ll">
                                            <a href="<@s.url action="videoDetail" namespace="/video"/>?id=${video.id}">${video.abbrTitle}</a>
                                        </span>
                                        </h3>
                                        <ul class="star_info">
                                            <li class="star clearfix"><span class="allstar${video.userStar}">
                                                ${video.userScore?string('0.0')}</span>
                                            </li>
                                            <li class="dt">${video.recommendCount}人推荐</li>
                                            <li class="dt">
                                                <@s.iterator value="%{#rVideo.video.tags}" status="tStat"><@s.if test="!#tStat.first"> </@s.if>${name}</@s.iterator>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </@s.iterator>
                        </div>
                    </div>
					
				</div>
				<div class="aside">
                    <#include "/WEB-INF/pages/video/video-seg-tags.ftl">
				</div>
				<div class="extra"></div>
			</div>
		</div>
        <script type="text/javascript" src="<@s.url value="/js/video/video.js"/>"></script>
	</body>
</html>
