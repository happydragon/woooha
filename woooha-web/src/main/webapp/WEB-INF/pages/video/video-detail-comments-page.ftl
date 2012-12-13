<div class="paginator">
    <@s.if test="commentPaginater.totalPages > 1">
    <span class="prev">
        <@s.if test="%{commentPaginater.isHasPrev()}">
            <a href="#" onclick="jump2page(${commentPaginater.prevPage}, this);return false;">&lt;前页</a>
        </@s.if>
        <@s.else><span class="prev">&lt;前页</span></@s.else>
    </span>
    <@s.iterator value="commentPaginater.pageNumbers" var="pageNum">
        <@s.if test="%{#pageNum == null}"><span class="break">...</span></@s.if>
        <@s.elseif test="%{#pageNum == commentPaginater.pageNumber}"><span class="thispage">${pageNum}</span></@s.elseif>
        <@s.else><a href="#" onclick="jump2page(${pageNum}, this);return false;">${pageNum}</a></@s.else>
    </@s.iterator>
    <span class="next">
        <@s.if test="%{commentPaginater.isHasNext()}">
            <a href="#" onclick="jump2page(${commentPaginater.nextPage}, this);return false;">后页&gt;</a>
        </@s.if>
        <@s.else><span class="prev">后页&gt;</span></@s.else>
    </span>
    </@s.if>
    <span class="count">(${commentPaginater.totalCount}条评论)</span>
</div>
