;(function(window, $, undefined){
	$(function(){
		$(document).on('click', '#search-submit', function(){
			location.href = $('#mod-value').val() + '?q=' + encodeURIComponent($("[name='q']").val());
			return false;
		})
		.on('click', '.input-group-btn li', function(e){
			var $this = $(this);
			$('#mod').html($this.find('a').html());
			$('#mod-value').val($this.attr('data-value'));
		})
	})
})(window, $)