<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Information"%>
<%@page import="com.coe.dto.Contract"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
<link type="text/css" href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/editeContract.js" charset="GBK"></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.datepicker.js"></script>
<script type="text/javascript" src="js/ui.datepicker-zh_CN.js"></script>
<script type="text/javascript" src="js/test.js"></script>
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

<body>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif">
				<img src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="images/content-bg.gif">
				<table width="100%" height="31" cellpadding="0" border="0"
					cellspacing="0" class="left_topbg" id="table2">
					<tr>
						<td height="31">
							<div class="titlebt">
								��Ӻ�ͬ
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
			<td valign="top" bgcolor="#F7F8F9" height="100%">
				<form action="saveContract.do?method=saveContract" method="POST">
				<table align="center" height="95%">
				<tr height="80"> &nbsp;</tr>
					<tr>
						<td>��ͬ������������</td>
						<td><select size="1" name="s_userid" id="username">
						<option value="">
							��ͬ������������
						</option>
						<%
							List listInfor = (List) session.getAttribute("list");

							Iterator itinfor = listInfor.iterator();
							Information information = new Information();
							while (itinfor.hasNext()) {
								information = (Information) itinfor.next();
						%>
						<option value="<%=information.getUserid()%>">
							<%=information.getUsername()%>
						</option>
						<%
							}
						%>
					</select>
						</td>
					</tr>
					<tr>
						<td>��ͬ���ƣ�</td>
						<td><input type="text" name="s_cname" id="cname"> ��ͬ���ʣ�<input type="text" name="s_cnature" id="cnature"></td>
					</tr>
					<tr>
						<td>ǩԼʱ�䣺</td>
						<td><input type="text" id="dateDemo" name="s_ctime"> ��Ч���ޣ��꣩��<input type="text" id="cend" name="s_cend" size="13"> </td>
					</tr>
					<tr>
						<td>��ͬ���ݣ�</td>
						<td><textarea  name="s_cagreement" id="cagreement" cols="52" rows="25"></textarea></td>
					</tr>
					<tr>
						<td align="center"><input type="submit" value="����" id="addContract"></td>
						<td align="center"><input type="reset" value="����"></td>
					</tr>
				</table>
				</form>
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

