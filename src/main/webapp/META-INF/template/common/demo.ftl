<#assign staticCssPath="${base}/static/css/"/>
<#assign staticImgPath="${base}/static/img/"/>
<#macro layout>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="${staticCssPath}manage.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="manage_container">
    <div class="manage_head">
        <div class="manage_logo"><a href="http://www.jfinal.com">JFinal web framework</a></div>
        <div id="nav">
            <ul>
                <li><a href="${base?if_exists}/"><b>首页</b></a></li>
                <li><a href="${base?if_exists}/blog"><b>Blog管理</b></a></li>
            </ul>
        </div>
    </div>
    <div class="main">
        <#nested>
    </div>
</div>
</body>
</html>
</#macro>

<#macro paginate currentPage totalPage actionUrl urlParas="">
    <#if (totalPage <= 0) || (currentPage > totalPage)><#return></#if>
    <#local startPage = currentPage - 4>
    <#if (startPage < 1)><#local startPage = 1></#if>

    <#local endPage = currentPage + 4>
    <#if (endPage > totalPage)><#local endPage = totalPage></#if>

<div class="pagination">
    <#if (currentPage <= 8)>
        <#local startPage = 1>
    </#if>
    <#if ((totalPage - currentPage) < 8)>
        <#local endPage = totalPage>
    </#if>

    <#if (currentPage == 1)>
        上页
    <#else>
        <a href="${actionUrl}#{currentPage - 1}${urlParas!}" class="prev_page">上页</a>
    </#if>

    <#if (currentPage > 8)>
        <a href="${actionUrl}#{1}${urlParas!}">#{1}</a>
        <a href="${actionUrl}#{2}${urlParas!}">#{2}</a>
        …
    </#if>

    <#list startPage..endPage as i>
        <#if currentPage == i>
        #{i}
        <#else>
            <a href="${actionUrl}#{i}${urlParas!}">#{i}</a>
        </#if>
    </#list>

    <#if ((totalPage - currentPage) >= 8)>
        …
        <a href="${actionUrl}#{totalPage - 1}${urlParas!}">#{totalPage - 1}</a>
        <a href="${actionUrl}#{totalPage}${urlParas!}">#{totalPage}</a>
    </#if>

    <#if (currentPage == totalPage)>
        下页
    <#else>
        <a href="${actionUrl}#{currentPage + 1}${urlParas!}" class="next_page" rel="next">下页</a>
    </#if>
</div>
</#macro>