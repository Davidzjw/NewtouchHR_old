<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
<script type="text/javascript" src="js/check.js"></script>
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

<body>
	<table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
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
								������Ƹ
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
			<td valign="top" bgcolor="#F7F8F9">
				<br>			

				<form action="addRecruitmentInfo.do?method=addRecruitmentInfo"
					method="POST">
					<table  width="100%"  align="center"	height="95%">
						
						<TR onMouseOver="this.className='tr_over'"
							onMouseOut="this.className=''">

							<TD>

								<div align="center">
									��Ƹ���ƣ�
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>

								<div align="left">
									<input type="text" name="rname" size="60" id="rname">
								</div>

							</TD>
						</tr>
						<tr>
							<TD>

								<div align="center">
									��Ƹ���ţ�
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>

								<div align="left">
									<input type="text" name="department" value="<%=session.getAttribute("department") %>" readonly="readonly">
									&nbsp;&nbsp;&nbsp; ��Ƹ������&nbsp;
									<input type=text name="rers" id="rers">
								</div>
							
							</TD>

						</tr>
						<tr>
							<TD>

								<div align="center">
									��ʼʱ�䣺
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>


								<div align="left">
									<input type="text" id="dateDemo" name="rest">
									&nbsp;&nbsp;&nbsp;&nbsp; ��ֹʱ�䣺
									<input type="text" id="dateDemo1" name="reut">
									&nbsp;
								</div>
							</TD>

						</tr>
						<tr>
							<TD valign="top">
								<div align="center">
									
									��Ƹ���ݣ�

								</div>
								<div align="center">
									<br>
								</div>
							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>
								<div align="left">
									<textarea cols="100" rows="18" name="content" id="content"></textarea>
								</div>

							</TD>
						<tr>
							<TD>
							<input type="hidden" name="level" value="<%=session.getAttribute("level") %>">
								<div align="center">
									<input type="submit" value="�ύ" id="addrec">
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>
								<div align="left">
									&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp;
									<input type="reset" value="����">
								</div>

							</TD>
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

