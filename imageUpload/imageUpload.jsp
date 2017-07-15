<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	function setImagePreview1() {
		var docObj = document.getElementById("browsefile1");
		var imgObjPreview = document.getElementById("preview1");
		if (docObj.files && docObj.files[0]) {
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '320px';
			imgObjPreview.style.height = '180px';
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag1");
			localImagId.style.width = "320px";
			localImagId.style.height = "180px";
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
			imgObjPreview.style.width = '320px';
			imgObjPreview.style.height = '180px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();  
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜  
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag2");
			//必须设置初始大小  
			localImagId.style.width = "320px";
			localImagId.style.height = "180px";
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
</head>
<div class="form-group col-lg-6">
						<div id="localImag1">
							<img id="preview1" width=-1 height=-1 style="text-align: center">
						</div>
						<div style="text-align: center">
							<input type=file name="doc1" id="browsefile1"
								onchange="javascript:setImagePreview1();"
								style="visibility: hidden"> <input
								id="javascript:setImagePreview1();" placeholder="请上传名片正面照">
							<input class="file" type=button id="doc1" value=选择
								onclick="browsefile1.click()">
						</div>
					</div>

					<div class="form-group col-lg-6">
						<div id="localImag2">
							<img id="preview2" width=-1 height=-1 style="text-align: center">
						</div>
						<div style="text-align: center">
							<input type=file name="doc1" id="browsefile2"
								onchange="javascript:setImagePreview2();"
								style="visibility: hidden"> <input
								id="javascript:setImagePreview2();" placeholder="请上传名片反面照">
							<input class="file" type=button id="doc2" value=选择
								onclick="browsefile2.click()">
						</div>
					</div>
