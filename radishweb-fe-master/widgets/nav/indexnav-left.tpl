<nav class="navbar container navbar-default" role="navigation" id="classify-tag">
  <ul class="" style="background-color:#fda249">
    <li {if !$page.params.genre}class="active"{/if}> <a href="/radishweb/index/index">全部</a></li>
    {foreach from=$genre key=i item=item}
    <li>  <span></span> </li>
    <li {if $page.params.genre == $item.id} class="active"{/if}> 
      <a href="/radishweb/index/index?genre={$item.id}{if $page.params.province}&province={$page.params.province}{/if}{if $page.params.city}&city={$page.params.city}{/if}{if $page.params.area}&area={$page.params.area}{/if}{if $page.params.site}&site={$page.params.site}{/if}">{$item.name}</a>
    </li>
    
    {/foreach}
  </ul>
</nav>
  