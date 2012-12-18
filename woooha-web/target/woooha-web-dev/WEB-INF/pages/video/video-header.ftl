<div id="header">
	<div id="db-nav-movie" class="site-nav">
	    <div class="site-nav-logo">
	      <a href="<@s.url value="/video/videoList.vhtml"/>">
	          <img src="<@s.url value="/img/woooha-video-logo2.png"/>" alt="喔哈">
	      </a>
	    </div>
		<div class="bd">
		    <div class="nav-srh">
		        <form name="ssform" method="get" action="<@s.url value="/video/videoSearch.vhtml"/>">
		            <div class="inp">
		                <span>
		                	<input id="searchText" name="searchText" type="text" placeholder="输入视频名称搜索..." size="22"
                                   maxlength="60" value="${searchText?if_exists}" style="color: <@s.if test="searchText != null">black;</@s.if><@s.else>#D4D4D4;</@s.else>">
		                </span>
		                <span><input class="bn-srh" type="submit" value="搜索"></span>
		            </div>
		        </form>
			</div>
			<div class="site-nav-items nav-anon">
				<ul>
                    <@s.iterator value="searchWords">
					<li><a href="<@s.url value="/video/videoSearch.vhtml?searchText="/><@s.property/>"><@s.property/></a></li>
                    </@s.iterator>
				</ul>
			</div>
		</div>
		<div class="ext"></div>
	</div>
</div>