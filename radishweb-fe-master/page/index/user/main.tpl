{include file="radishweb/widgets/header/header.tpl"}
<style>
    .about p {
        font-size: 16px;
        line-height: 24px;
        text-indent: 2em;
    }
    .about p:first-child {
        text-indent: 0;
    }
</style>
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content reg">
        <div class="titlebar m-b30">
            <label>用户协议</label>
        </div>
        <div class="about">
            {$content}
        </div>
    </div>
</div>

{include file="radishweb/widgets/footer/footer.tpl"}