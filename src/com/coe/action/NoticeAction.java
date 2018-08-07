package com.coe.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.coe.dto.Notice;
import com.coe.service.IIformationService;
import com.coe.service.INoticeService;

public class NoticeAction extends DispatchAction {
	private INoticeService noticeService;
	private IIformationService iformationService;

	public IIformationService getIformationService() {
		return iformationService;
	}

	public void setIformationService(IIformationService iformationService) {
		this.iformationService = iformationService;
	}

	public INoticeService getNoticeService() {
		return noticeService;
	}

	public void setNoticeService(INoticeService noticeService) {
		this.noticeService = noticeService;
	}

	public ActionForward findnotice(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List list = this.getNoticeService().findNoticebymh(
				"select nname from Notice where 1=1");
		HttpSession session = request.getSession();
		session.setAttribute("listNotice", list);
		return null;
	}

	public ActionForward addNotice(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String userid = request.getParameter("username");
		String nname = request.getParameter("nname");
		String ncontent = request.getParameter("ncontent");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new Date());
		String mark = "1";
		Information information = new Information();
		Notice notice = new Notice();
		notice.setNname(nname);
		notice.setNcontent(ncontent);
		notice.setTime(time);
		notice.setMark(new Integer(Integer.parseInt(mark)));
		information = this.getIformationService().findInformationByid(
				new Integer(Integer.parseInt(userid)));
		notice.setInformation(information);
		this.getNoticeService().saveNotice(notice);
		return this.findallNotice(mapping, form, request, response);
	}

	public ActionForward findallNotice(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		List list = this.getNoticeService().findAllNotice();
		request.setAttribute("list", list);
		return mapping.findForward("suc");
	}

	public ActionForward ybfindallNotice(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String userid = request.getParameter("id");
		List list = this.getNoticeService().findNoticebymh(
				"from Notice as n where n.information.userid=" + userid);
		request.setAttribute("list", list);
		return mapping.findForward("suc");
	}

	public ActionForward updateNotice(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String nid = request.getParameter("nid");
		String userid = request.getParameter("userid");
		String nname = request.getParameter("nname");
		nname = java.net.URLDecoder.decode(nname, "UTF-8");
		String ncontent = request.getParameter("ncontent");
		Date date = new Date();

		ncontent = java.net.URLDecoder.decode(ncontent, "UTF-8");
		Information information = this.getIformationService()
				.findInformationByid(new Integer(userid));
		Notice notice = new Notice();
		List list = this.getNoticeService().findNoticebymh(
				"from Notice where nid=" + new Integer(nid));
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			notice = (Notice) iterator.next();
		}
		notice.setNid(new Integer(nid));
		notice.setInformation(information);
		notice.setNname(nname);
		notice.setNcontent(ncontent);
		notice.setTime(date.toString());
		notice.setMark(new Integer(1));
		this.getNoticeService().updateNotice(notice);

		return null;
	}

	public ActionForward deleteNotice(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String nid = request.getParameter("nid");
		this.getNoticeService().deletNotice(new Integer(nid));
		return null;
	}
	public ActionForward ybaddNotice(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String userid = request.getParameter("id");
		String nname = request.getParameter("nname");
		String ncontent = request.getParameter("ncontent");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new Date());
		String mark = "1";
		Information information = new Information();
		Notice notice = new Notice();
		notice.setNname(nname);
		notice.setNcontent(ncontent);
		notice.setTime(time);
		notice.setMark(new Integer(Integer.parseInt(mark)));
		information = this.getIformationService().findInformationByid(
				new Integer(Integer.parseInt(userid)));
		notice.setInformation(information);
		this.getNoticeService().saveNotice(notice);
		return this.ybfindallNotice(mapping, form, request, response);
	}

}
