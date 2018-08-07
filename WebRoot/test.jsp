<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'test.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/test.js"></script>
	</head>

	<body>
		<p id="2" >This is my JSP page.<p>
		<br>
		<div id="1">
		<table width="200" border="2" id="fade">
			<tbody>
				<tr>
					<td>
						&nbsp;22
					</td>
					<td>
						33&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;44
					</td>
					<td>
						&nbsp;55
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;66
					</td>
					<td>
						&nbsp;77
					</td>
				</tr>
			</tbody>
		</table>
		&nbsp;
		</div>
	</body>
	
</html>
