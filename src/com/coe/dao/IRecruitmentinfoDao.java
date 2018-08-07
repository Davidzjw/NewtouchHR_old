package com.coe.dao;

import java.util.List;

import com.coe.dto.Recruitmentinfo;

public interface IRecruitmentinfoDao {
	public void save(Recruitmentinfo recruitmentinfo);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);

	public Object findOjbectByID(Class objclass, Integer id);

	public void updateObjectByID(Recruitmentinfo recruitmentinfo);

}
