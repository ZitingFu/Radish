{if $page.nc >= 1}
<div class="pagebar">
  <ul class="pagination container">
  
    {if $page.has_prev != 0}
    <li class="paginate_button previous previous-button">
      <a href="{$page.uri}&rn={$page.rn}&pn={$page.pn-1}"><span class="previous_button">上一页</span></a>
    </li>
    {/if} {foreach from=$page.display_pages key=i item=item}
    <li class="paginate_button {if $page.pn==$item} active{/if}">
      <a  href="{if $page.pn==$item} javascript:void(0) {else}{$page.uri}&rn={$page.rn}&pn={$item} {/if}"><span>{$item}</span></a>
    </li>
    {/foreach} {if $page.has_next != 0}
    
    <li class="paginate_button next-button">
      
      <a href="{$page.uri}&rn={$page.rn}&pn={$page.pn+1}"><span class="next_button">下一页</span></a>
    </li>
    {/if}
  </ul>
  <div class="smartyValue hidden" type="hidden">{$page.nc}</div>
  
</div>
{/if} 
<!–-[if IE]><link  rel="stylesheet" type="text/css" href="index.css" /><![endif]-–>
<script type="text/javascript" src="index.js"></script>
