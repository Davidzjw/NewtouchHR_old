package com.coe.service;

import java.util.List;

import com.coe.dto.Salary;


public interface ISalaryService {

	public List findAllSalary();

	public boolean saveSalary(Salary salary);
	
	public List findSalaybymh(String hql);
	
	public void updateSalary(Salary salary);
	
	public void deletSalary(Integer id);
	
	public List getSalaryNum(String str,String time1,String time2);
	
	public List getSalaryBydep(String str,String dep,String time1,String time2);
	
}
