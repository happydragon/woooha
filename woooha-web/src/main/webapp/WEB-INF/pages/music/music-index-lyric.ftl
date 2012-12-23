<div id="lrc-panel">
    <h2 class="lrc-title"><span class="listening-icon"> </span>我爱记歌词</h2>
    <div class="lrc-wrapper">
        <ul class="simple-list-1col collectors">
            <@s.if test="lyricRows.isEmpty">
                <li>该歌曲尚未收录歌词.</li>
            </@s.if>
            <@s.else>
                <@s.iterator value="lyricRows">
                    <li class="${tag}">
                        <@s.if test="!''.equals(content.trim())">${content}</@s.if><@s.else>&nbsp;</@s.else>
                    </li>
                </@s.iterator>
            </@s.else>
        </ul>
    </div>
</div>