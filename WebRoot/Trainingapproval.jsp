<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Trainingapproval"%>
<%@page import="com.coe.dto.Trainingplan"%>
<%@page import="com.coe.dto.Information"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>��ѵ����</title>
		<link href="images/skin.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.5.2.min.js" type="text/javascript"
			language="JavaScript"></script>
		<script src="js/editetrapp.js" type="text/javascript"
			language="JavaScript" charset="GBK">
		</script>
		<script src="js/checktrapp.js" type="text/javascript"
			language="JavaScript" charset="GBK">
		</script>
		<link href="css/common.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript"> 
$(document).ready(function(){
$("#1").click(function(){
    $("#2").slideToggle("slow");
  });
  $("#3").click(function(){
    $("#4").slideToggle("slow");
  });
});
</script>
		<style type="text/css">
div.panel,b.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: #B7E1FA;
	border: solid 1px #c3c3c3;
}

div.panel {
	height: 40px;
	display: none;
}
</style>
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
									��ѵ����
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
						<form action="TrainingMangment.do?method=findApproval"
							method="POST">
							�����ˣ�
							<input type="text" name="username">
							���ڲ��ţ�
							<select size="1" name="department">
								<option value="">

								</option>
								<option value="���²�">
									���²�
								</option>
								<option value="����">
									����
								</option>
								<option value="�г���">
									�г���
								</option>
								<option value="���۲�">
									���۲�
								</option>
								<option value="�з���">
									�з���
								</option>
								<option value="����">
									����
								</option>
							</select>
							��������:
							<input type="text" name="trf">
							������:
							<input type="text" name="fzr">
							�������
							<select size="1" name="trmark">
								<option value="0">
									δ����
								</option>
								<option value="1">
									����ͨ��
								</option>
							</select>
							<input type="submit" value="��ѯ">
							<b class="filp" id="3" align="center" >
						�����ѵ����
					</b>
						</form>
					<hr>
					<div class="panel" id="4">
						<form action="TrainingMangment.do?method=saveApproval"
							method="POST">

							�����ˣ�
							<select name="userid" id="a_bpr">
								<option></option>
								<%
									List listPlan = (List) session.getAttribute("listPlan");
									List listinfo = (List) session.getAttribute("list");
									Iterator itif = listinfo.iterator();
									while (itif.hasNext()) {
										Information information = (Information) itif.next();
								%>
								<option value="<%=information.getUserid()%>">
									<%=information.getUsername()%>
								</option>

								<%
									}
								%>


							</select>
							��������:

							<select name="trid" id="a_bpfx">
								<option></option>
								<%
									Iterator itpl = listPlan.iterator();
									while (itpl.hasNext()) {
										Trainingplan trainingplan = (Trainingplan) itpl.next();
								%>
								<option value="<%=trainingplan.getTrid()%>">
									<%=trainingplan.getTrf()%>
								</option>

								<%
									}
								%>


							</select>
							<input type="submit" value="�������" id="a_trapp">
						</form>
					</div>
					
					<table id="data" width="100%" align="center">
						<thead>
							<tr id="-1000">

								<th>
									Ա������
								</th>
								<th>
									���ڲ���
								</th>
								<th>
									��ѵ����
								</th>
								<th>
									��ѵ�����־
								</th>
								<th>
									�༭
								</th>
								<th>
									ɾ��
								</th>
							</tr>
						</thead>
						<tbody>

							<%
								List list = (List) request.getAttribute("list");
								for (Iterator iterator = list.iterator(); iterator.hasNext();) {
									Trainingapproval approval = (Trainingapproval) iterator.next();
							%>
							<tr onMouseOver="this.className='tr_over'"
								onMouseOut="this.className=''" id="<%=approval.getTaid()%>">

								<td>
									<div align="center" id="userid<%=approval.getTaid()%>">
										<input type="hidden"
											value="<%=approval.getInformation().getUserid()%>">
									</div>
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
									<div align="center">
										<select id="trf1<%=approval.getTaid()%>">
											<option></option>
											<%
												for (Iterator it = listPlan.iterator(); it.hasNext();) {
														Trainingplan trainingplan = (Trainingplan) it.next();
											%>
											<option value="<%=trainingplan.getTrid()%>">
												<%=trainingplan.getTrf()%>
											</option>
											<%
												}
											%>

										</select>
									</div>
									<div align="center" id="trf<%=approval.getTaid()%>">
										<%=approval.getTrainingplan().getTrf()%>
									</div>
								</td>

								<td>
									<div align="center" id="trmark1<%=approval.getTaid()%>">
										δ����
										<input id="id1<%=approval.getTaid()%>" type="radio" value="0"
											name="mark">
										���ͨ��
										<input id="id2<%=approval.getTaid()%>" type="radio" value="1"
											name="mark">
									</div>
									<div align="center" id="trmark<%=approval.getTaid()%>">
										<%
											Integer mark = approval.getTrmark();
												if (mark.equals(new Integer(0))) {
													out.print("δ����");
												} else {
													out.print("���ͨ��");
												}
										%>
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
