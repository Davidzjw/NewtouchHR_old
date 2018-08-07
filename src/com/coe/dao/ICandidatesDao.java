package com.coe.dao;

import java.util.List;

import com.coe.dto.Candidates;

public interface ICandidatesDao {
	public void save(Candidates candidates);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);

	public Object findOjbectByID(Class objclass, Integer id);

	public void updateObjectByID(Candidates candidates);

}
