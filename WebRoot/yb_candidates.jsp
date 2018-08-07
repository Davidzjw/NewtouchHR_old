<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Candidates"%>
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
<script type="text/javascript" src="js/editeCandidates.js" charset="GBK"></script>

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
								应聘管理
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

				<form action="findCandidatesbymh.do?method=findCandidatesbymh"
					method="POST">
					应聘人姓名:
					<input type="text" name="caname">
					<input type="hidden" name="department"
						value="<%=session.getAttribute("department")%>">
					<input type="hidden" name="level" value="一般管理员">
					应聘职务：
					<select size="1" name="position">
						<option value="">

						</option>
						<option value="普通员工">
							普通员工
						</option>
						<option value="小组组长">
							小组组长
						</option>
						<option value="经理助理">
							经理助理
						</option>
						<option value="部门经理">
							部门经理
						</option>
						<option value="总经理">
							总经理
						</option>
						<option value="公司董事">
							公司董事
						</option>
					</select>
					应聘人信息：
					<input type="text" name="cainfo">

					应聘人状态：
					<select size="1" name="camark">
						<option value="">

						</option>
						<option value="待审核中">
							待审核中
						</option>
						<option value="笔试考核中">
							笔试考核中
						</option>
						<option value="面试考核中">
							面试考核中
						</option>
						<option value="试用期中">
							试用期中
						</option>
						<option value="正式录用">
							正式录用
						</option>
					</select>

					<input type="submit" value="查询">
				</form>
				<hr>
				<table id="data" width="100%" align="center">
					<TR id="-1000">

						<TH>
							<p>
								应聘人姓名
							</p>
						</TH>
						<TH>
							<p>
								应聘部门
							</p>
						</TH>
						<TH>
							<p>
								应聘职务
							</p>
						</TH>
						<TH>
							<p>
								应聘人联系方式
							</p>
						</TH>
						<TH>
							<p>
								应聘人信息
							</p>
						</TH>
						<TH>
							<p>
								应聘人状态
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
						Candidates candidates = new Candidates();
						while (it.hasNext()) {
							candidates = (Candidates) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=candidates.getCaid()%>">

						
						<TD>
							<div align="center" id="caname1<%=candidates.getCaid()%>">
								<input value="<%=candidates.getCaname()%>">
							</div>

							<div align="center" id="caname<%=candidates.getCaid()%>">
								<%=candidates.getCaname()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="department1<%=candidates.getCaid()%>">
								<input value="<%=candidates.getDepartment()%>">
							</div>
							<div align="center" id="department<%=candidates.getCaid()%>">
								<%=candidates.getDepartment()%>
							</div>
						</TD>
						<TD>
							<div align="center" id="position1<%=candidates.getCaid()%>">
								<input value="<%=candidates.getPosition()%>">
							</div>
							<div align="center" id="position<%=candidates.getCaid()%>">
								<%=candidates.getPosition()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="catel1<%=candidates.getCaid()%>">
								<input value="<%=candidates.getCatel()%>">
							</div>
							<div align="center" id="catel<%=candidates.getCaid()%>">
								<%=candidates.getCatel()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="cainfo1<%=candidates.getCaid()%>">
								<input value="<%=candidates.getCainfo()%>">
							</div>
							<div align="center" id="cainfo<%=candidates.getCaid()%>">
								<%=candidates.getCainfo()%>
							</div>


						</TD>

						<TD>
							<div align="center">
								<select size="1" name="camark"
									id="camark1<%=candidates.getCaid()%>">
									<option value="">

									</option>
									<option value="待审核中">
										待审核中
									</option>
									<option value="笔试考核中">
										笔试考核中
									</option>
									<option value="面试考核中">
										面试考核中
									</option>
									<option value="试用期中">
										试用期中
									</option>
									<option value="正式录用">
										正式录用
									</option>
								</select>
							</div>
							<div align="center" id="camark<%=candidates.getCaid()%>">
								<%=candidates.getCamark()%>
							</div>


						</TD>
						<TD>
							<div align="center">
								<input type="hidden" id="storeEdit<%=candidates.getCaid()%>"
									value="0">
								<a id="edit<%=candidates.getCaid()%>" href='javascript:void(0)'
									style="border: 0px"><img src="images/ad.gif" /> </a>
							</div>
						<TD>
							<div align="center">
								<a id="deleteedit<%=candidates.getCaid()%>"
									href='javascript:void(0)' style="border: 0px"><img
										src="images/defind.gif" /> </a>
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

