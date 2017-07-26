var count = true;

$(function() {
	// 判断密码安全等级
	$('#defaultForm').bootstrapValidator({
		fields : {/* 验证：规则 */
			opRealname : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请填写真实姓名'
					},
					threshold : 1, // 有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
				}
			},
			passwordhash0 : {
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					identical : {// 相同
						field : 'passwordhash1',
						message : '两次密码不一致'
					},
				}
			},
			passwordhash1 : {
				validators : {
					notEmpty : {
						message : '请验证密码'
					},
					identical : {// 相同
						field : 'passwordhash0',
						message : '两次密码不一致'
					},
				}
			},
			opName0 : {
				validators : {
					notEmpty : {
						message : '邮件不能为空'
					},
					emailAddress : {
						message : '邮箱格式不正确'
					}
				}
			},
			mobile : {
				validators : {
					notEmpty : {
						message : '手机号码不能为空'
					},
					regexp : {
						regexp : /^1[3|5|8]{1}[0-9]{9}$/,
						message : '请输入正确的手机号码'
					}
				}
			},
			businesstelephone : {
				validators : {
					notEmpty : {
						message : '办公号码不能为空'
					},
					regexp : {
						regexp : /^(\d{3,4}-)?\d{7,8}$/,
						message : '请输入正确的办公号码'
					}
				}
			},
			opOrg : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请填写公司全称'
					},

				},
			},
			opDep : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请填写公司所属部门 '
					},

				},
			},
			opOrgAddr : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请详细填写公司地址'
					},

				},
			},
			local1 : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请上传图片'
					},
				},
			},
			local2 : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请上传图片'
					},
				},
			},
			rule : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请同意服务条款'
					},
				},
			},
			 
			captcha : {
				validators : {
					notEmpty : {//非空验证：提示消息
						message : '请填写验证码'
					},
				}
			}

		},

	}).on('success.form.bv', function(e) {//点击提交之后
		// Prevent form submission
		e.preventDefault();

		// Get the form instance
		var $form = $(e.target);

		// Get the BootstrapValidator instance
		var bv = $form.data('bootstrapValidator');
		// Use Ajax to submit form data 提交至form标签中的action，result自定义
		var opRealname = $("#opRealname").val();
		var mobile = $("#mobile").val();
		var businesstelephone = $("#businesstelephone").val();
		var opDep = $("#opDep").val();
		var opOrg = $("#opOrg").val();
		var opOrgAddr = $("#opOrgAddr").val();
		var opName = $("#opName0").val();
		var code = $("#code").val();
		var passwordhash = $("#passwordhash0").val();
		var $male = $('input:radio[id="male1"]:checked').val();
		var sex;
		if ($male != null) {
			sex = '男';
		} else {
			sex = '女';
		}
		$.ajax({
			type : "post",
			url : "SysRegisterActionAjax_saveUser.action",
			async : true,
			data : {
				"opRealname" : opRealname,
				"mobile" : mobile,
				"businesstelephone" : businesstelephone,
				"opDep" : opDep,
				"opOrg" : opOrg,
				"opOrgAddr" : opOrgAddr,
				"email" : opName,
				"passwordhash" : passwordhash,
				"code" : code,
				"sex" : sex
			},
			dataType : 'text',
			success : function(data) {
                var obj = JSON.parse(data);  
                if(obj.flag=="success"){
                	if(obj.code=="1"){
                		$("#mobile1").removeClass("hide");
                		$("#mobile1").html(obj.msg);
                		return;
                	}else if(obj.code=="2"){
                		$("#opName1").removeClass("hide");
                		$("#opName1").html(obj.msg);
                		return;
                	}else if(obj.code=="3"){
                		$("#code1").removeClass("hide");
                		$("#code1").html(obj.msg);
                		return;
                	}else if(obj.msg=="注册成功"){
                		window.location.href='component/register/RegSucceed.jsp';
                	}
                }
			}
		});
	});
	$('#mobile').focus(function() { 
		$("#mobile1").addClass("hide");
		}); 
	$('#opName0').focus(function() { 
		$("#opName1").addClass("hide");
		}); 
	$('#code').focus(function() { 
		$("#code1").addClass("hide");
		}); 
	$('#passwordhash0')
			.keyup(
					function() {
						var strongRegex = new RegExp(
								"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$",
								"g");
						var mediumRegex = new RegExp(
								"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$",
								"g");
						var enoughRegex = new RegExp("(?=.{1,}).*", "g");

						if (false == enoughRegex.test($(this).val())) {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass(' pw-defule');
							// 密码小于六位的时候，密码强度图片都为灰色
						} else if (strongRegex.test($(this).val())) {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass(' pw-strong');
							// 密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
						} else if (mediumRegex.test($(this).val())) {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass(' pw-medium');
							// 密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
						} else {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass('pw-weak');
							// 如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
						}
						return true;
					});
	
	// 修改密码验证
	$('#changePwdForm').bootstrapValidator({
		fields : {/* 验证：规则 */
			currentpwd : {
				validators : {
					notEmpty : {
						message : '请输入当前密码'
					},
				},
				identical : {// 相同
					field : '',
					message : '密码不正确'
				},
			},
			changepwd0 : {
				validators : {
					notEmpty : {
						message : '密码不能为空'
					},
					identical : {// 相同
						field : 'changepwd1',
						message : '两次密码不一致'
					},
					 stringLength: {/*长度提示*/
                         min: 6,
                         max: 16,
                         message: '密码长度必须在6到16位之间'
                     }
				}
			},
			changepwd1 : {
				validators : {
					notEmpty : {
						message : '请验证密码'
					},
					identical : {// 相同
						field : 'changepwd0',
						message : '两次密码不一致'
					},
				}
			},
		},

	}).on('success.form.bv', function(e) {//点击提交之后
		// Prevent form submission
		e.preventDefault();

		// Get the form instance
		var $form = $(e.target);

		// Get the BootstrapValidator instance
		var bv = $form.data('bootstrapValidator');
		// Use Ajax to submit form data 提交至form标签中的action，result自定义
		var passwordhash = $("#changepwd0").val();
		$.ajax({
			type : "post",
			url : "SysRegisterActionAjax_saveUser.action",
			async : true,
			data : {
				"changepwd0" : passwordhash
			},
			dataType : 'text',
			success : function(data) {
                var obj = JSON.parse(data);  
                if(obj.flag=="success"){
                	if(obj.code=="1"){
                		$("#mobile1").removeClass("hide");
                		$("#mobile1").html(obj.msg);
                		return;
                	}else if(obj.code=="2"){
                		$("#opName1").removeClass("hide");
                		$("#opName1").html(obj.msg);
                		return;
                	}else if(obj.code=="3"){
                		$("#code1").removeClass("hide");
                		$("#code1").html(obj.msg);
                		return;
                	}else if(obj.msg=="注册成功"){
                		window.location.href='component/register/RegSucceed.jsp';
                	}
                }
			}
		});
	});
	$('#mobile').focus(function() { 
		$("#mobile1").addClass("hide");
		}); 
	$('#opName0').focus(function() { 
		$("#opName1").addClass("hide");
		}); 
	$('#code').focus(function() { 
		$("#code1").addClass("hide");
		}); 
	$('#passwordhash0')
			.keyup(
					function() {
						var strongRegex = new RegExp(
								"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$",
								"g");
						var mediumRegex = new RegExp(
								"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$",
								"g");
						var enoughRegex = new RegExp("(?=.{1,}).*", "g");

						if (false == enoughRegex.test($(this).val())) {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass(' pw-defule');
							// 密码小于六位的时候，密码强度图片都为灰色
						} else if (strongRegex.test($(this).val())) {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass(' pw-strong');
							// 密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
						} else if (mediumRegex.test($(this).val())) {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass(' pw-medium');
							// 密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
						} else {
							$('#level').removeClass('pw-weak');
							$('#level').removeClass('pw-medium');
							$('#level').removeClass('pw-strong');
							$('#level').addClass('pw-weak');
							// 如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
						}
						return true;
					});
	
	$('#changepwd')
	.keyup(
			function() {
				var strongRegex = new RegExp(
						"^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$",
						"g");
				var mediumRegex = new RegExp(
						"^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$",
						"g");
				var enoughRegex = new RegExp("(?=.{1,}).*", "g");

				if (false == enoughRegex.test($(this).val())) {
					$('#level').removeClass('pw-weak');
					$('#level').removeClass('pw-medium');
					$('#level').removeClass('pw-strong');
					$('#level').addClass(' pw-defule');
					// 密码小于六位的时候，密码强度图片都为灰色
				} else if (strongRegex.test($(this).val())) {
					$('#level').removeClass('pw-weak');
					$('#level').removeClass('pw-medium');
					$('#level').removeClass('pw-strong');
					$('#level').addClass(' pw-strong');
					// 密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
				} else if (mediumRegex.test($(this).val())) {
					$('#level').removeClass('pw-weak');
					$('#level').removeClass('pw-medium');
					$('#level').removeClass('pw-strong');
					$('#level').addClass(' pw-medium');
					// 密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
				} else {
					$('#level').removeClass('pw-weak');
					$('#level').removeClass('pw-medium');
					$('#level').removeClass('pw-strong');
					$('#level').addClass('pw-weak');
					// 如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
				}
				return true;
			});
	
    $("#localImag1").click(function(){
    	$("#cardFront").click();
    });
    
	$("#cardFront").on({
	"change":function(){
		var fileName=$(this).val();
		var flag=checkFile(fileName);
		$("#local1").val("");
		if(!flag){
			$("#preview1").attr("src","component/register/img/zheng.png");
			return;
		}else{
			try{
			var file;
			var imgURL
			var node = $(this)[0];
			if(node.files && node.files[0] ){  
                file = node.files[0];  
            }else if(node.files && node.files.item(0)) {  
                file = node.files.item(0);  
            }  
			 try{  
	                imgURL =  file.getAsDataURL();  
	            }catch(e){  
	            	imgURL = window.URL.createObjectURL(file);  
	            }  
	        }catch(e){
	            if (node.files && node.files[0]) {  
	                var reader = new FileReader();  
	                reader.onload = function (e) {  
	                    imgURL = e.target.result;  
	                };  
	                reader.readAsDataURL(imgURL.files[0]);  
	            }  
	        }  
	        $("#local1").val("123");
	        $("#preview1").attr("src",imgURL);
		}
	    	$("#formToUpdate1").ajaxSubmit({
				type : 'post',
				url : 'SysRegisterActionAjax_upCard1.action',
				dataType : 'json',
				success : function(data) {

				},
				error : function(XmlHttpRequest, textStatus, errorThrown) {
					console.log("上传异常,请联系管理员");
				}
			});
		}
	});
	 $("#localImag2").click(function(){
	    	$("#cardBack").click();
	    });
	$("#cardBack").on({
		"change" : function() {
			var fileName = $(this).val();
			var flag = checkFile(fileName);
			 $("#local2").val("");
			if (!flag) {
				$("#preview2").attr("src", "component/register/img/zheng.png");
				return;
			}else{
				try{
					var file;
					var imgURL
					var node = $(this)[0];
					if(node.files && node.files[0] ){  
		                file = node.files[0];  
		            }else if(node.files && node.files.item(0)) {  
		                file = node.files.item(0);  
		            }  
					 try{  
			                imgURL =  file.getAsDataURL();  
			            }catch(e){  
			            	imgURL = window.URL.createObjectURL(file);  
			            }  
			        }catch(e){
			            if (node.files && node.files[0]) {  
			                var reader = new FileReader();  
			                reader.onload = function (e) {  
			                    imgURL = e.target.result;  
			                };  
			                reader.readAsDataURL(imgURL.files[0]);  
			            }  
			        }  
			        $("#local2").val("123");
			        $("#preview2").attr("src",imgURL);
			}
			$("#formToUpdate2").ajaxSubmit({
				type : 'post',
				url : 'SysRegisterActionAjax_upCard2.action',
				dataType : 'json',
				success : function(data) {

				},
				error : function(XmlHttpRequest, textStatus, errorThrown) {
					console.log("上传异常,请联系管理员");
				}
			});
		}
	});
