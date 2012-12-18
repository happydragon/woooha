<div class="paginator">
<@s.if test="videoPaginater.totalPages > 1">
    <span class="prev">
        <@s.if test="%{videoPaginater.isHasPrev()}">
            <a href="<@s.url value="/video/videoSearch.vhtml"/>?searchText=${searchText}">&lt;前页</a>
        </@s.if>
        <@s.else><span class="prev">&lt;前页</span></@s.else>
    </span>
    <@s.iterator value="videoPaginater.pageNumbers" var="pageNum">
        <@s.if test="%{#pageNum == null}"><span class="break">...</span></@s.if>
        <@s.elseif test="%{#pageNum == videoPaginater.pageNumber}"><span class="thispage">${pageNum}</span></@s.elseif>
        <@s.else><a href="<@s.url value="/video/videoSearch.vhtml"/>?searchText=${searchText}&vp.pageNumber=${pageNum}">${pageNum}</a></@s.else>
    </@s.iterator>
    <span class="next">
        <@s.if test="%{videoPaginater.isHasNext()}">
            <a href="<@s.url value="/video/videoSearch.vhtml"/>?searchText=${searchText}&vp.pageNumber=${vp.nextPage}">后页&gt;</a>
        </@s.if>
        <@s.else><span class="prev">后页&gt;</span></@s.else>
    </span>
</@s.if>
    <span class="count">(共${videoPaginater.totalCount}条)</span>
</div>
