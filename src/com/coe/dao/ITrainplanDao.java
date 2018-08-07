package com.coe.dao;

import java.util.List;

import com.coe.dto.Trainingplan;

public interface ITrainplanDao {
	public Trainingplan findbyTrf(String trf);

	public Trainingplan findbyId(Integer id);

	public Trainingplan findbyfzr(String fzr);

	public void saveplan(Trainingplan trainingplan);

	public List find(String hql);

	public void update(Trainingplan trainingplan);

	public void delet(Integer id);
}
