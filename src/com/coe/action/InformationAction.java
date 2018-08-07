package com.coe.action;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.coe.dto.Information;
import com.coe.service.IAttendanceService;
import com.coe.service.ICandidatesService;
import com.coe.service.IContractService;
import com.coe.service.IIformationService;
import com.coe.service.INoticeService;
import com.coe.service.IRecruitmentinfoService;
import com.coe.service.ISalaryService;
import com.coe.service.ITrainingMangment;

public class InformationAction extends DispatchAction {
	private IIformationService informationService;
	private INoticeService noticeService;
	private IContractService contractService;
	private IAttendanceService attendanceService;
	private IRecruitmentinfoService recruitmentinfoService;
	private ISalaryService salaryService;
	private ICandidatesService candidatesService;
	private ITrainingMangment trainService;

	public ICandidatesService getCandidatesService() {
		return candidatesService;
	}

	public ITrainingMangment getTrainService() {
		return trainService;
	}

	public void setTrainService(ITrainingMangment trainService) {
		this.trainService = trainService;
	}

	public void setCandidatesService(ICandidatesService candidatesService) {
		this.candidatesService = candidatesService;
	}

	public ISalaryService getSalaryService() {
		return salaryService;
	}

	public void setSalaryService(ISalaryService salaryService) {
		this.salaryService = salaryService;
	}

	public IRecruitmentinfoService getRecruitmentinfoService() {
		return recruitmentinfoService;
	}

	public void setRecruitmentinfoService(
			IRecruitmentinfoService recruitmentinfoService) {
		this.recruitmentinfoService = recruitmentinfoService;
	}

	public IAttendanceService getAttendanceService() {
		return attendanceService;
	}

	public void setAttendanceService(IAttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}

	public IContractService getContractService() {
		return contractService;
	}

	public void setContractService(IContractService contractService) {
		this.contractService = contractService;
	}

	public INoticeService getNoticeService() {
		return noticeService;
	}

