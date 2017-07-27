<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userName = (String) request.getSession().getAttribute("realName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="/component/front/include/commonHeaderExcludeEchart.jsp"%>

<link rel="stylesheet"
	href="component/front/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="component/front/css/normal.css">
<link rel="stylesheet" href="component/front/css/index.css">
<link rel="stylesheet"
	href="component/front/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet/less" type="text/css"
	href="component/front/css/index.less">
<link rel="stylesheet/less" type="text/css"
	href="component/front/bootstrap/css/fenye.css">
<script src="component/front/js/jquery-1.11.3.js"></script>
<script src="component/front/bootstrap/js/bootstrap.min.js"></script>
<script src="component/front/js/less-1.7.0.min.js"></script>
<script type="text/javascript"
	src="component/front/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="component/front/layui/layui.js"></script>
<script type="text/javascript"
	src="component/include/popupSelection/jquery.pagination.js"></script>
<script type="text/javascript" src="component/front/js/map-plugin.js"></script>
<script type="text/javascript" src="component/include/idvalidate.js"></script>
<script type="text/javascript" src="component/front/js/jquery.form.js"></script>
<script type="text/javascript"
	src="component/register/js/bootstrap.min.js"></script>
<script src="component/front/js/less-1.7.0.min.js"></script>
<script type="text/javascript" src="component/front/layui/layui.js"></script>
<link href="component/register/css/personalCenter.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="component/register/css/jquery-labelauty.css">
<script src="component/register/js/jquery-labelauty.js"></script>
<script src="component/register/js/personalCenter.js"></script>
<!-- <script src="component/register/js/registerCheck.js"></script> -->
<link rel="stylesheet/less" type="text/css"
	href="component/front/css/index.less">
<script type="text/javascript"
	src="component/register/js/bootstrapValidator.js"></script>
<link rel="stylesheet" type="text/css"
	href="component/register/css/bootstrapValidator.css">
<title>个人中心</title>

<style>
input.labelauty+label {
	font: 12px "Microsoft Yahei";
}
</style>

<script>
	$(function() {
		$('.gender').labelauty();
	});
</script>

<style>
#tab1 {
	background: #FFFFFF;
	border-right-color: #FFFFFF;
}
</style>

