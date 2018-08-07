package com.coe.serviceImp;

import java.util.List;

import com.coe.dao.INoticeDao;
import com.coe.dto.Notice;
import com.coe.service.INoticeService;

public class NoticeServiceImp implements INoticeService {
	private INoticeDao noticeDao;

	public INoticeDao getNoticeDao() {
		return noticeDao;
	}

	public void setNoticeDao(INoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	public List findAllNotice() {
		// TODO Auto-generated method stub
		return this.getNoticeDao().find("from Notice");
	}

	public List findNoticebymh(String hql) {
		// TODO Auto-generated method stub
		return this.getNoticeDao().find(hql);
	}

	public boolean saveNotice(Notice notice) {
		boolean b = false;
		this.getNoticeDao().save(notice);
		b = true;
		return b;
	}

	public void updateNotice(Notice notice) {
		this.getNoticeDao().update(notice);
		
	}

	public void deletNotice(Integer id) {

		this.getNoticeDao().delete(id);
	}


}
