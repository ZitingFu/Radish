(function(window, $, undefined){
	function FormValid($form, regs){
		return new FormValid.prototype.init($form, regs);
	}
	FormValid.prototype = {
		init: function($form, regs){
			this.regs = regs; 
			this.$form = $form;		
			this.form = $form.selector || '#page-wrapper';
			this.bindEvent();			
		},
		bindEvent: function (){
			var self = this;
			$(document)
			.on('focusin', self.form + ' .form-group', function (){				
				self.hideError($(this));
			})
			.on('focusout', self.form + ' .form-group', function(){
				self.verify($(this));
			});
		},
		showError: function ($dom){
			$dom.addClass('has-error');
		},
		hideError: function ($dom){
			$dom.removeClass('has-error');
		},
		verify: function ($dom) {
			var self = this;
			var $nm = $dom.find('[name]')
			var nm = $nm.attr('name');				
			var isRight = true;
			var matches = null;
			if(self.regs[nm]) {
				if((matches = $nm.val().match(self.regs[nm])) && matches[0]){
					self.hideError($dom);
				}
				else {
					isRight = false;
					self.showError($dom);
				}				
			}
			return isRight;
		},
		getValid: function(){
			var self = this;
			var isRight = true;
			for(var i in self.regs){
				(function(i, self){
					self.verify($('.form-' + i)) || (isRight = false);
				})(i, self);
			}
			return isRight;
		}
	}

	FormValid.prototype.init.prototype = FormValid.prototype;

	if(window.FormValid == undefined) {
		window.FormValid = FormValid;
	}

})(window, $, undefined)