</head>
<body>

	<%@include file="/component/front/include/menu.jsp"%>

	<div class="container-fluid" align="center">

		<div id="leftpart">
			<nav class="nav1" id="navigator">
				<div id="portrait">
					<div id="circle">
						<p id="showName" style="float: center;"><%=userName%></p>
						<!-- <img src="component/register/img/portrait.png"
						style="text-align: center；"> -->
					</div>

				</div>
				<ul class="ulmenu1">
					<li><a id="tab1" href="component/register/EditProfile.jsp"><span
							class="glyphicon glyphicon-user"
							style="color: rgb(19, 111, 170);"></span>&nbsp;&nbsp;用户信息</a></li>
					<li><a id="tab2" href="component/register/ChangePwd.jsp"><span
							class="glyphicon glyphicon-pencil"
							style="color: rgb(19, 111, 170);"></span>&nbsp;&nbsp;修改密码</a></li>
					<li><a id="tab3" href="#"><span
							class="glyphicon glyphicon-star-empty"
							style="color: rgb(19, 111, 170);"></span>&nbsp;&nbsp;我的收藏</a></li>
					<li><a id="tab4" href="#"><span
							class="glyphicon glyphicon-comment"
							style="color: rgb(19, 111, 170);"></span>&nbsp;&nbsp;订阅信息</a></li>
					<li><a id="tab5" href="#"><span
							class="glyphicon glyphicon-time"
							style="color: rgb(19, 111, 170);"></span>&nbsp;&nbsp;浏览历史</a></li>
					<li><a id="tab6" href="#"><span
							class="glyphicon glyphicon-bell"
							style="color: rgb(19, 111, 170);"></span>&nbsp;&nbsp;消息中心 </a><span
						class='air'>1</span></li>
				</ul>
			</nav>
			<div id="blankpart"></div>
		</div>


		<div id="rightpart" style="width: 80%; float: right; margin-right: 0">
			<form id="defaultForm" role="form">

				<!-- <h3 class="title" id="userinfo">
					<strong>用户信息</strong>
				</h3>
				<a id="rightline"></a> -->

				<div class="form-group col-lg-12" style="margin-top: 5%;">
					<h3 class="title" id="personalinfo" style="float:left">
						<strong>个人信息</strong>
					</h3>
					<!-- <div id="leftline"></div> -->
				</div>

				<div class="form-group col-lg-6">
					<input type="text" placeholder="用户名" class="form-control"
						id="opName0" name="opName0" type="email" disabled="disabled" />
				</div>


				<div class="form-group col-lg-6" id="sex">
					<div class="form-group col-sm-4" id="gender">
						<p>性 别</p>
					</div>


					<div class="form-group col-sm-4" id="male">
						<input class="gender" id="male1" type="radio" name="radio"
							data-labelauty="男" checked disabled="disabled" />
					</div>

					<div class="form-group col-sm-4" id="female">
						<input class="gender" id="female1" type="radio" name="radio"
							data-labelauty="女" disabled="disabled" />
					</div>

				</div>

				<div class="form-group col-lg-6">
					<input type="text" placeholder="真实姓名" class="form-control"
						id="opRealname" name="opRealname" maxlength="10"
						disabled="disabled" />
				</div>


				<div class="form-group col-lg-6">
					<input type="text" placeholder="手机号码" class="form-control"
						id="mobile" name="mobile">
					<p id="mobile1" class="hide" style="color: red"></p>
				</div>

				<div class="form-group col-lg-12" style="margin-top: 3%;">
					<h3 class="title" id="companyinfo">
						<strong>单位信息</strong>
					</h3>
					<!-- <div id="rightline"></div> -->
				</div>

				<div class="form-group col-lg-12">
					<input type="text" placeholder="单位名称" class="form-control"
						id="opOrg" name="opOrg" disabled="disabled" />
				</div>

				<div class="form-group col-lg-6">
					<input type="text" placeholder="所在部门" class="form-control"
						id="opDep" name="opDep">
				</div>

				<div class="form-group col-lg-6">
					<input type="text" placeholder="办公电话" class="form-control"
						id="businesstelephone" name="businesstelephone">
				</div>

				<div class="form-group col-lg-12">
					<input type="text" placeholder="公司地址" class="form-control"
						id="opOrgAddr" name="opOrgAddr" disabled="disabled" />
				</div>

				<div class="form-group col-lg-6" align="center">
					<div id="localImag1">
						<img id="preview1" src="component/register/img/zheng.png"
							style="cursor: pointer; text-align: center；"> <input
							id="local1" name="local1" class="form-control"
							style="height: 0px; visibility: hidden">
					</div>
					<p style="float: left; color: #888;">名片正面照</p>
					<a style="float: right; cursor: pointer" data-toggle="modal"
						data-target="#openFront">预览</a>
				</div>

				<div class="form-group col-lg-6" align="center">
					<div id="localImag2">
						<img id="preview2" src="component/register/img/fan.png"
							style="cursor: pointer; text-align: center"> <input
							id="local2" name="local2" class="form-control"
							style="height: 0px; visibility: hidden">
					</div>
					<p style="float: left; color: #888;">名片反面照</p>
					<a style="float: right; cursor: pointer" data-toggle="modal"
						data-target="#openFront">预览</a>
				</div>

				<div class="form-group col-lg-12">
					<button class="btn btn-lg btn-primary btn-block" id="subinfo"
						style="width: 20%; float: left; margin-top: 1%" type="submit">保存修改</button>
				</div>

			</form>

		</div>


	</div>

	<form id="formToUpdate1" method="post" action="#"
		enctype="multipart/form-data">
		<div style="text-align: center">
			<input type=file id="cardFront" name="cardFront" class="fir_form_com"
				style="visibility: hidden">
		</div>
	</form>

	<form id="formToUpdate2" method="post" action="#"
		enctype="multipart/form-data">
		<div style="text-align: center">
			<input type=file id="cardBack" name="cardBack" class="fir_form_com"
				style="visibility: hidden">
		</div>
	</form>

	<footer class="all_footer">
		<p>版权所有 © 中国银行间市场交易商协会 未经授权 不得转载</p>
		<p>Copyright © National Association of Financial Market
			Institutional Investors All Rights Reserved.</p>
	</footer>

	<div class="modal fade" id="openFront" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h1 class="modal-title" style="text-align: center">名片正面照</h1>
				</div>
				<img id="preview11" src="component/register/img/zheng.png">
			</div>
		</div>
	</div>

	<div class="modal fade" id="openBack" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="font-weight: bold">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h1 class="modal-title" style="text-align: center">名片反面照</h1>
				</div>
				<img id="preview22" src="component/register/img/fan.png">
			</div>
		</div>
	</div>

</body>
</html>