	public void setNoticeService(INoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public IIformationService getInformationService() {
		return informationService;
	}

	public void setInformationService(IIformationService informationService) {
		this.informationService = informationService;
	}

	public ActionForward userLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String name = request.getParameter("username");
		String pas = request.getParameter("password");
		String level = request.getParameter("level");
		List list0 = this.getInformationService().findUserbymh(
				"from Information as i where i.username ='" + name + "'");
		Information information0 = null;
		String department = "";
		Integer id;
		// 调用服务层的用户登录方法
		if (level.equals("超级管理员")) {
			boolean b = this.getInformationService()
					.userLogin(name, pas, level);
			List list = this.getInformationService().findAllUser();
			List list1 = this.getNoticeService().findAllNotice();
			HttpSession session = request.getSession();
			if (b == true) {
				information0 = (Information) list0.get(0);
				department = information0.getDepartment();
				id = information0.getUserid();
				session.setAttribute("listNotice", list1);
				session.setAttribute("list", list);
				session.setAttribute("id", id);
				session.setAttribute("username", name);
				session.setAttribute("password", pas);
				session.setAttribute("level", level);
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					Information information = (Information) iterator.next();
					session.setAttribute("if", information);
				}
				return mapping.findForward("succ");

			} else {
				return mapping.findForward("error");
			}
		} else if (level.equals("普通用户")) {
			boolean b = this.getInformationService()
					.userLogin(name, pas, level);
			if (b == true) {
				information0 = (Information) list0.get(0);
				department = information0.getDepartment();
				id = information0.getUserid();
				List list1 = this.getNoticeService().findAllNotice();

				List listptyh = this.getInformationService().findUserbymh(
						"from Information where username ='" + name + "'");
				List listptyhContract = this.getContractService()
						.findContractbymh(
								"from Contract as c where c.information.username='"
										+ name + "'");
				List listptyhAttendance = this.getAttendanceService()
						.findAttendancebymh(
								"from Attendance as a where a.information.username ='"
										+ name + "'");
				List listptyhrecruitmentinfo = this.getRecruitmentinfoService()
						.findAllRecruitmentinfo();
				List listptyhSalary = this.getSalaryService().findSalaybymh(
						"from Salary as s where s.information.username='"
								+ name + "'");
				List listptyhNotice = this.getNoticeService().findAllNotice();
				List listplan = this.getTrainService().findAllplan();
				List listapp = this.getTrainService().findTrapp(
						"from Trainingapproval as ta where ta.information.username='"
								+ name + "'");
				List listAllInformation = this.getInformationService()
						.findAllUser();
				List listevaluation = this.getTrainService().findTrapp(
						"from Trainingapproval as ta where ta.information.username='"
								+ name + "' and ta.trmark = 1");
				HttpSession session = request.getSession();

				session.setAttribute("listevaluation", listevaluation);
				session.setAttribute("listAllInformation", listAllInformation);
				session.setAttribute("information", information0);
				session.setAttribute("listapp", listapp);
				session.setAttribute("listplan", listplan);
				session.setAttribute("listptyhNotice", listptyhNotice);
				session.setAttribute("listptyhSalary", listptyhSalary);
				session.setAttribute("listptyhrecruitmentinfo",
						listptyhrecruitmentinfo);
				session.setAttribute("listptyhAttendance", listptyhAttendance);
				session.setAttribute("listptyhContract", listptyhContract);
				session.setAttribute("listptyh", listptyh);
				session.setAttribute("listNotice", list1);
				session.setAttribute("username", name);
				session.setAttribute("password", pas);
				session.setAttribute("level", level);
				session.setAttribute("id", id);
				return mapping.findForward("ptyhSuc");
			} else
				return mapping.findForward("error");
		} else if (level.equals("一般管理员")) {

			boolean b = this.getInformationService()
					.userLogin(name, pas, level);
			if (b == true) {
				information0 = (Information) list0.get(0);
				department = information0.getDepartment();
				id = information0.getUserid();
				List list1 = this.getNoticeService().findAllNotice();
				List listybInformation = this.getInformationService()
						.findUserbymh(
								"from Information as i where i.department='"
										+ department + "'");
				List listybContract = this.getContractService()
						.findContractbymh(
								"from Contract as c where c.information.department ='"
										+ department + "'");
				List listybAttendance = this.getAttendanceService()
						.findAttendancebymh(
								"from Attendance as a where a.information.department='"
										+ department + "'");
				List listybRecruitmentinfo = this.getRecruitmentinfoService()
						.findRecruitmentinfobymh(
								"from Recruitmentinfo as r where r.department='"
										+ department + "'");
				List listybCandidates = this.getCandidatesService()
						.findCandidatesbymh(
								"from Candidates as c where c.department ='"
										+ department + "'");
				List listybSalary = this.getSalaryService().findSalaybymh(
						"from Salary as s where s.information.department ='"
								+ department + "'");
				List listybNotice = this.getNoticeService().findNoticebymh(
						"from Notice as n where n.information.username='"
								+ name + "'");
				List listAllInformation = this.getInformationService()
						.findAllUser();

				HttpSession session = request.getSession();

				System.out.println(id);
				System.out.println(department);
				List list = this.getInformationService().findAllUser();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					Information information = (Information) iterator.next();
					session.setAttribute("if", information);
				}
				session.setAttribute("listybNotice", listybNotice);
				session.setAttribute("listybSalary", listybSalary);
				session.setAttribute("listybCandidates", listybCandidates);
				session.setAttribute("listybRecruitmentinfo",
						listybRecruitmentinfo);
				session.setAttribute("listybAttendance", listybAttendance);
				session.setAttribute("listybContract", listybContract);
				session.setAttribute("listybInformation", listybInformation);
				session.setAttribute("listAllInformation", listAllInformation);
				session.setAttribute("listNotice", list1);
				session.setAttribute("username", name);
				session.setAttribute("password", pas);
				session.setAttribute("level", level);
				session.setAttribute("department", department);
				session.setAttribute("id", id);
				return mapping.findForward("ybglSuc");
			} else
				return mapping.findForward("error");
		} else

			return mapping.findForward("error");

	}

	public ActionForward userRegit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int age = Integer.parseInt(request.getParameter("age"));
		String sex = request.getParameter("sex");
		String department = request.getParameter("department");
		String position = request.getParameter("position");
		String tel = request.getParameter("tel");
		String level = request.getParameter("level");

		Information information = new Information();
		information.setUsername(username);
		information.setPassword(password);
		information.setAge(new Integer(age));
		information.setSex(sex);
		information.setDepartment(department);
		information.setPosition(position);
		information.setTel(tel);
		information.setLevel(level);

		this.getInformationService().saveUser(information);

		return mapping.findForward("succ");

	}

	public ActionForward findUserbymh(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("username");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String department = request.getParameter("department");
		String position = request.getParameter("position");
		String level=request.getParameter("level");
		String hql = "from Information as if where 1=1 ";
		if(level.equals("一般管理员")){
			if (username != null && !username.equals("")) {
				hql += " and if.username like '%" + username + "%'";
			}
			if (age != null && !age.equals("")) {
				hql += " and if.age =" + age;
			}
			if (sex != null && !sex.equals("")) {
				hql += " and if.sex like '%" + sex + "%'";
			}
			if (department != null && !department.equals("")) {
				hql += " and if.department = '" + department + "'";
			}
			if (position != null && !position.equals("")) {
				hql += " and if.position like '%" + position + "%'";
			}
			List list = this.getInformationService().findUserbymh(hql);
			request.setAttribute("list", list);
			return mapping.findForward("yb_succ");
		}else{
			if (username != null && !username.equals("")) {
				hql += " and if.username like '%" + username + "%'";
			}
			if (age != null && !age.equals("")) {
				hql += " and if.age =" + age;
			}
			if (sex != null && !sex.equals("")) {
				hql += " and if.sex like '%" + sex + "%'";
			}
			if (department != null && !department.equals("")) {
				hql += " and if.department like '%" + department + "%'";
			}
			if (position != null && !position.equals("")) {
				hql += " and if.position like '%" + position + "%'";
			}
			List list = this.getInformationService().findUserbymh(hql);
			request.setAttribute("list", list);
			return mapping.findForward("succ");
		}
		

		

	}

	public ActionForward updateInformation(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		username = java.net.URLDecoder.decode(username, "utf-8");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		sex = java.net.URLDecoder.decode(sex, "utf-8");
		String department = request.getParameter("department");
		department = java.net.URLDecoder.decode(department, "utf-8");

		String position = request.getParameter("position");
		position = java.net.URLDecoder.decode(position, "utf-8");

		String tel = request.getParameter("tel");
		String level = request.getParameter("level");
		level = java.net.URLDecoder.decode(level, "utf-8");
		String id = request.getParameter("userid");
		String age = request.getParameter("age");

		Information information = this.getInformationService()
				.findInformationByid(new Integer(id));
		information.setUsername(username);
		information.setPassword(password);
		information.setAge(new Integer(age));
		information.setSex(sex);
		information.setDepartment(department);
		information.setPosition(position);
		information.setTel(tel);
		information.setLevel(level);
		information.setUserid(new Integer(id));

		this.getInformationService().updateInformation(information);
		return null;
	}

	public ActionForward deleteInformation(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String userid = request.getParameter("userid");
		this.getInformationService().deletInformation(new Integer(userid));

		return null;
	}
	
	public ActionForward findall(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List list = this.getInformationService().findAllUser();
		request.setAttribute("list", list);
		return mapping.findForward("suc");
	}

}
