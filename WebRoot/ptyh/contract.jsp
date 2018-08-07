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
<link href="../images/skin.css" rel="stylesheet" type="text/css" />
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/editeContract.js"
	charset="GBK"></script>

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
								合同管理
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
					<TR id="-1000">

						<TH>
							<p>
								合同持有人
							</p>
						</TH>
						<TH>
							<p>
								合同持有人所在部门
							</p>
						</TH>
						<TH>
							<p>
								合同持有人年龄
							</p>
						</TH>
						<TH>
							<p>
								合同持有人联系方式
							</p>
						</TH>
						<TH>
							<p>
								合同名称
							</p>
						</TH>
						<TH>
							<p>
								合同性质
							</p>
						</TH>
						<TH>
							<p>
								合同内容
							</p>
						</TH>


					</TR>
					<%
						List list = (List) session.getAttribute("listptyhContract");

						Iterator it = list.iterator();
						Contract contract = new Contract();
						while (it.hasNext()) {
							contract = (Contract) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''">

						<TD>

							<div align="center">
								<%=contract.getInformation().getUsername()%>
							</div>

						</TD>
						<TD>
							<div align="center">
								<%=contract.getInformation().getDepartment()%>
							</div>
						</TD>
						<TD>
							<div align="center">
								<%=contract.getInformation().getAge()%>
							</div>

						</TD>
						<TD>
							<div align="center">
								<%=contract.getInformation().getTel()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="cname<%=contract.getCid()%>">
								<%=contract.getCname()%>
							</div>
						</TD>
						<TD>
							<div align="center" id="cnature<%=contract.getCid()%>">
								<%=contract.getCnature()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="cagreement<%=contract.getCid()%>">
								<%=contract.getCagreement()%>
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

