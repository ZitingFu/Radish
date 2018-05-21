(function (window, $, undefined) {
  $(document).on('click','span.cancelled',function(){
    var topicId=$(this).attr('data-id');
    $(this).parents('li').slideUp();
    $.post('/radishweb/comments/delete',{id:topicId},function(){
      ybb.msgs('删除消息成功！', 'success');
      setTimeout(function(){
        location.reload();
      }, 1000);
    });
    return false;
  })

})(window, $, undefined)