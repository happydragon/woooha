<style type="text/css">h2{color:#111;padding-bottom:10px;border-bottom:1px solid #eaeaea;margin-bottom:18px}</style>
<div id="subject-tags">
    <div class="subject-tags-hd">
        <h2>视频标签</h2>
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