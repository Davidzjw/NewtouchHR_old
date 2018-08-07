<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Trainingplan"%>
<%@page import="com.coe.dto.Trainingapproval"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="css/style.css" rel="stylesheet" />

		<title>培训评价</title>


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

					<table id="data1" width="100%" align="center">
						<thead>
							<tr id="-1000">
								<th>
									编号
								</th>
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
										<%=trp.getTrid()%>
									</div>
								</td>
								<td>
									<div align="center" id="department<%=trp.getTrid()%>">
										<%=trp.getDepartment()%>
									</div>
								</td>
								<td>
									<div align="center" id="trd<%=trp.getTrid()%>">
										<%=trp.getTrd()%>
									</div>
								</td>
								<td>
									<div align="center" id="trf<%=trp.getTrid()%>">
										<%=trp.getTrf()%>
									</div>
								</td>
								<td>
									<div align="center" id="trn<%=trp.getTrid()%>">
										<%=trp.getTrn()%>
									</div>
								</td>
								<td>
									<div align="center" id="userid<%=trp.getTrid()%>">
										<%=trp.getFzr().getUsername()%>
									</div>
								</td>
								<td>
									<div align="center" id="trst<%=trp.getTrid()%>">
										<%=trp.getTrst()%>
									</div>
								</td>
								<td>
									<div align="center" id="trc<%=trp.getTrid()%>">
										<%=trp.getTrc()%>
									</div>
								</td>
							</tr>

							<%
								}
							%>

						</tbody>
					</table>
					<hr>
					<table width="100%" align="center" cellpadding="1" id="data">
						<thead>
							<tr>
								<th>
									姓名
								</th>
								<th>
									评价内容
								</th>
							</tr>

							<%
								List listapp = (List) request.getAttribute("listapp");
								Iterator iterator = listapp.iterator();
								while (iterator.hasNext()) {
									Trainingapproval trainingapproval = (Trainingapproval) iterator
											.next();
							%>
							<tr onMouseOver="this.className='tr_over'"
								onMouseOut="this.className=''">
								<td align="center">
									<%=trainingapproval.getInformation().getUsername()%>
									<br>
								</td>
								<td align="center">
									<%=trainingapproval.getEval()%>
									<br>
								</td>
							</tr>
							<%
								}
							%>
						
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
