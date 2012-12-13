<html>
    <head>
        <#setting date_format="yyyy-MM-dd"/>
        <title>woooha-list-bytag</title>
        <link rel="stylesheet" href="<@s.url value="/css/core/packed_douban9062801777.css"/>">
        <link rel="stylesheet" href="<@s.url value="/css/core/packed__all402822323.css"/>">
        <link rel="stylesheet" href="<@s.url value="/css/core/packed_dialog4563741467.css"/>">
        <#include "/WEB-INF/pages/video/video-list-bytag-seg-css.ftl">
    </head>
    <body>
        <#include "/WEB-INF/pages/video/video-header.ftl">
        <h1>
            视频标签：<span class="tags-name">${tag.name}</span>
        </h1>

        <div id="content">
            <div class="grid-16-8 clearfix">
                <div class="article">
                    <div class="clearfix">
                        <span class="rr greyinput">
                            <@s.if test="sortType == \"R\" || sortType == \"\"">日期排序</@s.if>
                            <@s.else><a href="<@s.url value="/video/videoListByTag.vhtml"/>?tagId=${tagId}&sortType=R">日期排序</a></@s.else>
                            &nbsp;/&nbsp;
                            <@s.if test="sortType == \"P\"">评分排序</@s.if>
                            <@s.else><a href="<@s.url value="/video/videoListByTag.vhtml"/>?tagId=${tagId}&sortType=P">评分排序</a></@s.else>
                            &nbsp;/&nbsp;
                            <@s.if test="sortType == \"S\"">推荐数排序</@s.if>
                            <@s.else><a href="<@s.url value="/video/videoListByTag.vhtml"/>?tagId=${tagId}&sortType=S">推荐数排序</a></@s.else>
                        </span>
                    </div>
                    <div id="subject_list">
                        <@s.iterator value="videoPaginater.results" status="videoStat">
                            <p class="ul<@s.if test="#videoStat.first"> first</@s.if>"></p>
                            <table width="100%">
                                <tbody>
                                <tr class="item">
                                    <td width="150" valign="top">
                                        <a class="nbg" href="http://movie.douban.com/subject/6829652/" title="${video.abbrTitle}">
                                            <img src="<@s.url value="/img/video"/>/${video.pic}" alt="${video.abbrTitle}">
                                        </a>
                                    </td>
                                    <td valign="top">
                                        <div class="pl2">
                                            <a href="http://movie.douban.com/subject/6829652/">
                                                ${video.title}
                                            </a>
                                        </div>
                                        <span style="color: #b3b3b3;">来源：${video.fromSiteLabel}</span>
                                        <p class="pl">${video.comment?if_exists}</p>
                                        <div class="star clearfix">
                                            <span class="allstar${video.userStar}"></span>
                                            <span class="rating_nums">${video.userScore?string('0.0')}</span>
                                            <span class="pl">(${video.userScoreCount}人评分)</span>
                                            <span class="pl3 fright">${video.createTime?date}</span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div id="collect_form_6829652"></div>
                        </@s.iterator>
                        <#include "/WEB-INF/pages/video/video-list-bytag-page.ftl">
                    </div>
                </div>
                <div class="aside">
                    <br />
                    这里放广告
                </div>
                <div class="extra">

                </div>
            </div>
        </div>
    </body>
</html>