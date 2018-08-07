package com.coe.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.coe.dto.Information;
import com.coe.service.IAttendanceService;
import com.coe.service.ICandidatesService;
import com.coe.service.IIformationService;
import com.coe.service.ISalaryService;

public class DynaChartAction extends DispatchAction {

	private IIformationService iformationService;
	String[] colors = { "AFD8F8", "F6BD0F", "8BBA00", "FF8E46", "8E468E",
			"D64646", "008E8E", "588526", "B3AA00", "008ED6", "9D080D",
			"A186BE" };

	/*
	 * 按性别查询
	 * 
	 */

	private IAttendanceService attendanceService;
	private ISalaryService salaryService;
	private ICandidatesService candidatesService;

	public ActionForward getChart(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String xmlStr = getChartDateXml();
		JSONObject jo = new JSONObject();
		if (!(xmlStr.equals(""))) {
			jo.put("isEmpty", "1");
			jo.put("xmlstr", xmlStr);
			out.print(jo.toString());
		} else {
			jo.put("isEmpty", "0");
			jo.put("xmlstr", "");
			out.print(jo.toString());
		}
		return null;
	}

	public String getChartDateXml() {

		StringBuffer dataBuffer = new StringBuffer();
		String graph = "<chart rotateNames='0' labelStep='2' pieSliceDepth='30' caption='用户性别统计' xAxisName='"
				+ "性别"
				+ "'"
				+ "yAxisName='用户数量' showNames='1' animation='1' rotateYAxisName='1' decimalPrecision='0' "
				+ "formatNumberScale='0' baseFontSize='15'>";
		dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
				graph);

		List list = this.getIformationService().getInfomationNum();

		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			String setStr = "";
			setStr = "<set label='" + obj[0] + "' value='" + obj[1]
					+ "' color='" + colors[i] + "'/>";

