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
		$(pickerName).datepicker('option', 'changeMonth', true);//�·ݿɵ�
		$(pickerName).datepicker('option', 'changeYear', true);//��ݿɵ�
	}
	
	$(function() {
		//var locale = "<s:property value='#request.locale'/>";//struts2ȡ���Ի���
		//var locale = "<%=request.getLocale()%>"; //jspȡ��������Ի���
		//datePicker('#dateDemo',locale);//�������Ի����л����ڿؼ�����
		datePicker('#dateDemo','zh_CN');
		datePicker('#dateDemo1','zh_CN');
		//datePicker('#dateDemo',''); //''Ĭ�ϵ���ʽ��ui.datepicker.js���Ѷ���ΪӢ����ʽ���븽���ڵ�ui.datepicker-en_US.js��ͬ
	});
	</script>

		<title>��ѵ�ƻ�</title>


	</head>
	<body>

		<table width="100%"  cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="17" valign="top" background="images/mail_leftbg.gif">
					<img src="images/left-top-right.gif" width="17" height="29" />
				</td>
				<td valign="top" background="images/content-bg.gif">
					<table width="100%" height="31" cellpadding="0"
						cellspacing="0" class="left_topbg" id="table2">
						<tr>
							<td height="31">
								<div class="titlebt">
									��ѵ�ƻ�
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

					<table id="data" width="100%" align="center">
						<thead>
							<tr id="-1000">
								
								<th>
									���ò���
								</th>
								<th>
									��ѵ����
								</th>
								<th>
									��ѵ����
								</th>
								<th>
									��ѵ���ݼ��
								</th>
								<th>
									������
								</th>
								<th>
									��ѵ��ʼʱ��
								</th>
								<th>
									��ѵ����ʱ�䣨�£�
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
