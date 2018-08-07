package com.coe.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.coe.dto.Information;
import com.coe.dto.Trainingapproval;
import com.coe.dto.Trainingplan;
import com.coe.service.IIformationService;
import com.coe.service.ITrainingMangment;

public class TrainingMangmentAction extends DispatchAction {
	private ITrainingMangment trainService;
	private IIformationService informationService;

	public IIformationService getInformationService() {
		return informationService;
	}

	public void setInformationService(IIformationService informationService) {
		this.informationService = informationService;
	}

	public ITrainingMangment getTrainService() {
		return trainService;
	}

	public void setTrainService(ITrainingMangment trainService) {
		this.trainService = trainService;
	}

	public ActionForward Trainingapproval(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List list = this.trainService.findAllapproval();
		request.setAttribute("list", list);
		List listPlan = this.getTrainService().findAllplan();
		HttpSession session = request.getSession();
		session.setAttribute("listPlan", listPlan);

		String level = (String) session.getAttribute("level");
		String name = (String) session.getAttribute("username");
		if (level.equals("超级管理员")) {
			return mapping.findForward("Trainingapproval");
		} else if (level.equals("一般管理员")) {
			return mapping.findForward("yb_Trainingapproval");
		} else {
			List listapp = this.getTrainService().findTrapp(
					"from Trainingapproval as ta where ta.information.username='"
							+ name + "'");
			session.setAttribute("listapp", listapp);
			return mapping.findForward("pt_Trainingapproval");
		}

	}

	public ActionForward EditApproval(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		String id = request.getParameter("taid");
		String userid = request.getParameter("userid");
		String trf = request.getParameter("trf");
		trf = java.net.URLDecoder.decode(trf, "utf-8");
		String trmark = request.getParameter("trmark");
		Information information = this.getInformationService()
				.findInformationByid(new Integer(userid));
		Trainingplan trainingplan = this.getTrainService()
				.findTrainingplanbyId(new Integer(trf));
		Trainingapproval trainingapproval = new Trainingapproval();
		trainingapproval.setTaid(new Integer(id));
		trainingapproval.setInformation(information);
		trainingapproval.setTrainingplan(trainingplan);
		trainingapproval.setTrmark(new Integer(trmark));
		trainingapproval.setEval("请输入评价");
		trainingapproval.setFb("请输入反馈");
		this.getTrainService().update(trainingapproval);

		return null;
	}

	public ActionForward DelApproval(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("taid");
		this.trainService.delapproval(new Integer(id));

		return null;
	}

	public ActionForward saveApproval(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		String trid = request.getParameter("trid");
		Information information = this.getInformationService()
				.findInformationByid(new Integer(userid));
		Trainingplan trainingplan = this.getTrainService()
				.findTrainingplanbyId(new Integer(trid));
		Trainingapproval trainingapproval = new Trainingapproval();
		trainingapproval.setInformation(information);
		trainingapproval.setTrainingplan(trainingplan);
		trainingapproval.setTrmark(new Integer(0));
		trainingapproval.setEval("请输入评价");
		trainingapproval.setFb("请输入反馈");
		this.getTrainService().saveapp(trainingapproval);
		List list = this.getTrainService().findAllapproval();
		request.setAttribute("list", list);

		return this.Trainingapproval(mapping, form, request, response);
	}

	public ActionForward findApproval(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String username = request.getParameter("username");
		String department = request.getParameter("department");
		String fzr = request.getParameter("fzr");
		String trf = request.getParameter("trf");
		String trmark = request.getParameter("trmark");

		String hql = "from Trainingapproval as t where 1=1 ";
		if (username != null && !username.equals("")) {
			hql += "and t.information.username like '%" + username + "%'";
		}
		if (department != null && !department.equals("")) {
			hql += " and t.information.department = '" + department + "'";
		}
		if (fzr != null && !fzr.equals("")) {
			hql += " and t.trainingplan.fzr.username like '%" + fzr + "%'";
		}
		if (trf != null && !trf.equals("")) {
			hql += " and t.trainingplan.trf like '%" + trf + "%'";
		}
		if (trmark != null && !trmark.equals("")) {
			hql += " and t.trmark = '" + trmark + "'";
		}

		List list = this.getTrainService().findTrapp(hql);
		request.setAttribute("list", list);
		HttpSession session = request.getSession();
		String level = (String) session.getAttribute("level");
		if (level.equals("超级管理员")) {
			return mapping.findForward("appSuc");
		} else {
			return mapping.findForward("yb_appSuc");
		}

	}

	public ActionForward addplan(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String department = request.getParameter("department");
		String trf = request.getParameter("trf");
		String trd = request.getParameter("trd");
		String trn = request.getParameter("trn");
		String trst = request.getParameter("trst");
		String trc = request.getParameter("trc");
		String fzr = request.getParameter("fzr");

		Trainingplan trainingplan = new Trainingplan();
		Information information = this.getInformationService()
				.findInformationByid(new Integer(fzr));
		trainingplan.setDepartment(department);
		trainingplan.setFzr(information);
		trainingplan.setTrc(trc);
		trainingplan.setTrf(trf);
		trainingplan.setTrd(trd);
		trainingplan.setTrn(trn);
		trainingplan.setTrst(trst);
		this.getTrainService().saveplan(trainingplan);

		return Trainingplan(mapping, form, request, response);
	}

