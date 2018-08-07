package com.coe.dao;

import java.util.List;

import com.coe.dto.Notice;

public interface INoticeDao {
	public void save(Notice notice);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);
	
	public void update(Notice notice);
	
	
}
