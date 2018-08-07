package com.coe.serviceImp;

import java.util.List;

import com.coe.dao.ISalaryDao;
import com.coe.dto.Salary;
import com.coe.service.ISalaryService;

public class SalaryServiceImp implements ISalaryService {
	private ISalaryDao salaryDao;

	public ISalaryDao getSalaryDao() {
		return salaryDao;
	}

	public void setSalaryDao(ISalaryDao salaryDao) {
		this.salaryDao = salaryDao;
	}

	public List findAllSalary() {
		return this.getSalaryDao().find("from Salary");
	}

	public List findSalaybymh(String hql) {
		return this.getSalaryDao().find(hql);
	}

	public boolean saveSalary(Salary salary) {
		boolean b = false;
		this.getSalaryDao().save(salary);
		b = true;
		return b;
	}

	public void updateSalary(Salary salary) {
		this.getSalaryDao().update(salary);

	}

	public void deletSalary(Integer id) {

		this.getSalaryDao().delete(id);
	}

	public List getSalaryNum(String str, String time1, String time2) {
		String ltime="1900-01-01";
		String hql = "select s.information ," + str + " from Salary as s ";
		if (!time1.equals("") && time1 != null&&!time2.equals("") && time2 != null) {
			hql += " where s.time between '" + time1 + "' and '" + time2 + "'";
		}
		if(time1.equals("")&&!time2.equals("")){
			hql+=" where s.time between '"+ltime+"' and '"+time2+"'";
		}
		

		List list = this.getSalaryDao().find(hql);
		return list;
	}

	public List getSalaryBydep(String str, String dep, String time1,
			String time2) {
		String hql="select s.information ," + str
		+ " from Salary as s where s.information.department='"
		+ dep + "'";
		if (!time1.equals("") && time1 != null&&!time2.equals("") && time2 != null) {
			 hql += " and s.time between '" + time1 + "' and '"
					+ time2 + "'";
		}
		List list = this.getSalaryDao().find(hql);
		return list;
	}

}
