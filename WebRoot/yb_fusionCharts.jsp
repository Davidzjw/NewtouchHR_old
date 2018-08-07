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
    
    <title>动态报表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/FusionCharts.js"></script>
  </head>
  
  <body>
  
  <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif">
				<img src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="images/content-bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0"
					cellspacing="0" class="left_topbg" id="table2">
					<tr>
						<td height="31">
							<div class="titlebt">
								统计分析：按性别查看报表
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
			<td valign="middle" background="images/mail_leftbg.gif">&nbsp;
				
			</td>
			<td valign="top" >
				<br>
				
				<table id="data" width="100%" align="center">
			<a href="attendanceCharts.jsp">查看考勤报表</a>					
	 <center>
           请选择报表类型:
       <select id="report_type" onChange="report_request()">
				<option value="0">
					柱状图1
				</option>
				<option value="1">
					饼图1
				</option>
				<option value="2">
					住状图2
				</option>
				<option value="3">
					曲线图1
				</option>
				<option value="4">
					区域图
				</option>
				<option value="5">
					曲线图2
				</option>
				<option value="6">
					饼图2
				</option>
			</select>
			
        <div id="chartdiv">
		</div>
		
       </center>
        <script type="text/javascript">
        var swf;
             $(document).ready(function()
             {
                 swf =new Array("FCF_Column3D.swf","Doughnut3D.swf","Column3D.swf","Line.swf","FCF_Area2D.swf","FCF_Line.swf","FCF_Pie3D.swf");//三种图形
                report_request();
             });
             
          function report_request() {
				$.ajax( {
					type : "post",
					url : "dyachart.do?method=getChart",
					dataType : "json",
					success : function(data) {	
						if(data.isEmpty != 0)//有数据
						{
							var gtype =	$("#report_type").val();				
							chartStr=data.xmlstr;
							chart = new FusionCharts("${pageContext.request.contextPath}/FusionChart/"+swf[gtype], "ChartId", "450", "365");	
		   					chart.setDataXML(chartStr);	   
		   					chart.render("chartdiv");	
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
