<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Trainingapproval"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>培训评价</title>
		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<link href="images/skin.css" rel="stylesheet" type="text/css" />

		<script src="js/jquery-1.5.2.min.js" type="text/javascript"
			language="JavaScript"></script>
		<script src=js/editetreva.js type="text/javascript"
			language="JavaScript" charset="GBK"></script>
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
									培训评价
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
						<form action="TrainingMangment.do?method=findEva" method="POST">
							受训人：
							<select name="username">
								<option></option>
								<%
									List listPlan = (List) session.getAttribute("listPlan");
									List list = (List) request.getAttribute("list");
									Iterator ite = list.iterator();
									while (ite.hasNext()) {
										Trainingapproval trainingapproval = (Trainingapproval) ite
												.next();
								%>
								<option
									value="<%=trainingapproval.getInformation().getUserid()%>">
									<%=trainingapproval.getInformation().getUsername()%>
								</option>

								<%
									}
								%>


							</select>
							所在部门：
							<select size="1" name="department">
								<option value="">

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
							负责人:
							<input type="text" name="fzr">
							评价内容:
							<input type="text" name="eva">
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
									所在部门
								</th>
								<th>
									培训名称
								</th>
								<th>
									培训负责人
								</th>
								<th>
									培训评价
								</th>
								<th>
									增加评价
								</th>
								<th>
									删除评价内容
								</th>
							</tr>
						</thead>
						<tbody>

							<%
								for (Iterator iterator = list.iterator(); iterator.hasNext();) {
									Trainingapproval approval = (Trainingapproval) iterator.next();
							%>
							<tr onMouseOver="this.className='tr_over'"
								onMouseOut="this.className=''" id="<%=approval.getTaid()%>">

								<td>

									<div align="center">
										<%=approval.getInformation().getUsername()%>
									</div>
								</td>
								<td>
									<div align="center">
										<%=approval.getInformation().getDepartment()%>
									</div>
								</td>
								<td>

									<div align="center" id="trf<%=approval.getTaid()%>">
										<%=approval.getTrainingplan().getTrf()%>
									</div>
								</td>
								<td>

									<div align="center" id="fzr<%=approval.getTaid()%>">
										<%=approval.getTrainingplan().getFzr().getUsername()%>
									</div>
								</td>

								<td>
									<div align="center" id="eva1<%=approval.getTaid()%>">
										<input value=<%=approval.getEval()%>>
									</div>
									<div align="center" id="eva<%=approval.getTaid()%>">
										<%=approval.getEval()%>
									</div>
								</td>
								<td>
									<div align="center">
										<input type="hidden" id="storeEdit<%=approval.getTaid()%>"
											value="0">
										<a id="edit<%=approval.getTaid()%>" href='javascript:void(0)'
											style="border: 0px"><img src="images/ad.gif" /> </a>
									</div>
								<td>
									<div align="center">
										<a id="deleteedit<%=approval.getTaid()%>"
											href='javascript:void(0)' style="border: 0px"><img
												src="images/defind.gif" /> </a>
									</div>

								</td>
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
