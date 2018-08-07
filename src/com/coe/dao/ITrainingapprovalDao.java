package com.coe.dao;

import java.util.List;

import com.coe.dto.Trainingapproval;

public interface ITrainingapprovalDao {
	public void save(Trainingapproval trainingapproval);

	public void delete(Integer id);

	public List find(String hql);

	public List find(String hql, Object[] values);

	public void updateApp(Trainingapproval trainingapproval);
	public void updateApps(String hql,Object[] values);

}
