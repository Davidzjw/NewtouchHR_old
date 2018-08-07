package com.coe.daoImp;

import java.util.List;

import com.coe.dao.IAttendanceDao;
import com.coe.dto.Attendance;

public class AttendancetDaoImp extends BaseDao implements IAttendanceDao{

	public void delete(Integer id) {
		super.deleteObjectByID(Attendance.class, id);
	}

	public List find(String hql) {
		return super.findAllObject(hql);
	}

	public List find(String hql, Object[] values) {
		return super.findObjectByHql(hql, values);
	}
	public void save(Attendance attendance) {
		super.saveObject(attendance);
		
	}

	public void updateObjectByID(Attendance objclass) {
		super.updateObjectByID(objclass);
	}


}
