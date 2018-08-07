<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />
		<base href="<%=basePath%>">

		<title>动态报表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/FusionCharts.js"></script>
		<script type="text/javascript" src="js/ui.core.js"></script>
		<script type="text/javascript" src="js/ui.datepicker.js"></script>
		<script type="text/javascript" src="js/ui.datepicker-zh_CN.js"></script>
		<script type="text/javascript">
	function datePicker(pickerName,locale) {
		$(pickerName).datepicker($.datepicker.regional[locale]);
		$(pickerName).datepicker('option', 'changeMonth', true);//月份可调
		$(pickerName).datepicker('option', 'changeYear', true);//年份可调
	}
	
	$(function() {
		//var locale = "<s:property value='#request.locale'/>";//struts2取语言环境
		//var locale = "<%=request.getLocale()%>"; //jsp取浏览器语言环境
		//datePicker('#dateDemo',locale);//根据语言环境切换日期控件语言
		datePicker('#dateDemo','zh_CN');
		datePicker('#dateDemo1','zh_CN');
		//datePicker('#dateDemo',''); //''默认的样式在ui.datepicker.js内已定义为英文样式，与附件内的ui.datepicker-en_US.js相同
	});
	</script>
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
									统计分析：按姓名查看工资报表
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
				<td valign="top">
					<br>


					<table id="data" width="100%" align="center">
						<select id="str2" onChange="report_request()">
							<option value="所有部门">
								所有部门
							</option>
							<option value="市场部">
								市场部
							</option>
							<option value="人事部">
								人事部
							</option>
							<option value="财务部">
								财务部
							</option>
							<option value="研发部">
								研发部
							</option>
							<option value="销售部">
								销售部
							</option>

						</select>
						请选择报表内容:
						<select id="str" onChange="report_request()">
							<option value="s.bwage">
								基本工资
							</option>
							<option value="s.housefund">
								住房公积金
							</option>
							<option value="s.pension">
								养老保险
							</option>
							<option value="s.health">
								医疗保险
							</option>
							<option value="s.unemployment">
								失业保险
							</option>
							<option value="s.reimbursement">
								报销金额
							</option>
							<option value="s.paword">
								业绩奖金
							</option>
							<option value="0">
								总数
							</option>
						</select>
						请选择开始月份(当月某天):
						<input type="text" id="dateDemo" >
						请选择结束月份(当月某天):
						<input type="text" id="dateDemo1" onchange="report_request()">
						<td>
							<div id="chartdiv1"></div>
						</td>
						<td>
							<div id="chartdiv2"></div>
						</td>
						<script type="text/javascript">
        
             $(document).ready(function()
             {
                report_request();
             });
             
          function report_request() {
          var str=$("#str").val();
          var str2=$("#str2").val();
          var str3=$("#dateDemo").val();
          var str4=$("#dateDemo1").val();
          str2 = encodeURI(encodeURI(str2));
          str3 = encodeURI(encodeURI(str3));
          str4 = encodeURI(encodeURI(str4));
				$.ajax( {
					type : "post",
					url : "dyachart.do?method=getDateChartOfSalarybydep",
					data: "str="+str+"&str2="+str2+"&str3="+str3+"&str4="+str4,
					dataType : "json",
					success : function(data) {	
						if(data.isEmpty != 0)//有数据
						{
							var gtype =	$("#report_type").val();				
							chartStr=data.xmlstr;
							chart1 = new FusionCharts("${pageContext.request.contextPath}/FusionChart2/Pie3D.swf", "ChartId", "450", "365");	
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
