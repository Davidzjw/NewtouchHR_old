<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Information"%>
<%@page import="com.coe.dto.Attendance"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<body>
	<table width="100%" cellpadding="0" cellspacing="0" border="0"
		height="100%">
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
								增加公告
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
				<br>

				<form action="addNotice.do?method=ybaddNotice&id=<%=session.getAttribute("id") %>" method="POST">
					<table width="100%" align="center" height="95%">

						<TR onMouseOver="this.className='tr_over'"
							onMouseOut="this.className=''">
					<%
					
					 %>
							<TD>

								<div align="center">
									公告名称：
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>

								<div align="left">
									<input type="text" name="nname" size="60" id="nname">
								</div>

							</TD>
						</tr>
						<tr>
							<TD valign="top">
								<div align="center">
									公告内容：

								</div>
							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>
								<div align="left">
									<textarea cols="60" rows="28" name="ncontent" id="ncontent"></textarea>
								</div>

							</TD>

							<input type="hidden" name="datetime" value="<%=new Date()%>" />
						<tr>
							<TD>
								<div align="center">
									<input type="submit" value="提交" id="addnotice">
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>
								<div align="left">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="重置">
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

