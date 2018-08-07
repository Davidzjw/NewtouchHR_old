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
<link href="../images/skin.css" rel="stylesheet" type="text/css" />
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/deleteAttendance.js"></script>

<body>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="17" valign="top" background="../images/mail_leftbg.gif">				
				<img src="../images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="../images/content-bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0"
					cellspacing="0" class="left_topbg" id="table2">
					<tr>
						<td height="31">
							<div class="titlebt">
								考勤管理
							</div>
						</td>
					</tr>
				</table>
			</td>
			<td width="16" valign="top" background="../images/mail_rightbg.gif">
				<img src="../images/nav-right-bg.gif" width="16" height="29" />
			</td>
		</tr>
		<tr>
			<td valign="middle" background="../images/mail_leftbg.gif">
				&nbsp;
			</td>
			<td valign="top" bgcolor="#F7F8F9">
				<br>
				<table id="data" width="100%" align="center">
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="-1000">

						
						<TH>
							<p>
								员工姓名
							</p>
						</TH>
						<TH>
							<p>
								员工部门
							</p>
						</TH>
						<TH>
							<p>
								签到时间（AM）
							</p>
						</TH>
						<TH>
							<p>
								签退时间（PM）
							</p>
						</TH>
						<TH>
							<p>
								是否旷工
							</p>
						</TH>
					</TR>
					<%
						List list = (List) request.getAttribute("list");
						Iterator it = list.iterator();
						while (it.hasNext()) {
							Attendance attendance = (Attendance) it.next();
					%>

					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=attendance.getAdid()%>">

						
						<TD>

							<div align="center">
								<%=attendance.getInformation().getUsername()%>
							</div>

						</TD>
						<TD>
							<div align="center">
								<%=attendance.getInformation().getDepartment()%>
							</div>
						</TD>
						<TD>
							<div align="center">
								<%=attendance.getZt()%>
							</div>

						</TD>
						<TD>
							<div align="center">
								<%=attendance.getLate()%>
							</div>


						</TD>
						<TD>
							<div align="center">
								<%=attendance.getAbsenteeism()%>
							</div>
						</TD>
					</TR>


					<%
						}
					%>
				</table>
			</td>
			<td valign="bottom" background="../images/mail_rightbg.gif">
					<img src="../images/buttom_right2.gif" width="16" height="17" />
		    </td>
		</tr>
		<tr>
			<td valign="bottom" background="../images/mail_leftbg.gif">
				<img src="../images/buttom_left2.gif" width="17" height="17" />
			</td>
			<td background="../images/buttom_bgs.gif">
				<img src="../images/buttom_bgs.gif" width="17" height="17">
			</td>
			<td valign="bottom" background="../images/mail_rightbg.gif">
				<img src="../images/buttom_right2.gif" width="16" height="17" />
			</td>
		</tr>
	</table>

</body>

