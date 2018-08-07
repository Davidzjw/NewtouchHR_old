<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="com.coe.dto.Recruitmentinfo"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link href="../images/skin.css" rel="stylesheet" type="text/css" />
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="../css/ui.all.css" rel="stylesheet" />
<link type="text/css" href="../css/style.css" rel="stylesheet" />
<script type="text/javascript" src="../js/ui.core.js"></script>
<script type="text/javascript" src="../js/ui.datepicker.js"></script>
<script type="text/javascript" src="../js/ui.datepicker-zh_CN.js"></script>
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
			<td width="17" valign="top" background="../images/mail_leftbg.gif">
				<img src="../images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="../images/content-bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0"
					cellspacing="0" class="left_topbg" id="table2">
					<tr>
						<td height="31">
							<div class="titlebt">
								招聘信息
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
								招聘名称
							</p>
						</TH>
						<TH>
							<p>
								招聘部门
							</p>
						</TH>
						<TH>
							<p>
								开始时间
							</p>
						</TH>
						<TH>
							<p>
								招聘人数
							</p>
						</TH>
						<TH>
							<p>
								结束时间
							</p>
						</TH>
						<TH>
							<p>
								招聘内容
							</p>
						</TH>
						<TH>
							<p>
								发布时间
							</p>
						</TH>


					</TR>
					<%
						List list = (List) session.getAttribute("listptyhrecruitmentinfo");

						Iterator it = list.iterator();
						Recruitmentinfo recruitmentinfo = new Recruitmentinfo();
						while (it.hasNext()) {

							recruitmentinfo = (Recruitmentinfo) it.next();
					%>
					<TR onMouseOver="this.className='tr_over'"
						onMouseOut="this.className=''" id="<%=recruitmentinfo.getRiid()%>">

						
						<TD>
							<div align="center" id="rname<%=recruitmentinfo.getRiid()%>">
								<%=recruitmentinfo.getRname()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="department<%=recruitmentinfo.getRiid()%>">
								<%=recruitmentinfo.getDepartment()%>
							</div>
						</TD>
						<TD>
							<div align="center" id="rest<%=recruitmentinfo.getRiid()%>">
								<%=recruitmentinfo.getRest()%>
							</div>

						</TD>
						<TD>
							<div align="center" id="rers<%=recruitmentinfo.getRiid()%>">
								<%=recruitmentinfo.getRers()%>
							</div>
						</TD>
						<TD>
							<div align="center" id="reut<%=recruitmentinfo.getRiid()%>">
								<%=recruitmentinfo.getReut()%>
							</div>
						</TD>

						<TD>
							<div align="center" id="content<%=recruitmentinfo.getRiid()%>">
								<%=recruitmentinfo.getContent()%>
							</div>
						</TD>

						<TD>
							<div align="center" id="rept<%=recruitmentinfo.getRiid()%>">
								<%=recruitmentinfo.getRept()%>
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

