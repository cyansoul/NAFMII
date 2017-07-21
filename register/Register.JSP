<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/component/front/include/commonJava.jsp"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/component/front/include/commonHeaderExcludeEchart.jsp"%>

<script type="text/javascript" src="component/register/js/bootstrap.js"></script>
<script src="component/front/js/less-1.7.0.min.js"></script>
<script type="text/javascript" src="component/front/layui/layui.js"></script>

<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="component/register/css/stylesheet.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="component/register/css/jquery-labelauty.css">
<script src="component/register/js/jquery-labelauty.js"></script>
<script src="component/register/js/register.js"></script>
<script src="component/register/js/registerCheck.js"></script>
<link rel="stylesheet/less" type="text/css"
	href="component/front/css/index.less">

<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="component/register/js/bootstrapValidator.js"></script>
<link rel="stylesheet" type="text/css"
	href="component/register/css/bootstrapValidator.css">

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
		var docObj = document.getElementById("cardFront");
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
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>
<script type="text/javascript">
	function setImagePreview2() {
		var docObj = document.getElementById("cardBack");
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
	$(function() {
		$('.gender').labelauty();
	});
</script>

<style type="text/css">
/*密码强度*/
.pw-strength {
	clear: both;
	position: relative;
	top: 20px;
}

.pw-bar {
	background: url("component/register/images/pwd-1.png") no-repeat;
	height: 14px;
	overflow: hidden;
	width: 179px;
}

.pw-bar-on {
	background: url("component/register/images/pwd-2.png") no-repeat;
	width: 0px;
	height: 14px;
	position: absolute;
	top: 0px;
	left: 2px;
	transition: width .5s ease-in;
	-moz-transition: width .5s ease-in;
	-webkit-transition: width .5s ease-in;
	-o-transition: width .5s ease-in;
}

.pw-weak .pw-defule {
	width: 0px;
}

.pw-weak .pw-bar-on {
	width: 60px;
}

.pw-medium .pw-bar-on {
	width: 120px;
}

.pw-strong .pw-bar-on {
	width: 179px;
}

.pw-txt {
	padding-top: 2px;
	width: 180px;
	overflow: hidden;
}

.pw-txt span {
	color: #707070;
	float: left;
	font-size: 15px;
	text-align: center;
	width: 58px;
}
</style>

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
		<div id="leftpart" class="col-md-8">
			<div align="center" style="margin-bottom: 8%;">
				<h3 class="title" id="personalinfo">
					<strong>个人信息</strong>
				</h3>
				<a id="leftline"></a>
			</div>

			<div class="form-group col-lg-6">
				<input type="text" placeholder="真实姓名" class="form-control"
					id="opRealname" name="opRealname">
			</div>


			<div class="form-group col-lg-6" id="sex">
				<div class="form-group col-sm-4" id="gender">
					<p>性 别</p>
				</div>


				<div class="form-group col-sm-4" id="male">
					<input class="gender" id="male1" type="radio" name="radio"
						data-labelauty="男" checked>
				</div>

				<div class="form-group col-sm-4" id="female">
					<input class="gender" id="female1" type="radio" name="radio"
						data-labelauty="女">
				</div>

			</div>

			<div class="form-group col-lg-6">
				<input type="text" placeholder="手机号码" class="form-control"
					id="mobile" name="mobile">
			</div>


			<div class="form-group col-lg-6">
				<input type="text" placeholder="办公电话" class="form-control"
					id="businesstelephone" value="">
			</div>


			<div class="form-group col-lg-12">
				<input type="text" placeholder="单位名称" class="form-control"
					id="opOrg" name="opOrg">
			</div>

			<div class="form-group col-lg-12">
				<input type="text" placeholder="所在部门" class="form-control"
					id="opDep" name="opDep">
			</div>

			<div class="form-group col-lg-12">
				<input type="text" placeholder="公司地址" class="form-control"
					id="opOrgAddr" name="opOrgAddr">
			</div>

			<div class="form-group col-lg-6" align="center">
				<div id="localImag1">
					<input type=file class="form-control" name="cardFront"
						id="javascript:setImagePreview1();" style="display: none"
						class="fir_form_com"> <img id="preview1"
						src="component/register/img/zheng.png"
						style="cursor: pointer; text-align: center；"
						onclick="cardFront.click()">
				</div>
				<form id="formToUpdate1" method="post" action="#"
					enctype="multipart/form-data">
					<div style="text-align: center">
						<input type=file id="cardFront" name="cardFront"
							class="fir_form_com" onchange="javascript:setImagePreview1();"
							style="visibility: hidden">
					</div>
				</form>
			</div>

			<div class="form-group col-lg-6" align="center">
				<div id="localImag2">
					<input type=file class="form-control" name="cardBack"
						id="javascript:setImagePreview2();" style="display: none">
					<img id="preview2" src="component/register/img/fan.png"
						style="cursor: pointer; text-align: center"
						onclick="cardBack.click()">
				</div>
				<form id="formToUpdate2" method="post" action="#"
					enctype="multipart/form-data">
					<div style="text-align: center">
						<input type=file id="cardBack" name="cardBack"
							class="fir_form_com" onchange="javascript:setImagePreview2();"
							style="visibility: hidden">
					</div>
				</form>
			</div>
		</div>
		
		<div id="rightpart" class="col-md-4">
			<div align="center" style="margin-bottom: 15%;">
				<h3 class="title" id="userinfo">
					<strong>用户信息</strong>
				</h3>
				<a id="rightline"></a>
			</div>

			<form id="defaultForm" role="form">

				<div class="form-group col-lg-12" id="username">
					<input type="text" placeholder="用户名" class="form-control"
						id="opName" name="opName" type="email"
						data-bv-emailaddress-message="The input is not a valid email address">
				</div>

				<div class="form-group col-lg-12">
					<input type="password" placeholder="设置密码" class="form-control"
						id="passwordhash" name="passwordhash">
				</div>

				<div class="form-group col-lg-12">
					<div class="form-group col-sm-4" id="gender">
						<p style="font-size: 15px; margin-top: 45%; float: left">安全等级</p>
					</div>
					<div class="form-group col-sm-8">
						<table style="margin: 5% 0; float: right">
							<tr>
								<td id="level" class="pw-strength">
									<div class="pw-bar"></div>
									<div class="pw-bar-on"></div>
									<div class="pw-txt">
										<span>弱</span> <span>中</span> <span>强</span>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="form-group col-lg-12">
					<input type="password" placeholder="确认密码" class="form-control"
						id="passwordhash1" name="passwordhash1">
				</div>

				<div class="form-group col-lg-12"></div>

				<div class="form-group col-lg-15">
					<div class="form-group col-sm-5">
						<input class="form-control" id="code" name="captcha" type="text"
							placeholder="验证码">
					</div>
					<div class="form-group col-sm-5">
						<span class="form-control text-center" id=codeCheck> <img
							title="不区分大小写" id="codeImage"
							src="<%=basePath%>CodeImage.jsp?rdm=
							+Math.random()"
							style="vertical-align: middle;"></span>
					</div>
					<div>
						<p
							style="cursor: pointer; font-size: 14px; float: left; margin-top: 2%;">
							<a onclick="changeCodeImg();" style="height: 50px">换一张</a>
						</p>

					</div>
				</div>

				<div class="form-group col-lg-12">
					<input id="rule" name="rule" type="checkbox" checked="" style="">
					<label for="rule" id="mycheck"> <a
						style="text-decoration: underline; color: black">同意《中国银行间市场交易商协会服务条款》</a></label>
				</div>

				<div class="form-group col-lg-12"></div>

				<div class="form-group">
					<button class="btn btn-lg btn-primary btn-block" type="submit">立即注册</button>
				</div>

			</form>
		</div>
	</div>

	<footer class="all_footer">
		<p>版权所有 © 中国银行间市场交易商协会 未经授权 不得转载</p>
		<p>Copyright © National Association of Financial Market
			Institutional Investors All Rights Reserved.</p>
	</footer>
	<div class="modal fade" id="vipInfoUpload" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">操作</h4>
				</div>
				<div class="modal-body vipInfo"></div>
				<div class="modal-footer">
					<button id="close1" type="button" class="btn btn-default"
						data-dismiss="modal" style="margin-bottom: 10px;">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