			dataBuffer.append(setStr);

		}
		dataBuffer.append("</chart>");

		return dataBuffer.toString();
	}

	/*
	 * 一般用户报表查看本部门的信息
	 */

	public ActionForward getybChart(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String department = request.getParameter("department");
		String xmlStr = getybChartDateXml(department);
		JSONObject jo = new JSONObject();
		if (!(xmlStr.equals(""))) {
			jo.put("isEmpty", "1");
			jo.put("xmlstr", xmlStr);
			out.print(jo.toString());
		} else {
			jo.put("isEmpty", "0");
			jo.put("xmlstr", "");
			out.print(jo.toString());
		}
		return null;
	}

	public String getybChartDateXml(String department) {

		StringBuffer dataBuffer = new StringBuffer();
		String graph = "<chart rotateNames='0' labelStep='2' pieSliceDepth='30' caption='员工部门统计' xAxisName='"
				+ "部门"
				+ "'"
				+ "yAxisName='用户数量' showNames='1' animation='1' rotateYAxisName='1' decimalPrecision='0' "
				+ "formatNumberScale='0' baseFontSize='15'>";
		dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
				graph);

		List list = this.getIformationService().getybInfomationNum(department);

		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			String setStr = "";
			setStr = "<set label='" + obj[0] + "' value='" + obj[1]
					+ "' color='" + colors[i] + "'/>";

			dataBuffer.append(setStr);

		}
		dataBuffer.append("</chart>");

		return dataBuffer.toString();
	}

	public ActionForward getdepartmentChart(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String xmlStr = getdepChartDateXml();
		JSONObject jo = new JSONObject();
		if (!(xmlStr.equals(""))) {
			jo.put("isEmpty", "1");
			jo.put("xmlstr", xmlStr);
			out.print(jo.toString());
		} else {
			jo.put("isEmpty", "0");
			jo.put("xmlstr", "");
			out.print(jo.toString());
		}
		return null;
	}

	public String getdepChartDateXml() {

		StringBuffer dataBuffer = new StringBuffer();
		String graph = "<chart rotateNames='0' labelStep='2' pieSliceDepth='30' caption='用户部门统计' xAxisName='"
				+ "部门"
				+ "'"
				+ "yAxisName='用户数量' showNames='1' animation='1' rotateYAxisName='1' decimalPrecision='0' "
				+ "formatNumberScale='0' baseFontSize='15'>";
		dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
				graph);

		List list = this.getIformationService().getInformationdepNum();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			String setStr = "";
			setStr = "<set label='" + obj[0] + "' value='" + obj[1]
					+ "' color='" + colors[i] + "'/>";

			dataBuffer.append(setStr);

		}
		dataBuffer.append("</chart>");

		return dataBuffer.toString();
	}

	/*
	 * 按职务查询
	 * 
	 */

	public ActionForward getDateChartOfposition(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String xmlStr = getpositionChartDateXml();
		JSONObject jo = new JSONObject();
		if (!(xmlStr.equals(""))) {
			jo.put("isEmpty", "1");
			jo.put("xmlstr", xmlStr);
			out.print(jo.toString());
		} else {
			jo.put("isEmpty", "0");
			jo.put("xmlstr", "");
			out.print(jo.toString());
		}
		return null;
	}

	public String getpositionChartDateXml() {

		StringBuffer dataBuffer = new StringBuffer();
		String graph = "<chart rotateNames='0' labelStep='2' pieSliceDepth='30' caption='用户职务统计' xAxisName='"
				+ "职务"
				+ "'"
				+ "yAxisName='用户数量' showNames='1' animation='1' rotateYAxisName='1' decimalPrecision='0' "
				+ "formatNumberScale='0' baseFontSize='15'>";
		dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
				graph);

		List list = this.getIformationService().getinformationpositon();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			String setStr = "";
			setStr = "<set label='" + obj[0] + "' value='" + obj[1]
					+ "' color='" + colors[i] + "'/>";

			dataBuffer.append(setStr);

		}
		dataBuffer.append("</chart>");

		return dataBuffer.toString();
	}

	/*
	 * 按人查看考勤
	 * 
	 * 
	 */

	public ActionForward getDateChartOfAttendance(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String xmlStr = getAttendanceChartDateXml();
		JSONObject jo = new JSONObject();
		if (!(xmlStr.equals(""))) {
			jo.put("isEmpty", "1");
			jo.put("xmlstr", xmlStr);
			out.print(jo.toString());
		} else {
			jo.put("isEmpty", "0");
			jo.put("xmlstr", "");
			out.print(jo.toString());
		}
		return null;
	}

	public String getAttendanceChartDateXml() {

		StringBuffer dataBuffer = new StringBuffer();
		String graph = "<chart rotateNames='0' labelStep='2' pieSliceDepth='30' caption='员工考勤统计' xAxisName='"
				+ "员工姓名"
				+ "'"
				+ "yAxisName='用户数量' showNames='1' animation='1' rotateYAxisName='1' decimalPrecision='0' "
				+ "formatNumberScale='0' baseFontSize='15'>";
		dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
				graph);

		List list = this.getAttendanceService().getAttendanceNum();
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			Information information = (Information) obj[0];
			String setStr = "";
			setStr = "<set label='" + information.getUsername() + "' value='"
					+ obj[1] + "' color='" + colors[i] + "'/>";

			dataBuffer.append(setStr);

		}
		dataBuffer.append("</chart>");

		return dataBuffer.toString();
	}

	

	public ActionForward getChartOfzhaopin(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String str = request.getParameter("str");
		String xmlStr = getzhaopinChartDateXml(str);
		JSONObject jo = new JSONObject();
		if (!(xmlStr.equals(""))) {
			jo.put("isEmpty", "1");
			jo.put("xmlstr", xmlStr);
			out.print(jo.toString());
		} else {
			jo.put("isEmpty", "0");
			jo.put("xmlstr", "");
			out.print(jo.toString());
		}
		return null;
	}

	public String getzhaopinChartDateXml(String str) {

		StringBuffer dataBuffer = new StringBuffer();
		String graph = "<chart rotateNames='0' labelStep='2' pieSliceDepth='30' caption='应聘人统计' xAxisName='"
				+ "应聘部门/职务"
				+ "'"
				+ "yAxisName='人员数量' showNames='1' animation='1' rotateYAxisName='1' decimalPrecision='0' "
				+ "formatNumberScale='0' baseFontSize='15'>";
		dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
				graph);

		List list = this.getCandidatesService().getzhaopinNum(str);
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = (Object[]) list.get(i);
			String setStr = "";
			setStr = "<set label='" + obj[0] + "' value='" + obj[1]
					+ "' color='" + colors[i] + "'/>";

			dataBuffer.append(setStr);

		}
		dataBuffer.append("</chart>");

		return dataBuffer.toString();
	}

	// --------------------------------------------------------------------------------
	/*
	 * 按人查看工资
	 * 
	 * 
	 */

	public ActionForward getDateChartOfSalarybydep(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String str = request.getParameter("str");
		String str2 = request.getParameter("str2");
		String str3 = request.getParameter("str3");
		str3 = java.net.URLDecoder.decode(str3, "utf-8");
		String str4=request.getParameter("str4");;
		if(!str3.equals("")&&str3!=null){
			str3=str3.substring(0,7)+"-01";
			str4=str4.substring(0,7)+"-30";
		}
		
		System.out.println(str3);
		str2 = java.net.URLDecoder.decode(str2, "utf-8");
		
		System.out.println(str2);
		PrintWriter out = response.getWriter();
		String xmlStr = getSalarybydepChartDateXml(str, str2,str3,str4);
		JSONObject jo = new JSONObject();
		if (!(xmlStr.equals(""))) {
			jo.put("isEmpty", "1");
			jo.put("xmlstr", xmlStr);
			out.print(jo.toString());
		} else {
			jo.put("isEmpty", "0");
			jo.put("xmlstr", "");
			out.print(jo.toString());
		}
		return null;
	}

	public String getSalarybydepChartDateXml(String str, String dep,String time1,String time2) {

		StringBuffer dataBuffer = new StringBuffer();
		String graph = "<chart rotateNames='0' labelStep='2' pieSliceDepth='30' caption='员工薪金统计' xAxisName='"
				+ "员工姓名"
				+ "'"
				+ "yAxisName='"
				+ str
				+ "人民币（￥）"
				+ "' showNames='1' animation='1' rotateYAxisName='1' decimalPrecision='0' "
				+ "formatNumberScale='0' baseFontSize='15'>";
		dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
				graph);
		if (dep.equals("所有部门") && str.equals("0")) {
			List list1 = this
					.getSalaryService()
					.getSalaryNum(
							"(s.bwage+s.housefund+s.pension+s.health+s.unemployment+s.reimbursement+s.paword)",time1,time2);
			for (int i = 0; i < list1.size(); i++) {
				Object[] obj = (Object[]) list1.get(i);
				Information information = (Information) obj[0];
				String setStr = "";
				setStr = "<set label='" + information.getUsername()
						+ "' value='" + obj[1] + "' color='" + colors[i]
						+ "'/>";

				dataBuffer.append(setStr);

			}
			dataBuffer.append("</chart>");
		} else if (dep.equals("所有部门") && !str.equals("0")) {
			List list = this.getSalaryService().getSalaryNum(str,time1,time2);
			for (int i = 0; i < list.size(); i++) {
				Object[] obj = (Object[]) list.get(i);
				Information information = (Information) obj[0];
				String setStr = "";
				setStr = "<set label='" + information.getUsername()
						+ "' value='" + obj[1] + "' color='" + colors[i]
						+ "'/>";

				dataBuffer.append(setStr);

			}
			dataBuffer.append("</chart>");
		} else if (!dep.equals("所有部门") && str.equals("0")) {
			List list = this
					.getSalaryService()
					.getSalaryBydep(
							"(s.bwage+s.housefund+s.pension+s.health+s.unemployment+s.reimbursement+s.paword)",
							dep,time1,time2);
			for (int i = 0; i < list.size(); i++) {
				Object[] obj = (Object[]) list.get(i);
				Information information = (Information) obj[0];
				String setStr = "";
				setStr = "<set label='" + information.getUsername()
						+ "' value='" + obj[1] + "' color='" + colors[i]
						+ "'/>";

				dataBuffer.append(setStr);

			}
			dataBuffer.append("</chart>");
		} else if (!dep.equals("所有部门") && !str.equals("0")) {
			System.out.println(str);
			List list = this.getSalaryService().getSalaryBydep(str, dep,time1,time2);
			for (int i = 0; i < list.size(); i++) {
				Object[] obj = (Object[]) list.get(i);
				Information information = (Information) obj[0];
				String setStr = "";
				setStr = "<set label='" + information.getUsername()
						+ "' value='" + obj[1] + "' color='" + colors[i]
						+ "'/>";

				dataBuffer.append(setStr);

			}
			dataBuffer.append("</chart>");
		}

		return dataBuffer.toString();
	}

	// public String getReportDataXml(int year) {
	//
	// boolean isZero = true;
	// StringBuffer dataBuffer = new StringBuffer();
	// String graph = "<graph rotateNames='0' labelStep='2' pieSliceDepth='30'
	// caption='注册用户统计' xAxisName='"
	// + year
	// + "年 1-12月"
	// + "'"
	// + "yAxisName='用户数量' showNames='1' animation='1' rotateYAxisName='1'
	// decimalPrecision='0' "
	// + "formatNumberScale='0' baseFontSize='15'>";
	// dataBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>").append(
	// graph);
	//
	// for (int i = 1; i <= 12; i++) {
	// int num = this.getTotalDealNumByTime(year, i);
	// String setStr = "";
	// if (num > 0) {
	// isZero = false;
	// setStr = "<set name='" + i + "月' value='" + num + "' color='"
	// + colors[i - 1] + "'/>";
	// } else {
	// setStr = "<set name='" + i + "月' value='0' color='"
	// + colors[i - 1] + "'/>";
	// }
	// dataBuffer.append(setStr);
	// }
	// dataBuffer.append("</graph>");
	// if (isZero) { // 12个月每个月的数据都是0
	// return "";
	// } else {
	// return dataBuffer.toString();
	// }
	// }

	//
	// // 根据某一年12个月中每月的用户注册数
	// public int getTotalDealNumByTime(int year, int month) {
	// Calendar time = Calendar.getInstance();
	// time.clear();
	// time.set(Calendar.YEAR, year);
	// time.set(Calendar.MONTH, month - 1);
	// Date begin = time.getTime();
	// time.clear();
	// time.set(Calendar.YEAR, year);
	// time.set(Calendar.MONTH, month);
	// Date end = time.getTime();
	// SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//
	// String beginString = formatter.format(begin);
	// String endString = formatter.format(end);
	//
	// final java.sql.Timestamp beginStrSql = java.sql.Timestamp
	// .valueOf(beginString);
	// final java.sql.Timestamp endStrSql = java.sql.Timestamp
	// .valueOf(endString);
	//
	// String hql = "select count(*) from UserInfo us where us.registTime
	// between '"
	// + beginString + "' and '" + endString + "'";
	// int numOfUser = 0;
	//
	// // ApplicationContext context = new ClassPathXmlApplicationContext(
	// // "com/coe/xmlConfig/applicationContext-*.xml");
	// // UserInfoDaoImp dao = (UserInfoDaoImp) context.getBean("userInfoDAO");
	//
	// try {
	// numOfUser = this.getUserInfoDAO().getRegistUserOfMonth(null, hql);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// return numOfUser;
	// }

	/** ************************************************************************ */

	public String[] getColors() {
		return colors;
	}

	public void setColors(String[] colors) {
		this.colors = colors;
	}

	public IIformationService getIformationService() {
		return iformationService;
	}

	public void setIformationService(IIformationService iformationService) {
		this.iformationService = iformationService;
	}

	public IAttendanceService getAttendanceService() {
		return attendanceService;
	}

	public void setAttendanceService(IAttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}

	public ISalaryService getSalaryService() {
		return salaryService;
	}

	public void setSalaryService(ISalaryService salaryService) {
		this.salaryService = salaryService;
	}

	public ICandidatesService getCandidatesService() {
		return candidatesService;
	}

	public void setCandidatesService(ICandidatesService candidatesService) {
		this.candidatesService = candidatesService;
	}

}
