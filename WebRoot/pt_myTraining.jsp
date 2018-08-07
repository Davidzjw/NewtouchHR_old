<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Trainingapproval"%>
<%@page import="com.coe.dto.Information"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>培训反馈</title>
		<link href="images/skin.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.5.2.min.js" type="text/javascript"
			language="JavaScript"></script>
		<script src=js/editetrfb.js type="text/javascript"
			language="JavaScript" charset="GBK">
	
</script>
		<link href="css/common.css" rel="stylesheet" type="text/css" />
	</head>

	<body>

		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="17" valign="top" background="images/mail_leftbg.gif">				
					<img src="images/left-top-right.gif" width="17" height="29" />
				</td>
				<td valign="top" background="images/content-bg.gif">
					<table width="100%" height="31"  cellpadding="0"
						cellspacing="0" class="left_topbg" id="table2">
						<tr>
							<td height="31">
								<div class="titlebt">
									培训反馈
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
					<form action="TrainingMangment.do?method=findFb" method="POST">
						受训人：
						<select name="username">
							<%
								List listPlan = (List) session.getAttribute("listPlan");
								Information info = (Information) session
										.getAttribute("information");
								List listevaluation = (List) session.getAttribute("listevaluation");
							%>
							<option value="<%=session.getAttribute("id")%>">
								<%=session.getAttribute("username")%>
							</option>
						</select>

						培训方向:
						<input type="text" name="trf">
						负责人:
						<input type="text" name="fzr">
						反馈内容:
						<input type="text" name="fb">
						<input type="submit" value="查询">
					</form>
					<hr>

					

					<table id="data" width="100%" align="center">
						<thead>
							<tr id="-1000">
								
								<th>
									员工姓名
								</th>
								
								<th>
									培训方向
								</th>
								<th>
									培训反馈
								</th>
								<th>
									我的表现
								</th>
								<th>
									添加反馈
								</th>
								
							</tr>
						</thead>
						<tbody>

							<%
								for (Iterator iterator = listevaluation.iterator(); iterator.hasNext();) {
									Trainingapproval approval = (Trainingapproval) iterator.next();
							%>
							<tr onMouseOver=this.className
								= 'tr_over' onMouseOut=this.className=
								''  id="<%=approval.getTaid()%>">
								
								<td>

									<div align="center">
										<%=approval.getInformation().getUsername()%>
									</div>
								</td>
								<td>
									<div align="center">
										<%=approval.getTrainingplan().getTrf()%>
									</div>
								</td>
								<td>

									<div align="center" id="trf<%=approval.getTaid()%>">
										<%=approval.getFb()%>
									</div>
								</td>
								<td>

									<div align="center" id="fzr<%=approval.getTaid()%>">
										<%=approval.getEval()%>
									</div>
								</td>

								
								<td>
									<div align="center">
										<a id="edit<%=approval.getTaid()%>" href='TrainingMangment.do?method=test&tt=<%=approval.getTrainingplan().getTrid() %>'
											style="border: 0px"><img src="images/ad.gif" /> </a>
									</div>
							</tr>

							<%
								}
							%>

						</tbody>
					</table>
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
		<input id="editsta" type="hidden" value="0" />
	</body>
</html>
