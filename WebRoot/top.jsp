<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҳ��</title>
		<script language=JavaScript>
function logout(){
	if (confirm("��ȷ��Ҫ�˳����������"))
	top.location = "login.html";
	return false;
}
</script>
		<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
		<meta http-equiv=Content-Type content=text/html;charset=gb2312>
		<script language=JavaScript1.2>
function showsubmenu(sid) {
	var whichEl = eval("submenu" + sid);
	var menuTitle = eval("menuTitle" + sid);
	if (whichEl.style.display == "none"){
		eval("submenu" + sid + ".style.display=\"\";");
	}else{
		eval("submenu" + sid + ".style.display=\"none\";");
	}
}
</script>
		<base target="main">
		<link href="images/skin.css" rel="stylesheet" type="text/css">
	</head>
	<body leftmargin="0" topmargin="0">
		<table width="100%" height="64" border="0" cellpadding="0"
			cellspacing="0" class="admin_topbg">
			<tr>
				<td width="40%" height="64">
					<img src="images/logo.gif" height="64">
				</td>
				<td width="60%" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							
							<td valign="bottom" class="admin_txt" height="64">
								<font color="#fffff"><%=session.getAttribute("username")%><b>
										����,��л��½ʹ�ã� 
								</font>
								
							</td>
							<!--  <td width="50"   align="left"><img src="images/0031.gif"></td> -->
							<td width="100" align="left" >
								<input type="button" value="��ҳ"
									onclick="javascript:window.top.frames['main'].location='right.jsp';" />
							</td>
							<td width="100" align="left" >								
									<input type="button" value="��ǰ"
									onclick="javascript:window.top.frames['main'].history.forward();"/> 
							</td>
							<td width="100" align="left" >								
									<input type="button" value="���"
									onclick="javascript:window.top.frames['main'].history.back();"/> 
							</td>
							<td width="100" align="left" >
								
										<input type="button" value="�˳�"
									onclick="logout();"/> 
							</td>

						</tr>

					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
