<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<#assign decorator=JspTaglibs["/WEB-INF/tld/sitemesh-decorator.tld"]>
	<#assign s=JspTaglibs["/WEB-INF/tld/struts-tags.tld"]>
	<#assign woooha=JspTaglibs["/WEB-INF/tld/woooha-tags.tld"]>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><@decorator.title default="喔哈网"/></title>
        <script type="text/javascript" src="<@s.url value="/js/core.js"/>"></script>
        <script type="text/javascript" src="<@s.url value="/js/jquery-1.8.3.min.js"/>"></script>
        <script type="text/javascript" src="<@s.url value="/js/jquery.tmpl.min.js"/>"></script>
        <script type="text/javascript">var contextpath = "${base}";var fullcontextpath = "<@s.url value="/" forceAddSchemeHostAndPort="true"/>";if (fullcontextpath.endWith("/")) {fullcontextpath = fullcontextpath.substr(0, fullcontextpath.length - 1);}</script>
        <link rel="stylesheet" href="<@s.url value="/css/core/packed__init.css"/>">
        <link rel="stylesheet" href="<@s.url value="/css/core/packed_site_nav.css"/>">
		<@decorator.head/>
	</head>
	<body>
		<div class="top-nav">
			<div class="bd">
				<div class="top-nav-info">
					<a href="http://www.douban.com/accounts/login" rel="nofollow">登录</a>
					<a href="http://www.douban.com/accounts/register">注册</a>
				</div>
				<div class="top-nav-items">
					<ul>
						<li<@s.if test="module == 'video'"> class="on"</@s.if>>
							<a href="<@s.url value="/video/videoList.vhtml"/>">喔哈视频</a>
						</li>
						<li<@s.if test="module == 'music'"> class="on"</@s.if>>
							<a href="<@s.url value="/music/musicList.vhtml"/>">喔哈音乐</a>
						</li>
						<li>
							<a href="http://www.douban.com/location/">喔哈漫画</a>
						</li>
						<li>
							<a href="http://book.douban.com/">喔哈读书</a>
						</li>
						<li>
							<a href="http://www.douban.com/">喔哈社区</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="wrapper">
			
			<@decorator.body/>
			
			<div id="footer">
				<span id="icp" class="fleft gray-link">© 2005－2012 woooha.cn, all rights reserved</span>
				<span class="fright">
					<a href="http://www.douban.com/about">关于喔哈</a>
					· <a href="http://www.douban.com/about?topic=contactus">联系我们</a>
					· <a href="http://www.douban.com/about?policy=disclaimer">免责声明</a>
					· <a href="http://www.douban.com/help/">帮助中心</a>
					· <a href="http://developers.douban.com">开发者</a>
					· <a href="http://www.douban.com/partner/">喔哈广告</a>
				</span>
			</div>
		</div>
	</body>
</html>