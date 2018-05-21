(function (window, $, undefined){
	$.fn.mask = function(opt) {
		opt = opt || {};		
		function showMask($dom){
			$dom.addClass('mask-open');
		}
		function hideMask($dom){
			$dom.removeClass('mask-open');
		}
		function randomId () {
			return '#mask-' + Math.random().toString(36).slice(3);
		}
		return this.each(function() {
		    var $this = $(this);
		    var randId = randomId();
			var maskHTML = '<div id="' + randId.slice(1) + '" class="mask-wrapper"></div>';
	    	var everMask = $this.data('mask')   	
		    var wrapper = everMask || randId;

			if(typeof opt == 'string') {
				if(everMask) {
					switch (opt) {
						case 'show':
							showMask($this);
							break;
						case 'hide':
						default: 
							hideMask($this);
							break;
					}
				}else {
					$this.mask();
				}				
			}else {
				if(everMask) {
					$this.mask('show');					
				}else {
					$this.data('mask', wrapper).append(maskHTML);
					$this.css('position') == 'static' && $this.css('position', 'relative');
					showMask($this);
					if(opt.bind) {
						$(document).on('click', wrapper, function(){
							$this.mask('hide');
						})
					}
				}	
			}

			return $this;
		});
	}
})(window, $, undefined)