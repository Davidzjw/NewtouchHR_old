<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
<link type="text/css" href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/ui.core.js"></script>
<script type="text/javascript" src="js/ui.datepicker.js"></script>
<script type="text/javascript" src="js/ui.datepicker-zh_CN.js"></script>
<script type="text/javascript">
	function datePicker(pickerName,locale) {
		$(pickerName).datepicker($.datepicker.regional[locale]);
		$(pickerName).datepicker('option', 'changeMonth', true);//月份可调
		$(pickerName).datepicker('option', 'changeYear', true);//年份可调
	}
	
	$(function() {
		//var locale = "<s:property value='#request.locale'/>";//struts2取语言环境
		//var locale = "<%=request.getLocale()%>"; //jsp取浏览器语言环境
		//datePicker('#dateDemo',locale);//根据语言环境切换日期控件语言
		datePicker('#dateDemo','zh_CN');
		datePicker('#dateDemo1','zh_CN');
		//datePicker('#dateDemo',''); //''默认的样式在ui.datepicker.js内已定义为英文样式，与附件内的ui.datepicker-en_US.js相同
	});
	</script>
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
								新应聘者
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


				<form action="addCandidates.do?method=addCandidates&level=一般管理员"
					method="POST">
					<table width="100%"  align="center"  height="98%">
						
						<TR onMouseOver="this.className='tr_over'"
							onMouseOut="this.className=''">

							<TD>

								<div align="center">
									新人姓名：
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>

								<div align="left">
									<input type="text" name="caname" size="60" id="caname">
								</div>

							</TD>
						</tr>
						<tr>
							<TD>

								<div align="center">
									应聘部门：
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>

								<div align="left">
									<input type="text" name="department" value="<%=session.getAttribute("department") %>" readonly="readonly">
									&nbsp;&nbsp;&nbsp; 应聘职务：&nbsp;
									<select size="1" name="position" id="position">
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
									</select>
								</div>
								
							</TD>

						</tr>
						<tr>
							<TD>

								<div align="center">
									联系方式：
									<br>

								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>


								<div align="left">
									<input type="text" name="catel" size="60" id="catel">
									<input type="hidden" name="level" value="<%=session.getAttribute("level") %>">
									&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
								</div>
							</TD>

						</tr>
						<tr>
							<TD valign="top">
								<div align="center">
									
									具体信息：

								</div>
								<div align="center">
									<br>
								</div>
							</TD>
							<td valign="top">
								<br>
							</td>
							<TD valign="top">
							
								<div align="left">
									<textarea cols="100" rows="18" name="cainfo" id="cainfo"></textarea>
								</div>

							</TD>
						<tr>
							<TD valign="top">
								<div align="center">
									<input type="submit" value="提交" id="addcan">
								</div>

							</TD>
							<td valign="top">
								<br>
							</td>
							<TD>
								<div align="left">
									&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp; &nbsp; &nbsp;
									<input type="reset" value="重置">
								</div>

							</TD>
						</tr>
					</table>

				</form>
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

