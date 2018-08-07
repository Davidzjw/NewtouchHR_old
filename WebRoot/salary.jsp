<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Information"%>
<%@page import="com.coe.dto.Salary"%>
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
<script type="text/javascript" src="js/editeSalary.js" charset="GBK"></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
$("#1").click(function(){
    $("#2").slideToggle("slow");
  });
  $("#3").click(function(){
    $("#4").slideToggle("slow");
  });
});
</script>
<style type="text/css">
div.panel,b.flip {
	margin: 0px;
	padding: 5px;
	text-align: center;
	background: #B7E1FA;
	border: solid 1px #c3c3c3;
}

div.panel {
	height: 40px;
	display: none;
}
</style>
<body>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
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
								薪金管理
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
				<form action="findSalarybymh.do?method=findSalarybymh" method="POST">
					员工姓名:
					<select size="1" name="cxusername">
						<option value="">
							员工姓名：
						</option>
						<%
							List inforList = (List) request.getAttribute("listInfor");
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
					<input type="hidden" name="level" value="超级管理员">
					<input type="submit" value="查询">
					<b class="flip" id="3"> 录入薪金 </b>
				</form>
				<hr>
				<div class="panel" id="4">
					<form action="saveSalary.do?method=saveSalary" method="POST">
						<table>
							<tr>
								<td>
									员工姓名：
								</td>
								<td>
									<select size="1" name="username" id="username">
										<option value="">
											员工姓名
										</option>
										<%
											Iterator itinfor2 = inforList.iterator();
											Information information1 = new Information();
											while (itinfor2.hasNext()) {
												information1 = (Information) itinfor2.next();
										%>
										<option value="<%=information1.getUserid()%>">
											<%=information1.getUsername()%>
										</option>
										<%
											}
										%>
									</select>
								</td>
								<td>
									基本工资：
								</td>
								<td>
									<input type="text" name="bwage" id="bwage">
								</td>
								<td>
									住房公积金 ：
								</td>
								<td>
									<input type="text" name="housefund" id="housefund">
								</td>
								<td>
									养老保险 ：
								</td>
								<td>
									<input type="text" name="pension" id="pension">
								</td>
							</tr>
							<tr>
								<td>
									医疗保险 ：
								</td>
								<td>
									<input type="text" name="health" id="health">
								</td>
								<td>
									失业保险 ：
								</td>
								<td>
									<input type="text" name="unemployment" id="unemployment">
								</td>
								<td>
									报销金额 ：
								</td>
								<td>
									<input type="text" name="reimbursement" id="reimbursement">
								</td>
								<td>
									业绩奖金：
								</td>
								<td>
									<input type="text" name="paword" id="paword">
								</td>
								<td>
									<input type="hidden" name="level" value="超级管理员">
									<input type="submit" value="保存" id="addsalary">
								</td>
							</tr>
						</table>
					</form>
				</div>

				<hr>
				<table id="data" width="100%" align="center">
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
								基本工资
							</p>
						</TH>
						<TH>
							<p>
								住房公积金
							</p>
						</TH>
						<TH>
							<p>
								养老保险
							</p>
						</TH>
						<TH>
							<p>
								医疗保险
							</p>
						</TH>
						<TH>
							<p>
								失业保险
							</p>
						</TH>

						<TH>
							<p>
								报销金额
							</p>
						</TH>
						<TH>
							<p>
								业绩奖金
							</p>
						</TH>
						<TH>
							<p>
								月份
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
						Salary salary = new Salary();
						while (it.hasNext()) {
							salary = (Salary) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=salary.getSid()%>">


						<TD>
							<div align="center" id="userid1<%=salary.getSid()%>">
								<input value="<%=salary.getInformation().getUserid()%>">
							</div>

							<div align="center" id="userid<%=salary.getSid()%>">
								<%=salary.getInformation().getUsername()%>
							</div>

						</TD>
						<TD>

							<div align="center">
								<p><%=salary.getInformation().getDepartment()%></p>
							</div>
						</TD>
						<TD>
							<div align="center" id="bwage1<%=salary.getSid()%>">
								<input value="<%=salary.getBwage()%>">
							</div>
							<div align="center" id="bwage<%=salary.getSid()%>">
								<%=salary.getBwage()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="housefund1<%=salary.getSid()%>">
								<input value="<%=salary.getHousefund()%>">
							</div>
							<div align="center" id="housefund<%=salary.getSid()%>">
								<%=salary.getHousefund()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="pension1<%=salary.getSid()%>">
								<input value="<%=salary.getPension()%>">
							</div>
							<div align="center" id="pension<%=salary.getSid()%>">
								<%=salary.getPension()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="health1<%=salary.getSid()%>">
								<input value="<%=salary.getHealth()%>">
							</div>
							<div align="center" id="health<%=salary.getSid()%>">
								<%=salary.getHealth()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="unemployment1<%=salary.getSid()%>">
								<input value="<%=salary.getUnemployment()%>">
							</div>
							<div align="center" id="unemployment<%=salary.getSid()%>">
								<%=salary.getUnemployment()%>
							</div>


						</TD>
						<TD>
							<div align="center" id="reimbursement1<%=salary.getSid()%>">
								<input value="<%=salary.getReimbursement()%>">
							</div>
							<div align="center" id="reimbursement<%=salary.getSid()%>">
								<%=salary.getReimbursement()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="paword1<%=salary.getSid()%>">
								<input value="<%=salary.getPaword()%>">
							</div>
							<div align="center" id="paword<%=salary.getSid()%>">
								<%=salary.getPaword()%>
							</div>

						</TD>
						<TD>
							<div align="center">
								<%=salary.getTime().substring(0, 7)%>
							</div>
						</TD>
						<TD align="center">
							<input type="hidden" id="storeEdit<%=salary.getSid()%>" value="0">
							<a id="edit<%=salary.getSid()%>" href='javascript:void(0)'
								style="border: 0px"><img src="images/ad.gif" /> </a>


						</TD>

						<TD>
							<div align="center">
								<a id="delete<%=salary.getSid()%>" href='javascript:void(0)'
									style="border: 0px"><img src="images/defind.gif" /> </a>
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