	public ActionForward Trainingplan(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List list = this.trainService.findAllplan();
		request.setAttribute("list", list);
		HttpSession session = request.getSession();
		String level = (String) session.getAttribute("level");
		if (level.equals("超级管理员")) {
			return mapping.findForward("Trainingplan");
		} else
			return mapping.findForward("yb_Trainingplan");

	}

	public ActionForward updateTrainingplan(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String trid = request.getParameter("trid");
		String trd = request.getParameter("trd");
		trd = java.net.URLDecoder.decode(trd, "utf-8");
		String department = request.getParameter("department");
		department = java.net.URLDecoder.decode(department, "utf-8");
		String trf = request.getParameter("trf");
		trf = java.net.URLDecoder.decode(trf, "utf-8");
		String trn = request.getParameter("trn");
		trn = java.net.URLDecoder.decode(trn, "utf-8");
		String userid = request.getParameter("userid");
		String trst = request.getParameter("trst");
		String trc = request.getParameter("trc");
		Information information = this.getInformationService()
				.findInformationByid(new Integer(userid));
		Trainingplan trainingplan = new Trainingplan();
		trainingplan.setTrid(new Integer(trid));
		trainingplan.setDepartment(department);
		trainingplan.setFzr(information);
		trainingplan.setTrc(trc);
		trainingplan.setTrd(trd);
		trainingplan.setTrf(trf);
		trainingplan.setTrn(trn);
		trainingplan.setTrst(trst);
		this.getTrainService().updateTrainingplan(trainingplan);

		return null;
	}

	public ActionForward deleteTrainingplan(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String trid = request.getParameter("trid");
		this.getTrainService().deleteTrainingplan(new Integer(trid));

		return null;
	}

	public ActionForward findTrainingplanbyid(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String trid = request.getParameter("trid");
		List list = this.getTrainService().findTrplan(
				"from Trainingplan where trid = " + trid);
		request.setAttribute("list", list);
		List listapp = this.getTrainService().findTrapp("from Trainingapproval where trf ="+trid);
		request.setAttribute("listapp", listapp);

		return mapping.findForward("plansuc");
	}

	public ActionForward findplanmh(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		String level = (String) session.getAttribute("level");

		String department = request.getParameter("department");
		String trf = request.getParameter("trf");
		String trd = request.getParameter("trd");
		String trn = request.getParameter("trn");
		String fzr = request.getParameter("fzr");

		String hql = "from Trainingplan as t where 1=1 ";
		if (department != null && !department.equals("")) {
			hql += "and t.department ='" + department + "' ";
		}
		if (trf != null && !trf.equals("")) {
			hql += "and t.trf like '%" + trf + "%' ";
		}
		if (trd != null && !trd.equals("")) {
			hql += "and t.trd  like '%" + trd + "%' ";
		}
		if (trn != null && !trn.equals("")) {
			hql += "and t.trn like '%" + trn + "%' ";
		}
		if (fzr != null && !fzr.equals("")) {
			hql += "and t.fzr.userid =" + fzr + " ";
		}
		List list = this.getTrainService().findTrplan(hql);
		request.setAttribute("list", list);
		if (level.equals("超级管理员")) {
			return mapping.findForward("planSuc");
		} else if (level.equals("普通用户")) {
			return mapping.findForward("pt_planSuc");
		} else {
			return mapping.findForward("yb_planSuc");
		}

	}

	public ActionForward Trainingfeedback(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List list = this.trainService.findAllEva();
		request.setAttribute("list", list);
		List listPlan = this.getTrainService().findAllplan();
		HttpSession session = request.getSession();
		session.setAttribute("listPlan", listPlan);
		String level = (String) session.getAttribute("level");
		if (level.equals("超级管理员")) {
			return mapping.findForward("Trainingfeedback");
		} else {
			return mapping.findForward("yb_Trainingfeedback");
		}

	}

	public ActionForward Trainingevaluation(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List list = this.trainService.findAllEva();
		request.setAttribute("list", list);
		List listPlan = this.getTrainService().findAllplan();
		HttpSession session = request.getSession();
		session.setAttribute("listPlan", listPlan);
		String level = (String) session.getAttribute("level");
		if (level.equals("超级管理员")) {
			return mapping.findForward("Trainingevaluation");
		} else {
			return mapping.findForward("yb_Trainingevaluation");
		}

	}

