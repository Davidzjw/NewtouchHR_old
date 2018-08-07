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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/editeContract.js" charset="GBK"></script>
<script type="text/javascript" src="js/check.js"></script>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<body>
	<table width="100%" cellpadding="0"	cellspacing="0" border="0">
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
								合同管理
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
					<form action="findContractbymh.do?method=findContractbymh"
						method="POST">
						合同名称:
						<input type="text" name="cname">
						合同性质:
						<input type="text" name="cnature">
						<input type="hidden" name="level" value="超级管理员">
						<input type="submit" value="查询">
					</form>
			
						<%
							List listInfor = (List) request.getAttribute("listInfor");

							Iterator itinfor = listInfor.iterator();
							Information information = new Information();
							while (itinfor.hasNext()) {
								information = (Information) itinfor.next();
						%>
					
						<%
							}
						%>
						<hr>
				<a href="addcontract.jsp">添加合同</a>
				<table id="data" width="100%"  align="center">
					<TR id="-1000">

						<TH>
							<p>
								合同持有人
							</p>
						</TH>
						<TH>
							<p>
								合同持有人部门
							</p>
						</TH>
						
						
						<TH>
							<p>
								合同名称
							</p>
						</TH>
						
						<TH>
							<p>
								签约时间
							</p>
						</TH>
						<TH>
							<p>
								有效时间（年）
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
						<TH>
							<p>
								编辑
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
						Contract contract = new Contract();
						while (it.hasNext()) {
							contract = (Contract) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=contract.getCid()%>">

						<TD>
							<div align="center" id="userid1<%=contract.getCid()%>">
								<input type="hidden" value="<%=information.getUserid()%>">
							</div>

							<div align="center">
								<p><%=contract.getInformation().getUsername()%></p>
							</div>

						</TD>
						<TD>
							<div align="center">
								<p><%=contract.getInformation().getDepartment()%></p>
							</div>
						</TD>
						
					
						<TD>
							<div align="center" id="cname1<%=contract.getCid()%>">
								<input value="<%=contract.getCname()%>">
							</div>
							<div align="center" id="cname<%=contract.getCid()%>">
								<%=contract.getCname()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="ctime1<%=contract.getCid()%>">
								<input value="<%=contract.getCtime()%>">
							</div>
							<div align="center" id="ctime<%=contract.getCid()%>">
								<%=contract.getCtime()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="cend1<%=contract.getCid()%>">
								<input value="<%=contract.getCend()%>">
							</div>
							<div align="center" id="cend<%=contract.getCid()%>">
								<%=contract.getCend()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="cnature1<%=contract.getCid()%>">
								<input value="<%=contract.getCnature()%>">
							</div>
							<div align="center" id="cnature<%=contract.getCid()%>">
								<%=contract.getCnature()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="cagreement1<%=contract.getCid()%>">
								<input value="<%=contract.getCagreement()%>">
							</div>
							<div align="center" id="cagreement<%=contract.getCid()%>">
								<%=contract.getCagreement()%>
							</div>

						</TD>
						<TD>
							<div align="center">
								<input type="hidden" id="storeEdit<%=contract.getCid()%>"
									value="0">
								<a id="edit<%=contract.getCid()%>" href='javascript:void(0)'
									style="border: 0px"><img src="images/ad.gif" /> </a>
							</div>
						<TD>
							<div align="center">
								<a id="deleteedit<%=contract.getCid()%>"
									href='javascript:void(0)' style="border: 0px"><img
										src="images/defind.gif" />
								</a>
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

