package com.coe.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.coe.dto.Recruitmentinfo;
import com.coe.service.IRecruitmentinfoService;

public class RecruitmentinfoAction extends DispatchAction {
	private IRecruitmentinfoService recruitmentinfoService;

	public IRecruitmentinfoService getRecruitmentinfoService() {
		return recruitmentinfoService;
	}

	public void setRecruitmentinfoService(
			IRecruitmentinfoService recruitmentinfoService) {
		this.recruitmentinfoService = recruitmentinfoService;
	}

	public ActionForward addRecruitmentInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String rname = request.getParameter("rname");
		String department = request.getParameter("department");
		String rest = request.getParameter("rest");
		String rers = request.getParameter("rers");
		String reut = request.getParameter("reut");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String rept = format.format(new Date());
		String content = request.getParameter("content");

		Recruitmentinfo recruitmentinfo = new Recruitmentinfo();
		recruitmentinfo.setRname(rname);
		recruitmentinfo.setDepartment(department);
		recruitmentinfo.setRest(rest);
		recruitmentinfo.setReut(reut);
		recruitmentinfo.setRers(new Integer(rers));
		recruitmentinfo.setRept(rept);
		recruitmentinfo.setContent(content);

		this.getRecruitmentinfoService().saveRecruitmentinfo(recruitmentinfo);
		String level = request.getParameter("level");
		if (level.equals("超级管理员")) {
			return this
					.findAllRecruitmentInfo(mapping, form, request, response);

		} else {
			List list = this.getRecruitmentinfoService()
					.findRecruitmentinfobymh(
							"from Recruitmentinfo as r where r.department='"
									+ department + "'");
			request.setAttribute("list", list);
			return mapping.findForward("ybsuc");
		}

	}

	public ActionForward findAllRecruitmentInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List list = this.getRecruitmentinfoService().findAllRecruitmentinfo();
		request.setAttribute("list", list);
		return mapping.findForward("suc");
	}

	public ActionForward updateRecruitmentinfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String riid = request.getParameter("riid");
		String rname = request.getParameter("rname");
		rname = java.net.URLDecoder.decode(rname, "utf-8");
		String department = request.getParameter("department");
		department = java.net.URLDecoder.decode(department, "utf-8");
		String rest = request.getParameter("rest");
		String rers = request.getParameter("rers");
		String reut = request.getParameter("reut");
		String rept = new Date().toString();
		String content = request.getParameter("content");
		content = java.net.URLDecoder.decode(content, "utf-8");

		Recruitmentinfo recruitmentinfo = new Recruitmentinfo();
		recruitmentinfo.setRiid(new Integer(riid));
		recruitmentinfo.setRname(rname);
		recruitmentinfo.setDepartment(department);
		recruitmentinfo.setRest(rest);
		recruitmentinfo.setReut(reut);
		recruitmentinfo.setRers(new Integer(rers));
		recruitmentinfo.setRept(rept);
		recruitmentinfo.setContent(content);
		this.getRecruitmentinfoService().updateRecruitmentinfo(recruitmentinfo);
		return null;
	}

	public ActionForward deleteRecruitmentinfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String riid = request.getParameter("riid");
		this.getRecruitmentinfoService()
				.deletRecruitmentinfo(new Integer(riid));
		return null;
	}

	public ActionForward findRecruitmentInfobymh(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String department = request.getParameter("department");
		String rname = request.getParameter("rname");

		String hql = "from Recruitmentinfo where 1=1 ";
		if (department != null && !department.equals("")) {
			hql += "and department like '%" + department + "%'";
		}
		if (rname != null && !rname.equals("")) {
			hql += "and rname like '%" + rname + "%'";
		}
		List list = this.getRecruitmentinfoService().findRecruitmentinfobymh(
				hql);
		request.setAttribute("list", list);
		return mapping.findForward("suc");
	}
	
	public ActionForward yb_findAllRecruitmentInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String department=request.getParameter("department");
		List list = this.getRecruitmentinfoService().findRecruitmentinfobymh("from Recruitmentinfo as r where r.department ='"+department+"'");
		request.setAttribute("list", list);
		return mapping.findForward("yb_suc");
	}

}
