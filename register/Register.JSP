<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<link rel="stylesheet"
	href="component/front/bootstrap/css/bootstrap.min.css">
<script src="component/front/js/jquery-1.11.3.js"></script>
<script src="component/front/bootstrap/js/bootstrap.min.js"></script>
<script src="component/front/js/less-1.7.0.min.js"></script>
<script type="text/javascript"
	src="UIplug/echarts-2.2-2.7/build/dist/echarts-all.js"></script>
<script type="text/javascript" src="component/front/layui/layui.js"></script>
<script type="text/javascript" src="component/include/idvalidate.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link href="component/register/css/stylesheet.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="component/register/css/jquery-labelauty.css">
<script src="component/register/js/jquery-1.8.3.min.js"></script>
<script src="component/register/js/jquery-labelauty.js"></script>
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
<title>注册</title>
<script type="text/javascript">
	function changeCodeImg() {
		document.getElementById("codeImage").src = "/NAFMII/CodeImage.jsp?rdm="
				+ Math.random();
		document.getElementById("valica").value = "";
		document.getElementById("valica").focus();
	}
</script>
<script type="text/javascript">
	function setImagePreview1() {
		var docObj = document.getElementById("browsefile1");
		var imgObjPreview = document.getElementById("preview1");
		if (docObj.files && docObj.files[0]) {
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '100%';
			imgObjPreview.style.height = '75%';
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag1");
			localImagId.style.width = "100%";
			localImagId.style.height = "75%";
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>
<script type="text/javascript">
	function setImagePreview2() {
		var docObj = document.getElementById("browsefile2");
		var imgObjPreview = document.getElementById("preview2");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性  
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '100%';
			imgObjPreview.style.height = '75%';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();  
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜  
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag2");
			//必须设置初始大小  
			localImagId.style.width = "100%";
			localImagId.style.height = "75%";
			//图片异常的捕捉，防止用户修改后缀来伪造图片  
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>

<style>
ul {
	list-style-type: none;
}

li {
	display: inline-block;
}

li {
	margin: 10px 0;
}

input.labelauty+label {
	font: 12px "Microsoft Yahei";
}
</style>

<script>
$(function(){
	$(':input').labelauty();
});
</script>

</head>
<body>
	<header class="com_header">
		<figure class="com_logo_wrap">
			<img src="component/register/img/logo.png">
		</figure>
		<ul class="com_person_info list-inline">
			<li style="cursor: pointer;"><p style="font-size: 14px;">
					<a>已有账号，直接登陆</a>
				</p></li>
			<li><p style="font-size: 14px;">｜</p></li>
			<li style="cursor: pointer;"><p style="font-size: 14px;">
					<a>返回</a>
				</p>
		</ul>
	</header>

	<div class="container-fluid" align="center">
			<div class="container">
				<div id="leftpart" class="col-md-8">
					<div class="form-group col-lg-12" align="left"
						style="margin-bottom: 5%">
						<h4 class="title">
							<strong>个人信息</strong>
						</h4>
					</div>
					<div class="form-group col-lg-6">
						<input type="text" placeholder="真实姓名" class="form-control" id=""
							value="">
					</div>

					<div class="form-group col-lg-6">
						<div class="form-group col-sm-4" id="gender">
							<p>性 别</p>
						</div>


						<div class="form-group col-sm-4" id="male">
							<input class="labelauty-checked" type="radio" name="radio" data-labelauty="男">
						</div>

						<div class="form-group col-sm-4" id="female">
							<input class="labelauty-unchecked" type="radio" name="radio" data-labelauty="女">
						</div>

					</div>

					<div class="form-group col-lg-12"></div>


					<div class="form-group col-lg-6">
						<input type="text" placeholder="手机号码" class="form-control" id=""
							value="">
					</div>

					<div class="form-group col-lg-6">
						<input type="text" placeholder="办公电话" class="form-control" id=""
							value="">
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-12">
						<input type="text" placeholder="单位名称" class="form-control" id=""
							value="">
					</div>
					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-12">
						<input type="text" placeholder="所在部门" class="form-control" id=""
							value="">
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-12">
						<input type="text" placeholder="公司地址" class="form-control" id=""
							value="">
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-6" align="center">
						<div id="localImag1">
							<input type=file id="javascript:setImagePreview1();"
								style="display: none"> <img id="preview1"
								src="component/register/img/zheng.png" width=-1 height=-1
								style="cursor: pointer; text-align: center；"
								onclick="browsefile1.click()">
						</div>
						<div style="text-align: center">
							<input type=file id="browsefile1"
								onchange="javascript:setImagePreview1();"
								style="visibility: hidden">
						</div>
					</div>

					<div class="form-group col-lg-6" align="center">
						<div id="localImag2">
							<input type=file id="javascript:setImagePreview2();"
								style="display: none"> <img id="preview2"
								src="component/register/img/fan.png" width=-1 height=-1
								style="cursor: pointer; text-align: center"
								onclick="browsefile2.click()">
						</div>
						<div style="text-align: center">
							<input type=file id="browsefile2"
								onchange="javascript:setImagePreview2();"
								style="visibility: hidden">
						</div>
					</div>
				</div>

				<div id="rightpart" class="col-md-4" style="margin-bottom: 5%">
					<div class="form-group col-lg-12" align="left">
						<h4 class="title">
							<strong>用户信息</strong>
						</h4>
					</div>
					<div class="form-group col-lg-12" style="margin-top: 10px">
						<input type="text" placeholder="用户名" class="form-control" id=""
							value="">
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-12">
						<input type="password" placeholder="设置密码" class="form-control"
							id="" value="">
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-12">
						<input type="password" placeholder="确认密码" class="form-control"
							id="" value="">
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-15">
						<div class="form-group col-sm-5">
							<input class="form-control" id="valica" name="code" type="text"
								placeholder="验证码">
						</div>
						<div class="form-group col-sm-4">
							<span class="form-control text-center"> <img
								title="不区分大小写" id="codeImage"
								src="http://localhost:8080/NAFMII/CodeImage.jsp"
								style="vertical-align: middle;"></span>
						</div>
						<div class="form-group col-sm-3">
							<p style="font-size: 15px; float: left">
								<a onclick="changeCodeImg();"
									style="vertical-align: middle; cursor: pointer;">换一张</a>
							</p>

						</div>
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-12">
						<label class="checkbox" style="margin-left: 13px"><input
							id="mycheck" type="checkbox" name="checkbox" checked=""><a
							style="text-decoration: underline; color: black">同意《中国银行间市场交易商协会服务条款》</a></label>
					</div>

					<div class="form-group col-lg-12"></div>

					<div class="form-group col-lg-12" align="center">
						<a href="#" class="btn btn-lg btn-info" style="width: 200px;">立即注册</a>
					</div>

				</div>
			</div>
	</div>

	<footer class="all_footer">
		<p>版权所有 © 中国银行间市场交易商协会 未经授权 不得转载</p>
		<p>Copyright © National Association of Financial Market
			Institutional Investors All Rights Reserved.</p>
	</footer>
</body>
