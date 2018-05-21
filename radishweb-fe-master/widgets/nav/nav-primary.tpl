<div class="sidebar pull-left w-138">
    <ul>
        {foreach from=$site key=i item=item}
        <li class="{if $item.id==$site_id.id}active{/if}"><a href="/radishweb/notice/list?site={$item.id}">{$item.name}</a> </li>
        {/foreach}
    </ul>
</div>

<link rel="stylesheet" type="text/css" href="/css/1.css" />