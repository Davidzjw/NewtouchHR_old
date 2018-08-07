package com.coe.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.coe.dto.Information;
import com.coe.dto.Salary;
import com.coe.service.IIformationService;
import com.coe.service.ISalaryService;

public class SalaryAction extends DispatchAction {
	private ISalaryService salaryService;

	private IIformationService iformationService;

	public IIformationService getIformationService() {
		return iformationService;
	}

	public void setIformationService(IIformationService iformationService) {
		this.iformationService = iformationService;
	}

	public ISalaryService getSalaryService() {
		return salaryService;
	}

	public void setSalaryService(ISalaryService salaryService) {
		this.salaryService = salaryService;
	}

	public ActionForward findAllsalary(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List list = this.getSalaryService().findAllSalary();
		List listInfor = this.getIformationService().findAllUser();
		request.setAttribute("listInfor", listInfor);
		request.setAttribute("list", list);
		return mapping.findForward("suc");

	}
	public ActionForward ybfindAllsalary(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String department = request.getParameter("department");
		List list = this.getSalaryService().findSalaybymh("from Salary as s where s.information.department ='"+department+"'");
		request.setAttribute("list", list);
		return mapping.findForward("yb_suc");

	}

	public ActionForward saveSalary(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String userid = request.getParameter("username");
		String bwage = request.getParameter("bwage");
		String housefund = request.getParameter("housefund");
		String pension = request.getParameter("pension");
		String health = request.getParameter("health");
		String unemployment = request.getParameter("unemployment");
		String reimbursement = request.getParameter("reimbursement");
		String paword = request.getParameter("paword");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new Date()).substring(0,10);
		Information information = this.getIformationService()
				.findInformationByid(new Integer(Integer.parseInt(userid)));
		Salary salary = new Salary();
		salary.setInformation(information);
		salary.setBwage(new Integer(Integer.parseInt(bwage)));
		salary.setHousefund(new Integer(Integer.parseInt(housefund)));
		salary.setPension(new Integer(Integer.parseInt(pension)));
		salary.setHealth(new Integer(Integer.parseInt(health)));
		salary.setUnemployment(new Integer(Integer.parseInt(unemployment)));
		salary.setReimbursement(new Integer(Integer.parseInt(reimbursement)));
		salary.setPaword(new Integer(Integer.parseInt(paword)));
		salary.setTime(time);
		this.getSalaryService().saveSalary(salary);
		String level = request.getParameter("level");
		if (level.equals("超级管理员")) {
			return this.findAllsalary(mapping, form, request, response);
		} else {
			String department = request.getParameter("department");
			List list = this.getSalaryService().findSalaybymh("from Salary as s where s.information.department ='"+department+"'");
			request.setAttribute("list", list);
			return mapping.findForward("ybsuc");
		}

	}

	public ActionForward findSalarybymh(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String username = request.getParameter("cxusername");
		String department = request.getParameter("department");
		String level = request.getParameter("level");
		if (level.equals("超级管理员")) {
			String hql = " from Salary as s where 1=1 ";
			if(username!=null&&!username.equals("")){
				hql+="and s.information.userid="+username;
			}
			if(department!=null&&!department.equals("")){
				hql+="and s.information.department='"+department+"'";
			}
			List list = this.getSalaryService().findSalaybymh(hql);
			request.setAttribute("list", list);
			List list1 = this.getIformationService().findAllUser();
			request.setAttribute("listInfor", list1);

			return mapping.findForward("suc");
		} else {
			String hql = " from Salary as s where s.information.department ='"
					+ department + "'";
			if (!username.equals("") && username != null) {
				hql += "and s.information.username like '%" + username+"%'" ;
			}
			List list = this.getSalaryService().findSalaybymh(hql);
			request.setAttribute("list", list);

			return mapping.findForward("ybsuc");
		}

	}

	public ActionForward updateSalary(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String sid = request.getParameter("sid");
		String userid = request.getParameter("userid");
		String bwage = request.getParameter("bwage");
		String housefund = request.getParameter("housefund");
		String pension = request.getParameter("pension");
		String health = request.getParameter("health");
		String unemployment = request.getParameter("unemployment");
		String reimbursement = request.getParameter("reimbursement");
		String paword = request.getParameter("paword");
		Information information = this.getIformationService()
				.findInformationByid(new Integer(Integer.parseInt(userid)));
		Salary salary = new Salary();
		List list = this.getSalaryService().findSalaybymh(
				"from Salary where sid=" + new Integer(sid));
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			salary = (Salary) iterator.next();
		}
		salary.setInformation(information);
		salary.setBwage(new Integer(Integer.parseInt(bwage)));
		salary.setHousefund(new Integer(Integer.parseInt(housefund)));
		salary.setPension(new Integer(Integer.parseInt(pension)));
		salary.setHealth(new Integer(Integer.parseInt(health)));
		salary.setUnemployment(new Integer(Integer.parseInt(unemployment)));
		salary.setReimbursement(new Integer(Integer.parseInt(reimbursement)));
		salary.setPaword(new Integer(Integer.parseInt(paword)));
		this.getSalaryService().updateSalary(salary);
		return null;

	}

	public ActionForward deleteSalary(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String sid = request.getParameter("sid");
		this.getSalaryService().deletSalary(new Integer(sid));
		return null;

	}

}
