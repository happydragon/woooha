<span style="float: left;"><a href="#newCommentLoc" id="go_comment">我要评论</a></span>
<#include "/WEB-INF/pages/video/video-detail-comments-page.ftl">
<@s.iterator value="commentPaginater.results" var="comment">
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
                    <@s.if test="replyTo.shortContent.length() != replyTo.content.length()">...</@s.if>
                </a>
                <span class="pubdate"><a href="http://www.douban.com/people/Charlotte666/">${replyTo.userNickName}</a></span>
            </div>
        </@s.if>
        <p>${content}</p>
        <div class="op-lnks">
            <a href="?cid=118902543#add_comment" class="lnk-reply">回应</a>
            <div class="comment-report" style="visibility: hidden;"><a rel="nofollow" href="#">举报</a></div>
        </div>
        <div class="group_banned">
            <span class="gact hidden p_u1990157 p_admin p_intern fright">&gt;
                <a rel="nofollow" href="http://www.douban.com/photos/photo/1784781807/remove_comment?cid=118902543" class="j a_confirm_link" title="删除秋秋的发言?">删除</a>
            </span>
        </div>
    </div>
</div>
</@s.iterator>
<#include "/WEB-INF/pages/video/video-detail-comments-page.ftl">