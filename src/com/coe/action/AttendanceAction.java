package com.coe.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.coe.dto.Attendance;
import com.coe.dto.Information;
import com.coe.service.IAttendanceService;
import com.coe.service.IIformationService;

public class AttendanceAction extends DispatchAction {

	private IAttendanceService attendanceService;
	private IIformationService iformationService;

	public IAttendanceService getAttendanceService() {
		return attendanceService;
	}

	public void setAttendanceService(IAttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}

	public IIformationService getIformationService() {
		return iformationService;
	}

	public void setIformationService(IIformationService iformationService) {
		this.iformationService = iformationService;
	}

	public ActionForward findattendance(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String level=request.getParameter("level");
		String department=request.getParameter("department");
		if (level.equals("一般管理员")) {
			List list = this.getAttendanceService().findAttendancebymh(
					"from Attendance as a where a.information.department = '"
							+ department + "'");
			request.setAttribute("list", list);
			return mapping.findForward("ybglSuc");
		} else {
			List list = this.getAttendanceService().findAllAttendance();
			List inforList = this.getIformationService().findAllUser();
			request.setAttribute("inforList", inforList);
			request.setAttribute("list", list);
			return mapping.findForward("suc");
		}
	}

	public ActionForward findAttendencebymh(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String department = request.getParameter("department");
		String level = request.getParameter("level");
		String attendance = request.getParameter("kg");

		if (level.equals("超级管理员")) {
			String hql = " from Attendance as a where 1=1 ";
			if(username!=null&&!username.equals("")){
				hql+=" and a.information.userid="+username;
			}
			if(department!=null&&!department.equals("")){
				hql+=" and a.information.department='"+department+"'";
			}
			if (!attendance.equals("") && attendance != null) {
				hql += " and a.attendance =" + attendance;
			}
			List list = this.getAttendanceService().findAttendancebymh(hql);
			request.setAttribute("list", list);
			List list1 = this.getIformationService().findAllUser();
			request.setAttribute("inforList", list1);

			return mapping.findForward("suc");
		} else {
			String hql = " from Attendance as a where a.information.department='"
					+ department + "'";
			if (!username.equals("") && username != null) {
				hql += " and a.information.userid = " + username ;
			}

			if (!attendance.equals("") && attendance != null) {
				hql += " and a.attendance =" + attendance;
			}
			List list = this.getAttendanceService().findAttendancebymh(hql);
			request.setAttribute("list", list);
			List list1 = this.getIformationService().findAllUser();
			request.setAttribute("inforList", list1);

			return mapping.findForward("yb_suc");
		}

	}

	public ActionForward saveAttendence(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String pas = request.getParameter("password");
		String level = request.getParameter("level");
		List list = this.getIformationService().findUserbymh(
				"from Information where username = '" + username
						+ "' and password = '" + pas + "'");
		Information information = new Information();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			information = (Information) it.next();
		}
		Attendance attendance = new Attendance();
		attendance.setInformation(information);
		attendance.setZt(new Date());
		attendance.setLate(new Date());
		attendance.setAbsenteeism(new Integer(0));
		attendance.setAttendance(new Integer(0));
		Integer userid = information.getUserid();
		this.getAttendanceService().saveAttendance(attendance);
		if (level.equals("超级管理员")) {
			return this.findattendance(mapping, form, request, response);
		} else if (level.equals("普通用户")) {
			List list2 = this.getAttendanceService().findAttendancebymh(
					"from Attendance as a  where a.information.userid ="
							+ userid);
			request.setAttribute("list", list2);
			return mapping.findForward("ptyhSuc");
		} else if (level.equals("一般管理员")) {
			String department = request.getParameter("department");
			List list3 = this.getAttendanceService().findAttendancebymh(
					"from Attendance as a where a.information.department = '"
							+ department+"'");
			request.setAttribute("list", list3);
			return mapping.findForward("ybglSuc");
		} else {
			return null;
		}

	}

	public ActionForward updateAttendence(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return this.findattendance(mapping, form, request, response);
	}

	public ActionForward deleteAttendance(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String adid = request.getParameter("adid");
		this.getAttendanceService().deletAttendance(new Integer(adid));
		return null;
	}

}
