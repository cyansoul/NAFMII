
var count = true;
//firefox下检测状态改变只能用oninput,且需要用addEventListener来注册事件。   
var datas;
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
					}
				}
			}
		}
	}).on('success.form.bv', function(e) {//点击提交之后
		// Prevent form submission
		e.preventDefault();

		// Get the form instance
		var $form = $(e.target);

		// Get the BootstrapValidator instance
		var bv = $form.data('bootstrapValidator');
		// Use Ajax to submit form data 提交至form标签中的action，result自定义
		var mobile = $("#mobile").val();
		var businesstelephone = $("#businesstelephone").val();
		var opDep = $("#opDep").val();
		$.ajax({
			type : "post",
			url : "SysRegisterActionAjax_upDateUserMessage.action",
			async : true,
			data : {
				"mobile" : mobile,
				"businesstelephone" : businesstelephone,
				"opDep" : opDep
			},
			dataType : 'text',
			success : function(data) {
              var obj = JSON.parse(data);  
              if(obj.flag=="success"){
              	if(obj.code=="1"){
              		$("#mobile1").removeClass("hide");
              		$("#mobile1").html(obj.msg);
              		$("#returnMessage1").find(".vipInfo").html(obj.msg);
        			$("#returnMessage1").modal("show");
              		return;
              	}else if(obj.msg=="修改成功"){
              		$("#returnMessage1").find(".vipInfo").html(obj.msg);
        			$("#returnMessage1").modal("show");
              	}
			}else{
				$("#returnMessage1").find(".vipInfo").html(obj.msg);
    			$("#returnMessage1").modal("show");
			}
			}
			});
	});
	$.ajax({
		type : "post",
		url : "SysRegisterActionAjax_preUserMessage.action",
		async : true,
		dataType : 'text',
		success : function(data) {
            var obj = JSON.parse(data);
              if(obj.flag=="success"){
            	$("#opRealname").val(obj.msg.opRealname);
          		$("#mobile").val(obj.msg.mobile);
          		$("#businesstelephone").val(obj.msg.businesstelephone);
          		$("#opDep").val(obj.msg.opDep);
          		$("#opOrg").val(obj.msg.opOrg);
          		$("#opOrgAddr").val(obj.msg.opOrgAddr);
          		$("#opName0").val(obj.msg.opName);
          		if(obj.msg.cardFront!=null){
          		$("#local1").val("123");
     	        $("#preview1").attr("src",obj.msg.cardFront);
     	        $("#preview11").attr("src",obj.msg.cardFront);
          		}
          		if(obj.msg.cardBack!=null){
     	        $("#local2").val("123");
   	            $("#preview2").attr("src",obj.msg.cardBack);
   	            $("#preview22").attr("src",obj.msg.cardBack);
          		}
   	            if(obj.msg.sex=='男'){
   	            	$("#male1").attr("checked",true);
   	            }else{
   	            	$("#female1").attr("checked",true);
   	            }
              }
		}
	});
	$('#mobile').focus(function() { 
		$("#mobile1").addClass("hide");
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
			$("#preview11").attr("src","component/register/img/zheng.png");
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
	        $("#preview11").attr("src",imgURL);
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
				$("#preview22").attr("src", "component/register/img/zheng.png");
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
			        $("#preview22").attr("src",imgURL);
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
	$.ajax({
		type : "post",
		url : "SysRegisterActionAjax_removeSessionForPhoto.action",
		async : true,
		dataType : 'text',
		success : function(data) {

		}
	});
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
