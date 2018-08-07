<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Information"%>
<%@page import="com.coe.dto.Contract"%>
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
<script type="text/javascript" src="js/deleteAttendance.js"></script>

<body>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif">
				<img src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="images/content-bg.gif">
				<table width="100%" height="31"  cellpadding="0"
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
			<td width="16" valign="top" background="images/mail_rightbg.gif">
				<img src="images/nav-right-bg.gif" width="16" height="29" />
			</td>
		</tr>
		<tr>
			<td valign="middle" background="images/mail_leftbg.gif">&nbsp;
				
			</td>
			<td valign="top" bgcolor="#F7F8F9">
				<br>
								<form action="findAttendencebymh.do?method=findAttendencebymh"
					method="POST">
					员工姓名:
					<select size="1" name="username">
						<option value="">
							员工姓名：
						</option>
						<%
							List inforList = (List) request.getAttribute("inforList");

							Iterator itinfor = inforList.iterator();
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
					员工部门:
					<select size="1" name="department">
						<option value="">
							部门
						</option>
						<option value="人事部">
							人事部
						</option>
						<option value="销售部">
							销售部
						</option>
						<option value="财务部">
							财务部
						</option>
						<option value="市场部">
							市场部
						</option>
						<option value="研发部">
							研发部
						</option>
					</select>
					旷工：<input type="radio" value="1" name="kg">
					到勤：<input type="radio" value="0" name="kg" checked="checked">
					<input type="hidden" name="level" value="超级管理员">
					<input type="submit" value="查询">
				</form>

				
	<table id="data" width="100%"  align="center">
					
					<TR id="-1000">
						
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

						<TH>
							<p>
								删除
							</p>
						</TH>


					</TR>
					<%
						List list = (List) request.getAttribute("list");

						Iterator it = list.iterator();
						Attendance attendance = new Attendance();
						while (it.hasNext()) {
							attendance = (Attendance) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=attendance.getAdid()%>">						
						<TD>

							<div align="center">
								<p><%=attendance.getInformation().getUsername()%></p>
							</div>

						</TD>
						<TD>
							<div align="center">
								<p><%=attendance.getInformation().getDepartment()%></p>
							</div>
						</TD>
						<TD>
							<div align="center">
								<p><%=attendance.getZt()%></p>
							</div>

						</TD>
						<TD>
							<div align="center">
								<p><%=attendance.getLate()%></p>
							</div>


						</TD>
						<TD>
							<div align="center">
								<p><%=attendance.getAbsenteeism()%></p>
							</div>
						</TD>




						<TD>
							<div align="center">
								<a id="edit<%=attendance.getAdid()%>" href='javascript:void(0)'
									style="border: 0px"><img src="images/defind.gif" />
							</div>
						</TD>


					</TR>

					<%
						}
					%>

				</table>



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

