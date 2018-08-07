package com.coe.service;

import java.util.List;

import com.coe.dto.Information;

public interface IIformationService {

	public boolean userLogin(String name, String pas ,String level);

	public List findAllUser();

	public boolean saveUser(Information information);

	public List findUserbymh(String hql);

	public Information findInformationByid(Integer id);

	public void updateInformation(Information information);

	public void deletInformation(Integer id);

	public List getInfomationNum();
	
	public List getInformationdepNum();
	
	public List getAttendanceNum();
	
	public List getybInfomationNum(String department);
	public List findbyname(String name);
	
	public List getinformationpositon();

}
