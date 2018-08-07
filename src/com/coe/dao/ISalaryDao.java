package com.coe.dao;

import java.util.List;

import com.coe.dto.Salary;

public interface ISalaryDao {
	public void save(Salary salary);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);
	
	public void update(Salary salary);
	
}
