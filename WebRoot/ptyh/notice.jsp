<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Notice"%>
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
<script type="text/javascript" src="../js/editeNotice.js" charset="GBK"></script>

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
								系统公告
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
				<table id="data" width="100%"  align="center">
					<TR id="-1000">

						<TH>
							<p>
								公告发布者
							</p>
						</TH>
						<TH>
							<p>
								公告名称
							</p>
						</TH>
						<TH>
							<p>
								公告内容
							</p>
						</TH>
						<TH>
							<p>
								发布时间
							</p>
						</TH>


					</TR>
					<%
						List list = (List) session.getAttribute("listptyhNotice");

						Iterator it = list.iterator();
						Notice notice = new Notice();
						while (it.hasNext()) {

							notice = (Notice) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=notice.getNid()%>">

						<TD>


							<div align="center">
								<%=notice.getInformation().getUsername()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="nname<%=notice.getNid()%>">
								<%=notice.getNname()%>
							</div>
						</TD>
						<TD>
							<div align="center" id="ncontent<%=notice.getNid()%>">
								<%=notice.getNcontent()%>
							</div>

						</TD>
						<TD>
							<div align="center">
								<%=notice.getTime()%>
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

