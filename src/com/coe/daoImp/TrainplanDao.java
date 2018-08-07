package com.coe.daoImp;

import java.util.List;

import com.coe.dao.ITrainplanDao;
import com.coe.dto.Trainingplan;

public class TrainplanDao extends BaseDao implements ITrainplanDao {

	public Trainingplan findbyTrf(String trf) {
		String values[] = { trf };
		Trainingplan trainingplan = (Trainingplan) super.getSingletonResult(
				values, "from Trainingplan where trf = ?");
		return trainingplan;
	}

	public Trainingplan findbyId(Integer id) {
		Trainingplan trainingplan = (Trainingplan) super.findOjbectByID(
				Trainingplan.class, id);
		return trainingplan;
	}

	public Trainingplan findbyfzr(String fzr) {
		String[] values = { fzr };
		List list = super.findObjectByHql(
				"from Trainingplan where fzr.username=?", values);
		Trainingplan trainingplan = (Trainingplan) list.get(0);
		return trainingplan;
	}

	public void saveplan(Trainingplan trainingplan) {
		super.saveObject(trainingplan);

	}

	public List find(String hql) {
		List list = super.findAllObject(hql);
		return list;
	}

	public void update(Trainingplan trainingplan) {
		super.updateObjectByID(trainingplan);

	}

	public void delet(Integer id) {
		super.deleteObjectByID(Trainingplan.class, id);
	}

}
