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
								���ڹ���
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
					Ա������:
					<select size="1" name="username">
						<option value="">
							Ա��������
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
					Ա������:
					<select size="1" name="department">
						<option value="">
							����
						</option>
						<option value="���²�">
							���²�
						</option>
						<option value="���۲�">
							���۲�
						</option>
						<option value="����">
							����
						</option>
						<option value="�г���">
							�г���
						</option>
						<option value="�з���">
							�з���
						</option>
					</select>
					������<input type="radio" value="1" name="kg">
					���ڣ�<input type="radio" value="0" name="kg" checked="checked">
					<input type="hidden" name="level" value="��������Ա">
					<input type="submit" value="��ѯ">
				</form>

				
	<table id="data" width="100%"  align="center">
					
					<TR id="-1000">
						
						<TH>
							<p>
								Ա������
							</p>
						</TH>
						<TH>
							<p>
								Ա������
							</p>
						</TH>
						<TH>
							<p>
								ǩ��ʱ�䣨AM��
							</p>
						</TH>
						<TH>
							<p>
								ǩ��ʱ�䣨PM��
							</p>
						</TH>
						<TH>
							<p>
								�Ƿ����
							</p>
						</TH>

						<TH>
							<p>
								ɾ��
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

