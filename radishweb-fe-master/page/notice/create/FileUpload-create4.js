(function(window, $, undefined){
	
	function aaa4(conf){
		$.extend(this, {
			url: '/radishweb/upload/img2',
			fileField: 'file',
			fileFilter: {
				type: /image/ig,
				size: 10485760   //10MB
			},
			tips: function(msg, type){
				ybb.msgs(msg, type);
			}
		}, conf);
		//全部的ajax调用
		this.ajaxAssets = {};

		this.$table = this.$wrapper.find('table');

		this.init();
	}

	aaa4.prototype = {
		init: function(){
			//绑定事件
			this.addEvent();
			if(this.data) {
				this._Init(this.data);
			}
		},
		_Init: function(data){
      
			var html = '';
			for(var i = 0, len = data.length; i < len; i++){
				html += this._GenerateHtmlUnit('loaded', data[i].url, data[i].id);
			}
			this.$table.append(html);
		},	
		upload: function(files) {
			var self = this; 
			var files = self.filterFiles(files);	
			var len = files.length;		
			var uploaded = self.$wrapper.find('.file-uploaded').length;
			var count = null;

			//还能上传多少文件
			if(self.limit) {
				count = (count = self.limit - uploaded) > 0? count : 0;

				if(count == 0) {
					len = 0;
					self.tips('已经超过了最大可上传的文件数,请删除后重试', 'warning');
				}
				else if(count < len) {
					len -= count;
					len = len > self.limit? self.limit : len;
					self.tips('超过了最大可上传的文件数， 将只上传前' + len + '个', 'warning');
				}
			}

			for(var i = 0; i < len; i++){
				self._Upload(files[i]);
			}
		},
		//上传程序
		_Upload: function(fs){
			var self = this; 
			var ajaxId = self._UploadAjax.call(self, fs);
			//开始上传
			self._UploadStart(ajaxId);
		},
		//上传的Ajax
		_UploadAjax: function(fs){
			var self = this;
			var ajaxId = self.getRandomID();
			var ajax = $.ajax({
				url: self.url,
				xhr: function(){
					var xhr = new XMLHttpRequest();
					xhr.upload.onprogress = function(){
						self.handleProgress.apply(self, self.joinArray([ajaxId], arguments));
					};
					return xhr;
				},
				type: 'post',
				dataType: 'json',
				success: function(){
					self.handleSuccess.apply(self, self.joinArray([ajaxId], arguments));
				},
				error: function(){
					self.handleError.apply(self, self.joinArray([ajaxId], arguments));
				},
				data: self.formData(fs),
				processData: false,
				contentType: false
			});
			
			return self._AddAjax(ajaxId, ajax, fs);
		},
		toArray: function(a){
			return Array.prototype.slice.call(a, 0);
		},
		joinArray: function(a, b){
			return this.toArray(a).concat(this.toArray(b));
		},
		//生成form data
		formData: function(fs){
			var self = this;
			var fd = new FormData();

			for(var i in self.data) {
				fd.append(i, self.data[i]);
			}
			fd.append(self.fileField, fs);

			return fd;
		},
		//加入ajax组
		_AddAjax: function(ajaxId, ajax, fs){
			this.ajaxAssets[ajaxId] = {ajax: ajax, fs: fs};
			return ajaxId;
		},
		//消除ajax 
		_AbortAjax: function(ajaxId){
			if(this.ajaxAssets[ajaxId]) {
				this.ajaxAssets[ajaxId]['ajax'] && this.ajaxAssets[ajaxId]['ajax'].abort && this.ajaxAssets[ajaxId]['ajax'].abort();
				delete this.ajaxAssets[ajaxId];
			}
		},
		//开始上传
		_UploadStart: function(ajaxId){
			var self = this;
			self.getURL(self.ajaxAssets[ajaxId]['fs'], function(url){
				var $html = $(self._GenerateHtmlUnit.call(self, 'loading', url)).attr('data-ajaxId', ajaxId);
				self.$table.append($html);
			})
		},
		//取消上传
		_UploadCancel: function(dom, self){
			var $tr = $(dom).parents('tr');
			var ajaxId = $tr.attr('data-ajaxId');

			self._AbortAjax.call(self, ajaxId);
			
			self._UploadDelete(dom);
		},
		//删除已上传的
		_UploadDelete: function(dom){
      $('#img-upload-confirm button.btn-primary').removeClass('disabled');
			$(dom).parents('tr').fadeOut(2000, function(){$(this).remove()});
		},

		handleSuccess: function(ajaxId, data) {
			if(data.flag == 0) {
				this._UploadDone.call(this, ajaxId, data.data);
				this.success && this.success(data.data);
			}else {
				this.handleError(ajaxId, data);
			}
		},

		//已经上传
		_UploadDone: function(ajaxId, data){
			var self = this;
			//替换原来的文件，先判断是否超过最大的限制
			var uploaded = self.$wrapper.find('.file-uploaded').length;
			var url = data['url'],
          id = data['id'];
			if(self.limit && uploaded == self.limit) {
				self.$table.find('[data-ajaxId="' + ajaxId + '"]').replaceWith(this._GenerateHtmlUnit.call(self, 'error', url, '超过了最大可上传的文件数，已自动取消'));
			}
			else {
				self.$table.find('[data-ajaxId="' + ajaxId + '"]').replaceWith(this._GenerateHtmlUnit.call(self, 'loaded', url, id));
			}			
		},


		handleError: function(ajaxId, data, textStatus){
//			if(textStatus.toLowerCase() == 'abort') {
//				data.msg = '已取消上传';
//			}
			data.msg = data.msg || '未知错误';
			this.error && this.error(data.msg);
			this._UploadError.call(this, ajaxId, data.msg);
		},
		//上传失败
		_UploadError: function(ajaxId, info){			
			var self = this;
			var $tr = self.$table.find('[data-ajaxId="' + ajaxId + '"]');
			var src = $tr.attr('data-src');
			$tr.replaceWith(this._GenerateHtmlUnit.call(self, 'error', src, info));
		},

		handleProgress: function(ajaxId, ev) {
			if(ev.lengthComputable) {
				this._UploadProgress.call(this, ajaxId, ev.loaded/ev.total*100);
				this.progress && this.progress([ev.loaded, ev.total]);
			}
		},
		//正在上传
		_UploadProgress: function(ajaxId, percent){
			this.$table.find('[data-ajaxId="' + ajaxId + '"]')
				.find('.progress-bar').css('width', percent + '%');
		},

		//绑定事件
		addEvent: function(){

			var self = this;
			var wrapper = self.$wrapper[0];
			document.addEventListener('dragover', function(e){
				e.preventDefault();
			})
			document.addEventListener('dragenter', function(e){
				e.preventDefault();
			})
			wrapper.addEventListener('drop', function(e){
				e.preventDefault();
				self.upload(e.dataTransfer.files);				
			});
			self.$wrapper.on('click', '.btn-cancel', function(){
				self._UploadCancel.call(self, this, self);
			})
			.on('click', '.btn-delete', function(){
				self._UploadDelete.call(self, this, self);
			})
			.on('change', 'input', function(e){		
				self.upload(this.files);
				this.value = '';
				e.preventDefault();
			})
		},

		_GenerateHtmlUnit: function(status, src, id, msg){
			//如果上传其他文件，在这里修改模板就好了
			var loadingTpl = '<tr data-src="{src}">\
							<td class="upload-preview"><img src="{src}"></td>\
							<td class="upload-progress">\
								<div class="progress progress-striped active">\
									<div class="progress-bar progress-bar-success" style="width: 0%;">\
									</div>\
								</div>\
							</td>\
							<td class="upload-operator">\
								<button type="button" class="btn btn-cancel btn-warning btn-sm file-cancel">\
									<i class="fa fa-trash-o fa-x"></i>\
									<span>取消</span>\
								</button>\
							</td>\
					</tr>';
			var loadedTpl = '<tr data-src="{src}" class="file-uploaded fl4">\
							<td class="radio-paly"><img src="{src}"></td>\
							<td>\
								<p>已上传</p>\
							</td>\
							<td>\
								<input type="hidden" name="{name}" value="{src}" class="file-uploaded-input aaa14">\
                <label class="collapse file-uploaded-input-data aaa4L">{src-data}</label>\
								<button type="button" class="btn btn-danger btn-sm btn-delete">\
									<i class="fa fa-trash-o fa-x"></i>\
									<span>删除</span>\
								</button>\
							</td>\
					</tr>';
			var loadErrorTpl = '<tr data-src="{src}">\
							<td><img src="{src}"></td>\
							<td>\
								<b class="text-danger">{msg}</b>\
							</td>\
							<td>\
								<button type="button" class="btn btn-danger btn-sm btn-delete">\
									<i class="fa fa-trash-o fa-x"></i>\
									<span>删除</span>\
								</button>\
							</td>\
					</tr>';
			var html = '';
			if(status == 'loaded') {
				html = loadedTpl.replace(/{src}/ig, src.b).replace(/{src-data}/ig, id).replace(/{name}/ig, this.inputName);
			}
			else if(status == 'loading') {
				html = loadingTpl.replace(/{src}/ig, src);
			}
			else if(status == 'error') {
				html = loadErrorTpl.replace(/{src}/ig, src).replace(/{msg}/, arguments[2]);
			}
			return html;
		},
		filterFiles: function(fs){
			var self = this;
			var f = [];
			var tip = null;
			for(var i = 0, len = fs.length; i < len; i++){
				tip = [];
				if(self.fileFilter.type && !fs[i].type.match(self.fileFilter.type)) {
					tip.push('类型');
				}
				if(self.fileFilter.size && self.fileFilter.size < fs[i].size) {
					tip.push('大小');
				}
				if(tip.length) {
					self.tips('请检查文件' + fs[i].name + '的' + tip.join('、'), 'warning');
				}
				else {
					f.push(fs[i]);
				}
			}
			return f;
		},
		//获取url
		getURL: function(fs, cb){
			cb = cb || new Function();
			if(window.URL) {
				cb.call(null, window.URL.createObjectURL(fs));
			}
			else if(window.webkitURL) {
				cb.call(null, window.webkitURL.createObjectURL(fs));
			}
			else {
				var fr = new FileReader();
				fr.onload = function(){
					cb.call(null, fr.result);
				}
				fr.readAsDataURL(files);
			}
		},
		getRandomID: function(){
			return Math.random().toString(36).substr(2) + (+new Date);
		}
	}

	if(window.aaa4 === undefined) {
		window.aaa4 = aaa4;
	}
})(window, $, undefined)