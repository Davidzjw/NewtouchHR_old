package com.coe.service;

import java.util.List;

import com.coe.dto.Notice;


public interface INoticeService {

	public List findAllNotice();

	public boolean saveNotice(Notice notice);
	
	public List findNoticebymh(String hql);
	
	public void updateNotice(Notice notice);
	
	public void deletNotice (Integer id);
	
	
}