//	$("#subinfo").on({
//		"click" : function() {
//			var opRealname = $("#opRealname").val();
//			var mobile = $("#mobile").val();
//			var businesstelephone = $("#businesstelephone").val();
//			var opDep = $("#opDep").val();
//			var opOrg = $("#opOrg").val();
//			var opOrgAddr = $("#opOrgAddr").val();
//			var opName = $("#opName").val();
//			var code = $("#code").val();
//			var passwordhash = $("#passwordhash").val();
//			var $male = $('input:radio[id="male1"]:checked').val();
//			var sex;
//			if ($male != null) {
//				sex = '男';
//			} else {
//				sex = '女';
//			}
//			$.ajax({
//				type : "post",
//				url : "SysRegisterActionAjax_saveUser.action",
//				async : true,
//				data : {
//					"opRealname" : opRealname,
//					"mobile" : mobile,
//					"businesstelephone" : businesstelephone,
//					"opDep" : opDep,
//					"opOrg" : opOrg,
//					"opOrgAddr" : opOrgAddr,
//					"email" : opName,
//					"passwordhash" : passwordhash,
//					"code" : code,
//					"sex" : sex
//				},
//				dataType : 'text',
//				success : function(data) {
//
//				}
//			});
//
//		}
//	});
});
function checkFile(fileName) {
	if (null == fileName || "" == fileName) {
		$("#vipInfoUpload").find(".vipInfo").html("请选择上传文件");
		$("#vipInfoUpload").modal("show");
		return false;
	} else {
		if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(fileName)) {
			$("#vipInfoUpload").find(".vipInfo").html("请选择正确的文件");
			$("#vipInfoUpload").modal("show");
			return false;
		}
		return true;
	}
}
String.prototype.endWith = function(endStr) {
	var d = this.length - endStr.length;
	return (d >= 0 && this.lastIndexOf(endStr) == d);
}
