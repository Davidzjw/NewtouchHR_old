<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Trainingplan"%>
<%@page import="com.coe.dto.Information"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<link href="images/skin.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/editeTrainingplan.js"
			charset="GBK"></script>
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

		<title>培训计划</title>


	</head>
	<body>

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
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
									培训计划
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
				<%
					List listinfo = (List) session.getAttribute("list");
					Iterator it = listinfo.iterator();
				%>
				<td valign="top" bgcolor="#F7F8F9">
					<form action="TrainingMangment.do?method=findplanmh" method="POST">
						计划适用部门：
						<select size="1" name="department">
							<option value="所有部门">
								所有部门
							</option>
							<option value="人事部">
								人事部
							</option>
							<option value="财务部">
								财务部
							</option>
							<option value="市场部">
								市场部
							</option>
							<option value="销售部">
								销售部
							</option>
							<option value="研发部">
								研发部
							</option>
							<option value="其它">
								其它
							</option>
						</select>
						培训方向:
						<input type="text" name="trf">
						培训对象:
						<input type="text" name="trd">
						培训内容:
						<input type="text" name="trn">
						培训负责人:
						<select name="fzr">
							<option></option>
							<%
								while (it.hasNext()) {
									Information information = (Information) it.next();
							%>
							<option value="<%=information.getUserid()%>">
								<%=information.getUsername()%>
							</option>
							<%
								}
							%>
						</select>
						<input type="submit" value="查询">
					</form>

					<table id="data" width="100%"  align="center">
						<thead>
							<tr id="-1000">
								
								<th>
									适用部门
								</th>
								<th>
									培训对象
								</th>
								<th> 
									培训名称 
								</th>
								<th>
									培训内容简介
								</th>
								<th>
									负责人
								</th>
								<th>
									培训开始时间
								</th>
								<th>
									培训持续时间（月）
								</th>
								<th>
									编辑
								</th>
								<th>
									删除
								</th>
							</tr>
						</thead>
						<tbody>

							<%
								List list = (List) request.getAttribute("list");
								for (Iterator iterator = list.iterator(); iterator.hasNext();) {
									Trainingplan trp = (Trainingplan) iterator.next();
							%>
							<tr id="<%=trp.getTrid()%>"
								onMouseOver="this.className='tr_over'"
								onMouseOut="this.className=''">
								
								<td>
									<div align="center">
										<select id="department1<%=trp.getTrid()%>">
											<option value="所有部门">
												所有部门
											</option>
											<option value="人事部">
												人事部
											</option>
											<option value="财务部">
												财务部
											</option>
											<option value="市场部">
												市场部
											</option>
											<option value="销售部">
												销售部
											</option>
											<option value="研发部">
												研发部
											</option>
											<option value="其它">
												其它
											</option>
										</select>
									</div>
									<div align="center" id="department<%=trp.getTrid()%>">
										<%=trp.getDepartment()%>
									</div>
								</td>
								<td>
									<div align="center" id="trd1<%=trp.getTrid()%>">
										<input value=<%=trp.getTrd()%>>
									</div>
									<div align="center" id="trd<%=trp.getTrid()%>">
										<%=trp.getTrd()%>
									</div>
								</td>
								<td>
									<div align="center" id="trf1<%=trp.getTrid()%>">
										<input value=<%=trp.getTrf()%>>
									</div>
									<div align="center" id="trf<%=trp.getTrid()%>">
										<%=trp.getTrf()%>
									</div>
								</td>
								<td>
									<div align="center" id="trn1<%=trp.getTrid()%>">
										<input value=<%=trp.getTrn()%>>
									</div>
									<div align="center" id="trn<%=trp.getTrid()%>">
										<%=trp.getTrn()%>
									</div>
								</td>
								<td>
									<div align="center">
										<select id="userid1<%=trp.getTrid()%>">
											<option></option>
											<%
												while (it.hasNext()) {
														Information information = (Information) it.next();
											%>
											<option value="<%=information.getUserid()%>">
												<%=information.getUsername()%>
											</option>
											<%
												}
											%>
										</select>
									</div>
									<div align="center" id="userid<%=trp.getTrid()%>">
										<%=trp.getFzr().getUsername()%>
									</div>
								</td>
								<td>
									<div align="center" id="trst1<%=trp.getTrid()%>">
										<input type="text" id="dateDemo">
									</div>
									<div align="center" id="trst<%=trp.getTrid()%>">
										<%=trp.getTrst()%>
									</div>
								</td>
								<td>
									<div align="center" id="trc1<%=trp.getTrid()%>">
										<input type="text" value=<%=trp.getTrc()%>>
									</div>
									<div align="center" id="trc<%=trp.getTrid()%>">
										<%=trp.getTrc()%>
									</div>
								</td>
								<TD>
									<div align="center">
										<input type="hidden" id="storeEdit<%=trp.getTrid()%>"
											value="0">
										<a id="edit<%=trp.getTrid()%>" href='javascript:void(0)'
											style="border: 0px"><img src="images/ad.gif" /> </a>
									</div>
								</TD>

								<TD>
									<div align="center">
										<a id="deleteedit<%=trp.getTrid()%>" href='javascript:void(0)'
											style="border: 0px"><img src="images/defind.gif" /> </a>
									</div>

								</TD>
							</tr>

							<%
								}
							%>

						</tbody>
					</table>
				<td background="images/mail_rightbg.gif">
					&nbsp;
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
		<input id="editsta" type="hidden" value="0" />
	</body>
</html>
