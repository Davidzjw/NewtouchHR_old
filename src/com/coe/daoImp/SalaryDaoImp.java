package com.coe.daoImp;

import java.util.List;

import com.coe.dao.ISalaryDao;
import com.coe.dto.Salary;

public class SalaryDaoImp extends BaseDao implements ISalaryDao {

	public void delete(Integer id) {
		super.deleteObjectByID(Salary.class, id);
	}

	public List find(String hql) {
		return super.findAllObject(hql);
	}

	public List find(String hql, Object[] values) {
		return super.findObjectByHql(hql, values);
	}

	public void save(Salary attendance) {
		super.saveObject(attendance);

	}

	public void update(Salary salary) {
		super.updateObjectByID(salary);
	}

}
