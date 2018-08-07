package com.coe.serviceImp;

import java.util.List;

import com.coe.dao.IAttendanceDao;
import com.coe.dto.Attendance;
import com.coe.service.IAttendanceService;

public class AttendanceServiceImp implements IAttendanceService {
	private IAttendanceDao attendanceDao;

	public IAttendanceDao getAttendanceDao() {
		return attendanceDao;
	}

	public void setAttendanceDao(IAttendanceDao attendanceDao) {
		this.attendanceDao = attendanceDao;
	}

	public List findAllAttendance() {
		return this.getAttendanceDao().find("from Attendance");
	}

	public List findAttendancebymh(String hql) {
		return this.getAttendanceDao().find(hql);
	}

	public boolean saveAttendance(Attendance attendance) {
		boolean b = false;
		this.getAttendanceDao().save(attendance);
		b = true;
		return b;
	}

	public void deletAttendance(Integer id) {
		this.getAttendanceDao().delete(id);

	}

	public List getAttendanceNum() {
		String hql = "select information ,count(*) from Attendance as a  group by a.information";
		List list = this.getAttendanceDao().find(hql);
		return list;
	}

}
