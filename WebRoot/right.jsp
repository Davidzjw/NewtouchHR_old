<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Notice"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link href="images/skin.css" rel="stylesheet" type="text/css" />


<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
<body>
	<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif">
				<img src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="images/content-bg.gif">
				<table width="100%" height="31" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31">
							<div class="titlebt">
								��ӭ����
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
				<table width="98%" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="2" valign="top">
							&nbsp;

						</td>
						<td>
							&nbsp;

						</td>
						<td valign="top">
							&nbsp;

						</td>
					</tr>
					<tr>
						<td colspan="2" valign="top">
							<span class="left_bt">��л��ʹ��MYOFFICE��ҵ���¹���ϵͳ</span>
							<br>
							<br>
							<span class="left_txt">&nbsp;<img src="images/ts.gif"
									width="16" height="16"> ��ʾ��<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ʹ�õ��Ǳ�С�鿪����һ��������ҵ���¹���ķ�רҵϵͳ������������</span><span
								class="left_txt">ָ�̣�<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������������ϣ�һվͨʹ�÷�ʽ������ǿ�󣬲����򵥣���̨�������練�ƣ�ֻ��Ὺ������ʹ����꣬�����֣����ܵ�HR��<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�Ͽ����ɣ� <br> </span>
						</td>
						<td width="7%">
							&nbsp;

						</td>
						<td width="40%" valign="top">
							<table width="100%" height="144" cellpadding="0" cellspacing="0"
								class="line_table">
								<tr>
									<td width="7%" height="27"
										background="images/news-title-bg.gif">
										<img src="images/news-title-bg.gif" width="2" height="27">
									</td>
									<td width="93%" background="images/news-title-bg.gif"
										class="left_bt2">
										ǩ��/ǩ��
									</td>
								</tr>
								<tr>
									<td height="102" valign="top">
										&nbsp;

									</td>
									<td height="102" valign="top">
										<span class="left_txt">&nbsp;<img src="images/ts.gif"
												width="16" height="16"> ��Ӫ���ȫ��ȫ��ΪƷ��ע������ֵ <br>
											&nbsp;&nbsp;����������ҷֻ��� �����ٷ����� <br>
											&nbsp;&nbsp;�Ŷ�������顢רע����Ч������ <br>
											&nbsp;&nbsp;��չ����������Ϊ�������м�ֵ�Ĺ������� <br>
											&nbsp;&nbsp;�˲Źۣ�����Ϊ�� ��˾�Ļ�����˼ԵΪ�� ��˼ԵΪ�� </span>

										<form action="saveAttendence.do?method=saveAttendence"
											method="POST">
											<input type="hidden" name="username" value="${username}"/ >
											<input type="hidden" name="password" value="${password}"/ >
											<input type="hidden" name="level"
												value="<%=session.getAttribute("level")%>"/ >
											<input type="hidden" name="department"
												value="<%=session.getAttribute("department")%>"/ >
											<input type="submit" value="ǩ��/ǩ��">
										</form>
									</td>
								</tr>
								<tr>
									<td height="5" colspan="2">
										&nbsp;

									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							&nbsp;

						</td>
						<td>
							&nbsp;

						</td>
						<td>
							&nbsp;

						</td>
					</tr>
					<tr>
						<td colspan="2" valign="top">
							<!--JavaScript����-->
							<SCRIPT language=javascript>
