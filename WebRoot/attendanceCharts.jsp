<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<base href="<%=basePath%>">

		<title>考勤报表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/FusionCharts.js"></script>
	</head>

	<body>


		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="17" valign="top" background="images/mail_leftbg.gif">
					<img src="images/left-top-right.gif" width="17" height="29" />
				</td>
				<td valign="top" background="images/content-bg.gif">
					<table width="100%" height="31" cellpadding="0" cellspacing="0"
						class="left_topbg" id="table2">
						<tr>
							<td height="31">
								<div class="titlebt">
									统计分析:按员工姓名查看考勤报表
								</div>
							</td>
						</tr>
					</table>
				</td>
				<td width="16" valign="top" background="images/mail_rightbg.gif">
					<img src="images/nav-right-bg.gif" width="16" height="29" />
				</td>
			</tr>
			<tr>
				<td valign="middle" background="images/mail_leftbg.gif">
					&nbsp;

				</td>
				<td valign="top" bgcolor="#F7F8F9">
					<br>
					<table width="50%" align="left" class="test">

					</table>
					<br>
					<table id="data" width="100%" align="center">

						<a href="fusionCharts.jsp">按性别查看</a>
						<a href="departmentCharts.jsp">按部门查看</a>
						<a href="PositionCharts.jsp">按职务查看</a>
						
						<tr>
							<td>
								<div id="chartdiv1"></div>
							</td>
							<td>
								<div id="chartdiv2"></div>
							</td>
						</tr>
						<script type="text/javascript">
             $(document).ready(function()
             {
                report_request();
             });
             
          function report_request() {
				$.ajax( {
					type : "post",
					url : "dyachart.do?method=getDateChartOfAttendance",
					dataType : "json",
					success : function(data) {	
						if(data.isEmpty != 0)//有数据
						{
							var gtype =	$("#report_type").val();				
							chartStr=data.xmlstr;
							chart1 = new FusionCharts("${pageContext.request.contextPath}/FusionChart2/Doughnut3D.swf", "ChartId", "450", "365");	
		   					chart1.setDataXML(chartStr);	   
		   					chart1.render("chartdiv1");	
		   					
		   						chart2 = new FusionCharts("${pageContext.request.contextPath}/FusionChart2/Column3D.swf", "ChartId", "450", "365");	
		   					chart2.setDataXML(chartStr);	   
		   					chart2.render("chartdiv2");	
		   				}	
		   				else
		   				{
		   					$("#chartdiv").html("<font size='5' color='red'>对不起没有数据！</font>");
		   				}
					}
				});
			}
         </script>

					</table>

				</td>
				<td valign="bottom" background="images/mail_rightbg.gif">
					<img src="images/buttom_right2.gif" width="16" height="17" />
				</td>
			</tr>
			<tr>
				<td valign="bottom" background="images/mail_leftbg.gif">
					<img src="images/buttom_left2.gif" width="17" height="17" />
				</td>
				<td background="images/buttom_bgs.gif">
					<img src="images/buttom_bgs.gif" width="17" height="17">
				</td>
				<td valign="bottom" background="images/mail_rightbg.gif">
					<img src="images/buttom_right2.gif" width="16" height="17" />
				</td>
			</tr>
		</table>

	</body>
</html>
