package com.coe.dao;

import java.util.List;

import com.coe.dto.Attendance;

public interface IAttendanceDao {
	public void save(Attendance attendance);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);
	
	public void updateObjectByID(Attendance objclass);
	
	
}