function secBoard(n)
{
for(i=0;i<secTable.cells.length;i++)
secTable.cells[i].className="sec1";
secTable.cells[n].className="sec2";
for(i=0;i<mainTable.tBodies.length;i++)
mainTable.tBodies[i].style.display="none";
mainTable.tBodies[n].style.display="block";
}
          </SCRIPT>
							<!--HTML����-->
							<TABLE width=72% border=0 cellPadding=0 cellSpacing=0 id=secTable>
								<TBODY>
									<TR align=middle height=20>
										<TD align="center" class=sec2 onclick=secBoard(0)>
											ϵͳ����
										</TD>
										<TD align="center" class=sec1 onclick=secBoard(1)>
											��Ȩ˵��
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<TABLE class=main_tab id=mainTable cellSpacing=0 cellPadding=0
								width=100% border=0>
								<!--����TBODY���
								<TBODY style="DISPLAY: none">
									<TR>
										<TD vAlign=top align=middle>
											<TABLE width=98% height="133" border=0 align="center"
												cellPadding=0 cellSpacing=0>
												<TBODY>
													<TR>
														<TD height="5" colspan="1"></TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"> </span>
															<span class="left_ts"> </span>
															<br>
														</TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"></span>
															<span class="left_ts"> </span>
														</TD>
													</TR>
													<TR>
														<TD height="5" colspan="1"></TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>-->
								<!--����cells����
								<TBODY style="DISPLAY: none">
									<TR>
										<TD vAlign=top align=middle>
											<TABLE width=98% height="133" border=0 align="center"
												cellPadding=0 cellSpacing=0>
												<TBODY>
													<TR>
														<TD height="5" colspan="3"></TD>
													</TR>
													<TR>
														<TD width="4%" height="28"
															background="images/news-title-bg.gif"></TD>
														<TD colspan="2" background="images/news-title-bg.gif"
															class="left_txt">
														</TD>
													</TR>
													<TR>
														<TD width="42%" height="25" bgcolor="#FAFBFC">
															<span class="left_txt"></span><span class="left_txt"></span>
														</TD>
														<TD width="54%" bgcolor="#FAFBFC">
															<span class="left_txt"></span><span class="left_txt"></span>
														</TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"></span><span class="left_txt"></span>
														</TD>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"></span><span class="left_txt"></span>
														</TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"> </span><span class="left_txt">��</span>
														</TD>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"></span><span class="left_txt"></span>
														</TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"> </span><span class="left_txt"></span>
														</TD>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt"></span><span class="left_txt"></span>
														</TD>
													</TR>
													<TR>
														<TD height="5" colspan="3"></TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
								-->
								<!--����tBodies����-->
								<TBODY style="DISPLAY: block">
									<TR>
										<TD vAlign=top>
											<TABLE width=98% border=0 align="center" cellPadding=0
												cellSpacing=0>
												<TBODY>
													<TR>
														<TD colspan="3"></TD>
													</TR>
													<TR>
														<TD height="5" colspan="3"></TD>
													</TR>
													<TR>
														<TD width="4%" height="25"
															background="images/news-title-bg.gif"></TD>
														<TD height="25" colspan="2"
															background="images/news-title-bg.gif" class="left_txt">
															<span class="TableRow2">ʵ�ַ�ʽ��</span>SSH+JQUERY
														</TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															&nbsp;

														</TD>
														<TD width="42%" height="25" bgcolor="#FAFBFC">
															<span class="left_txt">��������</span>TOMCAT6.0
														</TD>
														<TD width="54%" height="25" bgcolor="#FAFBFC">
															<span class="left_txt">�������ߣ�</span>MYECLIPSE6.5
														</TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															&nbsp;

														</TD>
														<TD height="25" colspan="2" bgcolor="#FAFBFC">
															<span class="left_txt">վ������·����</span>Http://localHost:8080
														</TD>
													</TR>
													<TR>
														<TD height="25" bgcolor="#FAFBFC">
															&nbsp;

														</TD>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt">FSO�ı���д��</span><span
																class="TableRow2"><font color="#FF0066"><b><img
																			src="images/X.gif" width="12" height="13"> </b> </font> <img
																	src="images/g.gif" width="12" height="12"> </span>
														</TD>
														<TD height="25" bgcolor="#FAFBFC">
															<span class="left_txt">���ݿ�ʹ�ã�</span><span class="left_ts"><img
																	src="images/X.gif" width="12" height="13"><b
																style="color: blue"> MYSQL </b> </span>
														</TD>
													</TR>

													<TR>
														<TD height="5" colspan="3"></TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
								<!--����display����-->
								<TBODY style="DISPLAY: none">
									<TR>
										<TD vAlign=top align=middle>
											<TABLE width=98% border=0 align="center" cellPadding=0
												cellSpacing=0>
												<TBODY>
													<TR>
														<TD colspan="3"></TD>
													</TR>
													<TR>
														<TD height="5" colspan="3"></TD>
													</TR>
													<TR>
														<TD width="4%" background="images/news-title-bg.gif"></TD>
														<TD width="91%" background="images/news-title-bg.gif"
															class="left_ts">
															����˵����
														</TD>
														<TD width="5%" background="images/news-title-bg.gif"
															class="left_txt">
															&nbsp;

														</TD>
													</TR>
													<TR>
														<TD bgcolor="#FAFBFC">
															&nbsp;

														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															<span class="left_ts">1��</span>�������ɱ�С�鶦������
														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															&nbsp;

														</TD>
													</TR>
													<TR>
														<TD bgcolor="#FAFBFC">
															&nbsp;

														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															<span class="left_ts">2��</span>��������ṩʹ�ã��κ�Υ���������涨����Ϊ�����и���
														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															&nbsp;

														</TD>
													</TR>
													<TR>
														<TD bgcolor="#FAFBFC">
															&nbsp;

														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															<span class="left_ts">3��</span> ֧�����ߵ��Ͷ����뱣����Ȩ��
														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															&nbsp;

														</TD>
													</TR>
													<TR>
														<TD bgcolor="#FAFBFC">
															&nbsp;

														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															<span class="left_ts">4��</span>����֧�֣��Ѻú���
														</TD>
														<TD bgcolor="#FAFBFC" class="left_txt">
															&nbsp;

														</TD>
													</TR>
													<TR>
														<TD height="5" colspan="3"></TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</td>
						<td>
							&nbsp;

						</td>
						<td valign="top">
							<table width="100%" height="144" border="0" cellpadding="0"
								cellspacing="0" class="line_table">
								<tr>
									<td width="7%" height="27"
										background="images/news-title-bg.gif">
										<img src="images/news-title-bg.gif" width="2" height="27">
									</td>
									<td width="93%" background="images/news-title-bg.gif"
										class="left_bt2">
										��˾����
									</td>
								</tr>
								<tr>
									<td height="102" valign="top">
										&nbsp;

									</td>
									<td height="102" valign="top">
										<label></label>
										<label>
											<table width="320">
												<%
													List list = (List) session.getAttribute("listNotice");
													Iterator it = list.iterator();
													while (it.hasNext()) {
														Notice notice = (Notice) it.next();
												%>
												<tr><%=notice.getNcontent()%></tr>


												<%
													}
												%>

											</table>
										</label>
									</td>
								</tr>
								<tr>
									<td height="5" colspan="2">
										&nbsp;

									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="40" colspan="4">
							<table width="100%" height="1" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#CCCCCC">
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="2%">
							&nbsp;

						</td>
						<td width="51%" class="left_txt">
							<img src="images/icon-mail2.gif" width="16" height="11">
							�ͻ��������䣺123456789
							<br>
							<img src="images/icon-phone.gif" width="17" height="14">
							�ٷ���վ��www.qqqqqqq.com
						</td>
						<td>
							&nbsp;

						</td>
						<td>
							&nbsp;

						</td>
					</tr>
				</table>
			</td>
			<td background="images/mail_rightbg.gif">
				&nbsp;

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

