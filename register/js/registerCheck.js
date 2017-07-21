$(function() {/* 文档加载，执行一个函数 */
	$('#defaultForm').bootstrapValidator({
		fields : {/* 验证：规则 */
			opRealname : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请填写真实姓名'
					},

					threshold : 1, // 有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
					remote : {// ajax验证。server
						// result:{"valid",true or
						// false}
						// 向服务发送当前input
						// name值，获得一个json数据。例表示正确：{"valid",true}
						url : 'exist2.do',// 验证地址
						message : '用户已存在',// 提示消息
						delay : 2000,// 每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
						type : 'POST'// 请求方式
					/**
					 * 自定义提交数据，默认值提交当前input value data:
					 * function(validator) { return { password:
					 * $('[name="passwordNameAttributeInYourForm"]').val(),
					 * whatever:
					 * $('[name="whateverNameAttributeInYourForm"]').val() }; }
					 */
					},
				}
			},
			passwordhash : {
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
						field : 'passwordhash',
						message : '两次密码不一致'
					},
				}
			},
			opName : {
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
			cardFront : {// 验证input项：验证规则
				validators : {
					notEmpty : {// 非空验证：提示消息
						message : '请上传图片'
					},
				},
			},
			cardBack : {// 验证input项：验证规则
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
			 
//			captcha : {
//				validators : {
//					notEmpty : {//非空验证：提示消息
//						message : '请填写验证码'
//					},
//					callback : {
//						message : 'Wrong answer',
//						callback : function(value, validator) {
//							return value == $("#valica").val();
//						}
//					}
//				}
//			}

		},

	}).on('success.form.bv', function(e) {//点击提交之后
		// Prevent form submission
		e.preventDefault();

		// Get the form instance
		var $form = $(e.target);

		// Get the BootstrapValidator instance
		var bv = $form.data('bootstrapValidator');

		// Use Ajax to submit form data 提交至form标签中的action，result自定义
		$.post($form.attr('action'), $form.serialize(), function(result) {
			//do something...
		});
	});
});