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
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
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
								��ӦƸ��
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


				<form action="addCandidates.do?method=addCandidates&level=һ�����Ա"
					method="POST">
					<table width="100%"  align="center"  height="98%">
						
						<TR onMouseOver="this.className='tr_over'"
							onMouseOut="this.className=''">

							<TD>

								<div align="center">
									����������
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>

								<div align="left">
									<input type="text" name="caname" size="60" id="caname">
								</div>

							</TD>
						</tr>
						<tr>
							<TD>

								<div align="center">
									ӦƸ���ţ�
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>

								<div align="left">
									<input type="text" name="department" value="<%=session.getAttribute("department") %>" readonly="readonly">
									&nbsp;&nbsp;&nbsp; ӦƸְ��&nbsp;
									<select size="1" name="position" id="position">
										<option value="">

										</option>
										<option value="��ͨԱ��">
											��ͨԱ��
										</option>
										<option value="С���鳤">
											С���鳤
										</option>
										<option value="��������">
											��������
										</option>
										<option value="���ž���">
											���ž���
										</option>
									</select>
								</div>
								
							</TD>

						</tr>
						<tr>
							<TD>

								<div align="center">
									��ϵ��ʽ��
									<br>

								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>


								<div align="left">
									<input type="text" name="catel" size="60" id="catel">
									<input type="hidden" name="level" value="<%=session.getAttribute("level") %>">
									&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
								</div>
							</TD>

						</tr>
						<tr>
							<TD valign="top">
								<div align="center">
									
									������Ϣ��

								</div>
								<div align="center">
									<br>
								</div>
							</TD>
							<td valign="top">
								<br>
							</td>
							<TD valign="top">
							
								<div align="left">
									<textarea cols="100" rows="18" name="cainfo" id="cainfo"></textarea>
								</div>

							</TD>
						<tr>
							<TD valign="top">
								<div align="center">
									<input type="submit" value="�ύ" id="addcan">
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

