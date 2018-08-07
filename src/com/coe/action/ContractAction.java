package com.coe.action;

import java.text.DateFormat;
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

import com.coe.dto.Contract;
import com.coe.dto.Information;
import com.coe.service.IContractService;
import com.coe.service.IIformationService;

public class ContractAction extends DispatchAction {
	private IContractService contractService;

	public IContractService getContractService() {
		return contractService;
	}

	public void setContractService(IContractService contractService) {
		this.contractService = contractService;
	}

	private IIformationService informationService;

	public IIformationService getInformationService() {
		return informationService;
	}

	public void setInformationService(IIformationService informationService) {
		this.informationService = informationService;
	}

	public ActionForward findcontract(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List list = this.getContractService().findAllContract();
		request.setAttribute("list", list);
		List listInfor = this.getInformationService().findAllUser();
		request.setAttribute("listInfor", listInfor);
		return mapping.findForward("suc");
	}

	public ActionForward findContractbymh(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String cname = request.getParameter("cname");
		String cnature = request.getParameter("cnature");
		String department = request.getParameter("department");
		String level = request.getParameter("level");

		if (level.equals("一般管理员")) {
			String hqlcontr = "from Contract as c where c.information.department='"
					+ department + "'";
			if (cname != null && !cname.equals(null)) {
				hqlcontr += " and c.cname like '%" + cname + "%'";
			}
			if (cnature != null && !cnature.equals(null)) {
				hqlcontr += " and c.cnature like '%" + cnature + "%'";
			}

			List listContr = this.getContractService().findContractbymh(
					hqlcontr);
			request.setAttribute("hqlcontr", listContr);

			return mapping.findForward("yb_suc");
		} else  {
			String hqlcontr = "from Contract as c where 1=1";
			if (cname != null && !cname.equals(null)) {
				hqlcontr += " and c.cname like '%" + cname + "%'";
			}
			if (cnature != null && !cnature.equals(null)) {
				hqlcontr += " and c.cnature like '%" + cnature + "%'";
			}

			List listContr = this.getContractService().findContractbymh(
					hqlcontr);
			request.setAttribute("hqlcontr", listContr);

			return mapping.findForward("suc");
		}

	}

	public ActionForward saveContract(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String userid = request.getParameter("s_userid");
		String cname = request.getParameter("s_cname");
		String cnature = request.getParameter("s_cnature");
		String cagreement = request.getParameter("s_cagreement");
		String cend = request.getParameter("s_cend");
		String ctime = request.getParameter("s_ctime");
		SimpleDateFormat format =new SimpleDateFormat("yy-MM-dd");
		Date time=format.parse(ctime);

		Information information = new Information();
		information = this.getInformationService().findInformationByid(
				new Integer(Integer.parseInt(userid)));
		Contract contract = new Contract();
		contract.setCname(cname);
		contract.setCnature(cnature);
		contract.setCagreement(cagreement);
		contract.setInformation(information);
		contract.setCend(new Integer(cend));
		contract.setCtime(time);
		this.getContractService().saveContract(contract);
		return this.findcontract(mapping, form, request, response);
	}

	public ActionForward updateContract(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String cid = request.getParameter("cid");
		String userid = request.getParameter("userid");
		String cname = request.getParameter("cname");
		cname = java.net.URLDecoder.decode(cname, "utf-8");
		String cnature = request.getParameter("cnature");
		cnature = java.net.URLDecoder.decode(cnature, "utf-8");
		String cagreement = request.getParameter("cagreement");
		cagreement = java.net.URLDecoder.decode(cagreement, "utf-8");
		Information information = (Information) this.getInformationService()
				.findInformationByid(new Integer(userid));
		List list = this.getContractService().findContractbymh(
				"from Contract where cid=" + cid);
		Contract contract = new Contract();
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			contract = (Contract) iterator.next();

		}
		contract.setCid(new Integer(cid));
		contract.setCnature(cnature);
		contract.setCagreement(cagreement);
		contract.setInformation(information);
		contract.setCname(cname);

		this.getContractService().updatContract(contract);

		return null;
	}

	public ActionForward deleteContract(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String cid = request.getParameter("cid");
		this.getContractService().deletContract(new Integer(cid));
		return null;
	}

}
