/**
只粘贴了部分script
一开始出现了浏览器不兼容的问题
在火狐浏览器打开时
出现导航栏显示错乱（下拉栏粘连）
对菜单里的两个选项分别做了
”悬浮“处理后可显示正常
*/

<script id="menu-tpl" type="text/html">
			<ul class="nav navbar-nav">
			{{# layui.each(d, function(index, item){ }}
				
			<li class="index_nav {{# if(item.sub && item.sub.length > 0){ }} dropdown com_ins_nav {{# } }} ">
				<a {{# if(item.sub && item.sub.length > 0){ }} class="dropdown-toggle" {{# } }}
					{{# if(item.viewpointMenuUrl == "javascript:void(0)"||item.viewpointMenuUrl == "#"){ }}
 						href="javascript:void(0)">
					{{# } else { }}
						href="<%=basePath%>{{item.viewpointMenuUrl}} " target="_self">
					{{# } }}
					{{item.viewpointMenuName}}
					{{# if(item.sub && item.sub.length > 0){ }} <b class="caret"></b> {{# } }} 
				</a>
			{{# if(item.sub.length > 0){ }}
			<ul class="com_dropdown_menu dropdown-menu">
			{{# layui.each(item.sub, function(i, node){ }}
					<li>
						<a target="_self" href="<%=basePath%>{{node.viewpointMenuUrl}}">{{node.viewpointMenuName}}</a>
					</li>
			{{# }); }}
			</ul>
			{{# } }}
			</li>
			 {{# }); }}
		</ul>
		</script>


<!-- 导航 -->
<nav class="com_nav" id="menu-view" >
	
</nav>

/**
两次悬浮处理
*/
<script>
$(document).ready(function(){
	  	$(".com_ins_nav1").hover(function(){
	  	console.log("gaga")
	    $(".com_dropdown_menu").css("display","block");
	    },function(){
	    $(".com_dropdown_menu").css("display","none");}
  		);
  		
  		$("#userNafmiiLogout").on("click",function(){
	    	window.location.href="<%=basePath%>nafmiiLogout.action";
	    });
});

$(document).ready(function(){
  	$(".com_ins_nav2").hover(function(){
  	console.log("gaga")
    $(".com_dropdown_menu").css("display","block");
    },function(){
    $(".com_dropdown_menu").css("display","none");}
		);
		
		$("#userNafmiiLogout").on("click",function(){
    	window.location.href="<%=basePath%>nafmiiLogout.action";
    });
});
</script>

<script>
	var menuView = document.getElementById("menu-view");
	var menuTpl = document.getElementById("menu-tpl");
	var getMenuTpl = menuTpl.innerHTML;
	layui.use([ 'laytpl' ], function() {
		var laytpl = layui.laytpl;
		$.getJSON("<%=basePath%>PmsViewpointAction_getCommonMenu.action", function(data) {
			var menu = transformTozTreeFormat(data);
			laytpl(getMenuTpl).render(menu, function(html) {
				menuView.innerHTML = html;
				 $(".dropdown").mouseover(function () {
			        $(this).addClass("open");
			    });
			
			    $(".dropdown").mouseleave(function(){
			        $(this).removeClass("open");
			    });

			});
		});
	});
