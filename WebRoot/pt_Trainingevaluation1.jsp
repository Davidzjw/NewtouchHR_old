<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Trainingapproval"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>培训反馈</title>
		<link href="images/skin.css" rel="stylesheet" type="text/css" />
		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.5.2.min.js" type="text/javascript"
			language="JavaScript"></script>
		<script src=js/check.js type="text/javascript"
			language="JavaScript" charset="GBK"></script>
	
		
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
					<%
						List listevaluation = (List) request.getAttribute("list");
					%>
					<hr>


					<table id="data" width="100%" align="center">
						<thead>
							<tr id="-1000">

								<th> 
									培训名称 
								</th>
								<th>
									培训反馈

								</th>
							</tr>
						</thead>
						<tbody>

							<%
								Iterator iterator = listevaluation.iterator();
								Trainingapproval approval = (Trainingapproval) iterator.next();
							%>
							<tr onMouseOver=this.className
								= 'tr_over' onMouseOut=this.className=
								''  id="<%=approval.getTaid()%>">

								<td>

									<div align="center" id="fzr<%=approval.getTaid()%>">
										<p><%=approval.getTrainingplan().getTrf()%><p>
									</div>
								</td>

								<td>
									<table width="100%" align="center">
										<%
											List list = (List) request.getAttribute("list");
											Iterator iterator2 = list.iterator();
											while (iterator2.hasNext()) {
												Trainingapproval trainingapproval = (Trainingapproval) iterator2
														.next();
										%>
										<tr>
											<td align="center"><p><%=trainingapproval.getInformation().getUsername()%>说：<p>
											</td>
											<td><p><%=trainingapproval.getFb()%></td><p>
										</tr>

										<%
											}
										%>
										
										<tr>
										<form action="TrainingMangment.do?method=editFb1&taid=<%=approval.getTaid() %>" method="post">
											<td align="center">
												<input type="submit" value="我要说" id="addeva" ><input type="hidden" name="trid" value="<%=approval.getTrainingplan().getTrid() %>">
											</td>
											<td>
												<textarea rows="" cols="40" id="trafb" name="fb" >我要说……说说心得，说说体会！</textarea>
											</td>
											<form>
										</tr>


									</table>
								</td>
							</tr>

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
