package com.coe.dao;

import java.util.List;

import com.coe.dto.Contract;

public interface IConnectDao {
	public void save(Contract contract);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);
	
	public void update(Contract object);
	
	
	
}
