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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

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
								��ͬ����
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
				
					<form action="findContractbymh.do?method=findContractbymh" method="POST">			
					��ͬ����:
					<input type="text" name="cname">
					��ͬ����:
					<input type="text" name="cnature">
					<input type="submit" value="��ѯ">
					</form>
					<form action="" method="POST">
						<input type="submit" value="��Ӻ�ͬ">
					</form>
				<table id="data" width="100%"  align="center">
					<TR>
						<TH>
							<p>
								��ͬ������
							</p>
						</TH>
						<TH>
							<p>
								��ͬ�����˲���
							</p>
						</TH>
						<TH>
							<p>
								��ͬ����������
							</p>
						</TH>
						<TH>
							<p>
								��ͬ��������ϵ��ʽ
							</p>
						</TH>
						<TH>
							<p>
								��ͬ����
							</p>
						</TH>
						<TH>
							<p>
								��ͬ����
							</p>
						</TH>
						<TH>
							<p>
								��ͬ����
							</p>
						</TH>
						<TH>
							<p>
								�༭
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
						Contract contract = new Contract();
						while (it.hasNext()) {
							contract = (Contract) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''">

						
						<TD>

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
							<div align="center">
								<p><%=contract.getInformation().getAge()%></p>
							</div>

						</TD>
						<TD>
							<div align="center">
								<p><%=contract.getInformation().getTel()%></p>
							</div>


						</TD>
						<TD>
							<div align="center">
								<p><%=contract.getCname()%></p>
							</div>


						</TD>
						<TD>
							<div align="center">
								<p><%=contract.getCnature()%></p>
							</div>


						</TD>
						<TD>
							<div align="center">
								<p><%=contract.getCagreement()%></p>
							</div>

						</TD>
						<TD>
							<div align="center">
								<p>
									<img src="images/ad.gif" />
								</p>
							</div>


						</TD>

						<TD>
							<div align="center">
								<img src="images/defind.gif" />
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

