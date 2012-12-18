<html>
    <head>
        <#setting date_format="yyyy-MM-dd"/>
        <title>woooha-list-bytag</title>
        <link rel="stylesheet" href="<@s.url value="/css/core/packed_init2.css"/>">
        <link rel="stylesheet" href="<@s.url value="/css/core/packed__all.css"/>">
        <link rel="stylesheet" href="<@s.url value="/css/core/packed_dialog.css"/>">
    </head>
    <body>
        <#include "/WEB-INF/pages/video/video-header.ftl">

        <div id="content">
            <div class="grid-16-8 clearfix">
                <div class="article">
                    <div id="subject_list">
                        <@s.iterator value="videoPaginater.results" status="videoStat">
                            <p class="ul<@s.if test="#videoStat.first"> first</@s.if>"></p>
                            <table width="100%">
                                <tbody>
                                <tr class="item">
                                    <td width="150" valign="top">
                                        <a class="nbg" href="<@s.url value="/video/videoDetail.vhtml?id=${video.id}"/>" title="${video.abbrTitle}">
                                            <img src="<@s.url value="/img/video"/>/${video.pic}" alt="${video.abbrTitle}">
                                        </a>
                                    </td>
                                    <td valign="top">
                                        <div class="pl2">
                                            <a href="<@s.url value="/video/videoDetail.vhtml?id=${video.id}"/>">
                                                ${video.title}
                                            </a>
                                        </div>
                                        <span style="color: #b3b3b3;">来源：${video.fromSiteLabel}</span>
                                        <p class="pl">${video.comment?if_exists}</p>
                                        <div class="star clearfix">
                                            <span class="allstar${video.userStar}"></span>
                                            <span class="rating_nums">${video.userScore?string('0.0')}</span>
                                            <span class="pl3">(${video.userScoreCount}人评分，${video.recommendCount}人推荐)</span>
                                            <span class="pl4 fright">${video.createTime?date}</span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div id="collect_form_6829652"></div>
                        </@s.iterator>
                        <#include "/WEB-INF/pages/video/video-search-results-page.ftl">
                    </div>
                </div>
                <div class="aside">
                    <br />
                    这里放广告
                    <p></p>

                    <#include "/WEB-INF/pages/video/video-seg-tags.ftl">
                </div>
                <div class="extra">

                </div>
            </div>
        </div>
        <script type="text/javascript" src="<@s.url value="/js/video/video.js"/>"></script>
    </body>
</html>