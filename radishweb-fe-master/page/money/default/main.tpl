{include file="radishweb/widgets/header/header.tpl"}
<link rel="stylesheet" href="default.css">
<body>
{include file="radishweb/widgets/nav/nav.tpl"}
<div class="wrapper p-t30">
    <div class="content w-830 pull-right wrap-content section">
        <div class="titlebar m-b20">
            <label>我的金币</label>
        </div>
        <div class="headerTop">
            <p class="h-money">账户余额<strong>{$pass.banlance}金币</strong></p>
            <p class="h-def">金币可用于打赏用户、推广信息</p>
            <button type="button" class="btn btn-outline btn-warning pull-right w-78" id="recharge">充值</button>
            <button type="button" class="btn btn-outline btn-warning pull-right w-78  m-r92" id="withdraw">提现</button>
        </div>
        <div class="col-list m-t21">
            {if $list}
            <div  class="transactionRecord m-b20">
                <p>交易记录</p>
            </div>
            <div class="listF"><span>时间</span><span>金额</span><span>类型</span><span>详情</span></div>
            <ul class="recordList">
                {foreach from=$list key=i item=item}
                <li>
                    <span>{$item.create_time}</span>
                    <span>{if $item.type==3}{if $item.from_passid ==0}{$item.money}{/if}{/if} {if $item.type==2}{$item.money}{/if}  {if $item.type ==1}{if $session.id==$item.from_passid}{$item.price}{/if} {/if}  {if $item.type ==1}{if $session.id==$item.to_passid}{$item.money}{/if} {/if} </span>
                    <span>{if $item.type==1}打赏{else if $item.type==2}提现{else if $item.type==3}充值{/if}</span>
                    <span>{if $item.type==3}{if $item.from_passid ==0}用户充值{$item.money}金币{/if}{/if} {if $item.type==2}用户提现{$item.money}金币{/if}  {if $item.type ==1}{if $session.id==$item.from_passid}您打赏给{$item.to_name}{$item.price}金币{/if} {/if}  {if $item.type ==1}{if $session.id==$item.to_passid}{$item.from_name}打赏给您{$item.money}金币{/if} {/if}</span>
                </li>
                {/foreach}
                {include file="radishweb/widgets/page/page.tpl"}
            </ul>
            {else}
            <p>暂无交易记录</p>
            {/if}
        </div>
    </div>
    <img src="" alt="" id="weixinimg">
    <input type="hidden" id="orderId" value="">
    <div class="Cover">
        <div class="m-Cover" id="isRecharge">
            <div class="m-title">充值 <img src="/images/Onclose.png" alt="关闭"></div>
            <div>
                <div class="recharge">
                    充值金额：
                    <select id="onMoney" class="form-control w-190">
                        <option value="0">请选择充值金额</option>
                        <!--<option value="0.01">0.01元</option>-->
                        <option value="6">6元</option>
                        <option value="50">50元</option>
                        <option value="108">108元</option>
                        <option value="518">518元</option>
                        <option value="1048">1048元</option>
                        <option value="6498">6498元</option>
                    </select>
                    支付方式：
                        <label><input name="type" type="radio" value="1" checked /><img src="/images/zhifubao.png" alt=""></label>
                        <label><input name="type" type="radio" value="2" /><img src="/images/weixin.png" alt=""></label>
                        <!--<label><input name="type" type="radio" value="3" /><img src="/images/yinlian.png" alt="" style="width: 40px; height: 24px"></label>-->
                </div>
                <button class="confirm-payment  btn btn-warning btn-primary">确认支付</button>
            </div>
        </div>
        <input type="hidden" value="{$bind}" id="bind">
        <input type="hidden" value="{$pass.banlance}" id="Banlance">
        <input type="hidden" value="{$rate}" id="rate">
        <input type="hidden" value="{$hasPassword}" id="hasPassword">
        <div class="m-Cover" id="isWithdraw" >
            <div class="m-title">提现 <img src="/images/Onclose.png" alt="关闭"></div>
            <div class="withdrawWrap">
                <div class="withdrawMoney" >
                    <span>提现金额：</span><input type="text" placeholder="请输入您的提现金额" id="withdrawInput"  autocomplete="off">
                </div>
                <p class="WXLetter">请先在App端绑定微信</p>
                <p class="XLBFee">平台收取手续费<span class="Fee1">0</span>元 。实际到账 <span class="Fee2">0</span> 元</p>
                <div class="withdrawWX">
                    <span>账号：</span><img src="/images/weixin.png" alt="">{if $nickname}{$nickname	}{else}绑定账号{/if}
                </div>
            </div>
            <button class="Application  btn btn-warning btn-primary">申请提现</button>
        </div>
        <div id="hidden"></div>
        <div id="QRcode">
            <img src=''>
        </div>
        <div class="m-Cover" id="Cover2">
            <div class="m-title">输入密码<img src="/images/Onclose.png" alt="关闭"></div>
            <div class="m-password">
                <p>请输入支付密码</p>
                <!---->
                <div class='virbox'>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <br><br>
                <input type="password" class="realbox" maxlength="6" id="Passw"  autocomplete="off">
                <i class="virboxI"></i>
                <!--支付密码-->
            </div>
            <!---->
            <button id="topicPass" type="button" class="btn btn-warning w-130 h-36">确定</button>
            <div class="forget-password m-t16">
                <a href="/radishweb/passport/modifywithdrawpass?id={$info.id}&type=3">忘记密码 ?</a>
            </div>
        </div>
    </div>
    <div class="cover3">
        <!--<div class="m-title">提示 </div>-->
        <div class="c3-box">
            <div class="c3-title">
                提示
            </div>
            <div class="c3-content">请先在App端绑定微信</div>
            <button class="c3-button  btn btn-warning btn-primary">我知道了</button>
        </div>
    </div>
    {include file="radishweb/widgets/nav/usernav-left.tpl"}

</div>
<style>
    body .leftpop{
        display: block;
    }
</style>
<script src="default.js"></script>
{include file="radishweb/widgets/footer/footer.tpl"}