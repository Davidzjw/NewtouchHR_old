package com.coe.dao;

import java.util.List;

import com.coe.dto.Information;

public interface IInformationDao {
	public void save(Information info);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);

	public Object findOjbectByID(Class objclass, Integer id);

	public void updateObjectByID(Information objclass);

}