	public ActionForward editEva(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String taid = request.getParameter("taid");
		String eva = request.getParameter("eva");
		eva = java.net.URLDecoder.decode(eva, "utf-8");
		Object[] values = { eva, new Integer(taid) };
		String hql = "update Trainingapproval tr set tr.eval=? where tr.taid=?";
		this.getTrainService().updateApp(hql, values);

		return null;
	}

	public ActionForward delEva(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String taid = request.getParameter("taid");
		String eva = "请输入评价";

		Object[] values = { eva, new Integer(taid) };
		String hql = "update Trainingapproval tr set tr.eval=? where tr.taid=?";
		this.getTrainService().updateApp(hql, values);

		return this.Trainingevaluation(mapping, form, request, response);
	}

	public ActionForward findEva(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String username = request.getParameter("username");
		String department = request.getParameter("department");
		String fzr = request.getParameter("fzr");
		String trf = request.getParameter("trf");
		String eva = request.getParameter("eva");

		String hql = "from Trainingapproval as t where 1=1 and t.trmark=1 ";
		if (username != null && !username.equals("")) {
			hql += "and t.information.userid =" + username;
		}
		if (department != null && !department.equals("")) {
			hql += " and t.information.department = '" + department + "'";
		}
		if (fzr != null && !fzr.equals("")) {
			hql += " and t.trainingplan.fzr.username like '%" + fzr + "%'";
		}
		if (trf != null && !trf.equals("")) {
			hql += " and t.trainingplan.trf like '%" + trf + "%'";
		}
		if (eva != null && !eva.equals("")) {
			hql += " and t.eval = '" + eva + "'";
		}

		List list = this.getTrainService().findTrapp(hql);
		request.setAttribute("list", list);
		HttpSession session = request.getSession();
		String level = (String) session.getAttribute("level");
		if (level.equals("超级管理员")) {
			return mapping.findForward("evaSuc");
		} else {
			return mapping.findForward("yb_evaSuc");
		}

	}

	public ActionForward saveEva(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String taid = request.getParameter("taid");
		String eva = request.getParameter("eva");

		Object[] values = { eva, new Integer(taid) };
		String hql = "update Trainingapproval tr set tr.eval=? where tr.taid=?";
		this.getTrainService().updateApp(hql, values);

		return this.Trainingevaluation(mapping, form, request, response);
	}

	public ActionForward editFb(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String taid = request.getParameter("taid");
		String fb = request.getParameter("fb");
		fb = java.net.URLDecoder.decode(fb, "utf-8");
		Object[] values = { fb, new Integer(taid) };
		String hql = "update Trainingapproval tr set tr.fb=? where tr.taid=?";
		this.getTrainService().updateApp(hql, values);

		return null;
	}

	public ActionForward delFb(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String taid = request.getParameter("taid");
		String fb = "请输入反馈";

		Object[] values = { fb, new Integer(taid) };
		String hql = "update Trainingapproval tr set tr.fb=? where tr.taid=?";
		this.getTrainService().updateApp(hql, values);

		return this.Trainingfeedback(mapping, form, request, response);
	}

	public ActionForward findFb(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String username = request.getParameter("username");
		String department = request.getParameter("department");
		String fzr = request.getParameter("fzr");
		String trf = request.getParameter("trf");
		String fb = request.getParameter("fb");

		String hql = "from Trainingapproval as t where 1=1 and  t.trmark=1 ";
		if (username != null && !username.equals("")) {
			hql += "and t.information.userid =" + username;
		}
		if (department != null && !department.equals("")) {
			hql += " and t.information.department = '" + department + "'";
		}
		if (fzr != null && !fzr.equals("")) {
			hql += " and t.trainingplan.fzr.username like '%" + fzr + "%'";
		}
		if (trf != null && !trf.equals("")) {
			hql += " and t.trainingplan.trf like '%" + trf + "%'";
		}
		if (fb != null && !fb.equals("")) {
			hql += " and t.fb = '" + fb + "'";
		}

		List list = this.getTrainService().findTrapp(hql);
		request.setAttribute("list", list);
		HttpSession session = request.getSession();
		String level = (String) session.getAttribute("level");
		if (level.equals("超级管理员")) {
			return mapping.findForward("fbSuc");
		} else {
			return mapping.findForward("yb_fbSuc");
		}

	}
	
	public ActionForward test(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String trid = request.getParameter("tt");
		List list = this.getTrainService().findTrapp("from Trainingapproval as t where t.trainingplan.trid="+trid);
		request.setAttribute("list", list);
		return mapping.findForward("pt_suc");
	}
	
	public ActionForward editFb1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String taid = request.getParameter("taid");
		String fb = request.getParameter("fb");
		String trid= request.getParameter("trid");
		Object[] values = { fb, new Integer(taid) };
		String hql = "update Trainingapproval tr set tr.fb=? where tr.taid=?";
		this.getTrainService().updateApp(hql, values);
		List list = this.getTrainService().findTrapp("from Trainingapproval as t where t.trainingplan.trid="+trid);
		request.setAttribute("list", list);
		return mapping.findForward("pt_succ");
	}

}
