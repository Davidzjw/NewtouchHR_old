package com.coe.service;

import java.util.List;

import com.coe.dto.Information;
import com.coe.dto.Trainingapproval;
import com.coe.dto.Trainingplan;

public interface ITrainingMangment {

	public void delapproval(Integer id);

	public void update(Trainingapproval trainingapproval);

	public List findAllapproval();

	public Trainingapproval findMyapproval();

	public Trainingplan findTrainingplan(String trf);

	public Trainingplan findTrainingplanbyId(Integer id);

	public Trainingplan findTrainingplanbyfzr(String fzr);

	public List findappbyinfo(Information information);

	public void saveapp(Trainingapproval trainingapproval);

	public void saveplan(Trainingplan trainingplan);

	public List findAllplan();

	public List findTrapp(String hql);
	
	public List findTrplan(String hql);

	public void updateTrainingplan(Trainingplan trainingplan);

	public void deleteTrainingplan(Integer id);
	public void updateApp(String hql,Object[] values);

	public List findAllEva();
}
