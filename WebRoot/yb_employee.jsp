<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Information"%>
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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/editeInformation.js"
	charset="GBK"></script>
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
								Ա������
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
			<td valign="top" >
				<br>
				

				<form action="findUserbymh.do?method=findUserbymh" method="POST">
					������
					<input type="text" name="username">
					���䣺
					<input type="text" name="age">
					�Ա���
					<input type="radio" checked="checked" value="��" name="sex">
					Ů
					<input type="radio" value="Ů" name="sex">
					<input type="hidden"
						value="<%=session.getAttribute("department")%>" name="department">
					ְ��
					<select size="1" name="position">
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
						<option value="�ܾ���">
							�ܾ���
						</option>
						<option value="��˾����">
							��˾����
						</option>
					</select>
					<input type="hidden" value="һ�����Ա" name="level">
					<input type="submit" value="�ύ">
				</form>
				<hr>

				<table id="data" width="100%" align="center">
					<TR id="-1000">

						
						<TH>
							<p>
								����
							</p>
						</TH>
						<TH>
							<p>
								����
							</p>
						</TH>
						<TH>
							<p>
								����
							</p>
						</TH>
						<TH>
							<p>
								�Ա�
							</p>
						</TH>
						<TH>
							<p>
								����
							</p>
						</TH>
						<TH>
							<p>
								ְ��
							</p>
						</TH>
						<TH>
							<p>
								�绰
							</p>
						</TH>
						<TH>
							<p>
								����
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
						List list = (List) session.getAttribute("listybInformation");

						Iterator it = list.iterator();
						Information user = new Information();
						while (it.hasNext()) {
							user = (Information) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=user.getUserid()%>">

						
						<TD>
							<div align="center" id="userName1<%=user.getUserid()%>">
								<input value="<%=user.getUsername()%>">
							</div>
							<div align="center" id="userName<%=user.getUserid()%>">
								<%=user.getUsername()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="password1<%=user.getUserid()%>">
								<input value="<%=user.getPassword()%>">
							</div>
							<div align="center" id="password<%=user.getUserid()%>">
								<%=user.getPassword()%>
							</div>
						</TD>
						<TD>
							<div align="center" id="age1<%=user.getUserid()%>">
								<input value="<%=user.getAge()%>">
							</div>
							<div align="center" id="age<%=user.getUserid()%>">
								<%=user.getAge()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="sex1<%=user.getUserid()%>">
								<input value="<%=user.getSex()%>">
							</div>
							<div align="center" id="sex<%=user.getUserid()%>">
								<%=user.getSex()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="department1<%=user.getUserid()%>">
								<!-- <input value="<%=user.getDepartment()%>"> -->
								<select size="1" name="department">
									<option value="">

									</option>
									<option value="���²�">
										���²�
									</option>
									<option value="����">
										����
									</option>
									<option value="�г���">
										�г���
									</option>
									<option value="���۲�">
										���۲�
									</option>
									<option value="�з���">
										�з���
									</option>
									<option value="����">
										����
									</option>
								</select>
							</div>
							<div align="center" id="department<%=user.getUserid()%>">
								<%=user.getDepartment()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="position1<%=user.getUserid()%>">
								<select size="1" name="position">
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
									<option value="�ܾ���">
										�ܾ���
									</option>
									<option value="��˾����">
										��˾����
									</option>
								</select>
							</div>
							<div align="center" id="position<%=user.getUserid()%>">
								<%=user.getPosition()%>
							</div>
						</TD>
						<TD>
							<div align="center" id="tel1<%=user.getUserid()%>">
								<input value="<%=user.getTel()%>">
							</div>
							<div align="center" id="tel<%=user.getUserid()%>">
								<%=user.getTel()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="level1<%=user.getUserid()%>">
								<select size="1" name="level">
									<option value=" ��ͨ�û�">
										��ͨ�û�
									</option>
									<option value="һ�����Ա">
										һ�����Ա
									</option>
									<option value="��������Ա">
										��������Ա
									</option>
								</select>
							</div>
							<div align="center" id="level<%=user.getUserid()%>">
								<%=user.getLevel()%>
							</div>
						</TD>

						<TD>
							<div align="center">
								<input type="hidden" id="storeEdit<%=user.getUserid()%>"
									value="0">
								<a id="edit<%=user.getUserid()%>" href='javascript:void(0)'
									style="border: 0px"><img src="images/ad.gif" /> </a>
							</div>

						</TD>
						<TD>
							<div align="center">
								<a id="deleteedit<%=user.getUserid()%>"
									href='javascript:void(0)' style="border: 0px"><img
										src="images/defind.gif" />
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

