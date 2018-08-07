package com.coe.service;

import java.util.List;

import com.coe.dto.Attendance;


public interface IAttendanceService {

	public List findAllAttendance();

	public boolean saveAttendance(Attendance attendance);
	
	public List findAttendancebymh(String hql);
	
	
	public void deletAttendance(Integer id);
	
	public List getAttendanceNum();
	
}
