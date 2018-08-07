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
								员工管理
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
					姓名：
					<input type="text" name="username">
					年龄：
					<input type="text" name="age">
					性别：男
					<input type="radio" checked="checked" value="男" name="sex">
					女
					<input type="radio" value="女" name="sex">
					<input type="hidden"
						value="<%=session.getAttribute("department")%>" name="department">
					职务：
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
					<input type="hidden" value="一般管理员" name="level">
					<input type="submit" value="提交">
				</form>
				<hr>

				<table id="data" width="100%" align="center">
					<TR id="-1000">

						
						<TH>
							<p>
								姓名
							</p>
						</TH>
						<TH>
							<p>
								密码
							</p>
						</TH>
						<TH>
							<p>
								年龄
							</p>
						</TH>
						<TH>
							<p>
								性别
							</p>
						</TH>
						<TH>
							<p>
								部门
							</p>
						</TH>
						<TH>
							<p>
								职务
							</p>
						</TH>
						<TH>
							<p>
								电话
							</p>
						</TH>
						<TH>
							<p>
								级别
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
									<option value="人事部">
										人事部
									</option>
									<option value="财务部">
										财务部
									</option>
									<option value="市场部">
										市场部
									</option>
									<option value="销售部">
										销售部
									</option>
									<option value="研发部">
										研发部
									</option>
									<option value="其它">
										其它
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
									<option value=" 普通用户">
										普通用户
									</option>
									<option value="一般管理员">
										一般管理员
									</option>
									<option value="超级管理员">
										超级管理员
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

