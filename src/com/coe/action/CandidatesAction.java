package com.coe.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.coe.dto.Candidates;
import com.coe.service.ICandidatesService;

public class CandidatesAction extends DispatchAction {
	private ICandidatesService candidatesService;

	public ICandidatesService getCandidatesService() {
		return candidatesService;
	}

	public void setCandidatesService(ICandidatesService candidatesService) {
		this.candidatesService = candidatesService;
	}

	public ActionForward addCandidates(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String caname = request.getParameter("caname");
		String department = request.getParameter("department");
		String position = request.getParameter("position");
		String cainfo = request.getParameter("cainfo");
		String catel = request.getParameter("catel");
		String level=new String(request.getParameter("level").getBytes("iso8859_1"),"GBK");
		String camark = "待审核中";
		Candidates candidates = new Candidates();
		candidates.setCainfo(cainfo);
		candidates.setCaname(caname);
		candidates.setCatel(catel);
		candidates.setDepartment(department);
		candidates.setPosition(position);
		candidates.setCamark(camark);

		if (level.trim().equals("一般管理员")) {
			this.getCandidatesService().saveCandidates(candidates);
			List list = this.getCandidatesService().findCandidatesbymh(
					"from Candidates as c where c.department='" + department
							+ "'");
			request.setAttribute("list", list);
			return mapping.findForward("yb_suc");
		} else{
			this.getCandidatesService().saveCandidates(candidates);
			return this.findCandidates(mapping, form, request, response);
		}

		
	}

	public ActionForward findCandidates(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List list = this.getCandidatesService().findAllCandidates();
		request.setAttribute("list", list);
		return mapping.findForward("suc");
	}

	public ActionForward updateCandidates(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String caid = request.getParameter("caid");
		String caname = request.getParameter("caname");
		caname = java.net.URLDecoder.decode(caname, "UTF-8");
		String department = request.getParameter("department");
		department = java.net.URLDecoder.decode(department, "UTF-8");
		String position = request.getParameter("position");
		position = java.net.URLDecoder.decode(position, "UTF-8");
		String cainfo = request.getParameter("cainfo");
		cainfo = java.net.URLDecoder.decode(cainfo, "UTF-8");
		String catel = request.getParameter("catel");
		catel = java.net.URLDecoder.decode(catel, "UTF-8");

		String camark = request.getParameter("camark");
		camark = java.net.URLDecoder.decode(camark, "UTF-8");

		Candidates candidates = new Candidates();
		candidates.setCaid(new Integer(caid));
		candidates.setCainfo(cainfo);
		candidates.setCaname(caname);
		candidates.setCatel(catel);
		candidates.setDepartment(department);
		candidates.setPosition(position);
		candidates.setCamark(camark);
		this.getCandidatesService().updateCandidates(candidates);
		return null;
	}

	public ActionForward deleteCandidates(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String caid = request.getParameter("caid");
		this.getCandidatesService().deletCandidates(new Integer(caid));
		return null;
	}
	


	public ActionForward findCandidatesbymh(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String caname = request.getParameter("caname").trim();
		String department = request.getParameter("department").trim();
		String position = request.getParameter("position").trim();
		String cainfo = request.getParameter("cainfo").trim();
		String level = request.getParameter("level").trim();
		String camark = request.getParameter("camark").trim();
		if (level.equals("超级管理员")) {
			String hql = "from Candidates as c where 1=1 ";
			if (caname != null && !caname.equals("")) {
				hql += " and c.caname like '%" + caname + "%'";
			}
			if (department != null && !department.equals("")) {
				hql += " and c.department like '%" + department + "%'";
			}
			if (position != null && !position.equals("")) {
				hql += " and c.position like '%" + position + "%'";
			}
			if (cainfo != null && !cainfo.equals("")) {
				hql += " and c.cainfo like '%" + cainfo + "%'";
			}
			if (camark != null && !camark.equals("")) {
				hql += " and c.camark ='" + camark + "'";
			}
			List list = this.getCandidatesService().findCandidatesbymh(hql);
			request.setAttribute("list", list);

			return mapping.findForward("suc");
		} else if (level.equals("一般管理员")) {
			String hql = "from Candidates as c where c.department ='"
					+ department + "'  ";
			if (caname != null && !caname.equals("")) {
				hql += " and c.caname like '%" + caname + "%'";
			}
			if (department != null && !department.equals("")) {
				hql += " and c.department like '%" + department + "%'";
			}
			if (position != null && !position.equals("")) {
				hql += " and c.position like '%" + position + "%'";
			}
			if (cainfo != null && !cainfo.equals("")) {
				hql += " and c.cainfo like '%" + cainfo + "%'";
			}
			if (camark != null && !camark.equals("")) {
				hql += " and c.camark ='" + camark + "'";
			}
			List list = this.getCandidatesService().findCandidatesbymh(hql);
			request.setAttribute("list", list);

			return mapping.findForward("ybsuc");
		} else {
			return mapping.findForward("suc");
		}

	}
	public ActionForward ybfindCandidates(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String department=request.getParameter("department");
		List list = this.getCandidatesService().findCandidatesbymh("from Candidates as c where c.department ='"+department+"'");
		request.setAttribute("list", list);
		return mapping.findForward("suc");
	}

}
