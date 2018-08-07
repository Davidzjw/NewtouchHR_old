package com.coe.serviceImp;

import java.util.Iterator;
import java.util.List;

import com.coe.dao.IInformationDao;
import com.coe.dto.Information;
import com.coe.service.IIformationService;

public class InformationServiceImp implements IIformationService {
	private IInformationDao informationDao;

	public IInformationDao getInformationDao() {
		return informationDao;
	}

	public void setInformationDao(IInformationDao informationDao) {
		this.informationDao = informationDao;
	}

	public List findAllUser() {
		return this.getInformationDao().find("from Information");
	}

	public boolean userLogin(String name, String pas, String level) {
		String hql = "from Information as us where us.username=? and us.password=? and us.level=?";
		Object[] values = new Object[3];
		values[0] = name;
		values[1] = pas;
		values[2] = level;
		List userList = this.getInformationDao().find(hql, values);
		if (userList.size() <= 0) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 根据性别获取用户报表
	 * 
	 */

	public List getInfomationNum() {
		String hql = "select i.sex, count(*) from Information as i group by i.sex";
		List list = this.getInformationDao().find(hql);
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] obj = (Object[]) iterator.next();
			for (int i = 0; i < obj.length; i++) {
				Object object = obj[i];
				System.out.println(object);
			}
		}
		return list;
	}

	/**
	 * 根据部门获取用户报表
	 * 
	 */

	public List getInformationdepNum() {
		String hql = "select department ,count(*) from Information group by department";
		List list = this.getInformationDao().find(hql);
		return list;
	}
	
	public List getinformationpositon() {
		String hql = "select position ,count(*) from Information group by position";
		List list = this.getInformationDao().find(hql);
		return list;
	}

	/*
	 * 根据人数确定打卡次数
	 * 
	 */
	public List getAttendanceNum() {
		return null;
	}

	/*
	 * 根据本部门查看性别比例
	 * 
	 */
	public List getybInfomationNum(String department) {
		String hql = "select i.sex, count(*) from Information as i group by i.sex where i.department="
				+ department;
		List list = this.getInformationDao().find(hql);
		return list;
	}

	public boolean saveUser(Information information) {
		boolean b = false;
		this.getInformationDao().save(information);
		b = true;
		return b;
	}

	public List findUserbymh(String hql) {
		return this.getInformationDao().find(hql);
	}

	public Information findInformationByid(Integer id) {

		return (Information) this.getInformationDao().findOjbectByID(
				Information.class, id);
	}

	public void updateInformation(Information information) {
		this.getInformationDao().updateObjectByID(information);

	}

	public void deletInformation(Integer id) {

		this.getInformationDao().delete(id);
	}
	public List findbyname(String name) {
		String[] values={name};
		List list=this.informationDao.find("from Information where username=?", values);
		return list;
	}

	

}
