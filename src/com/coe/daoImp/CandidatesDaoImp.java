package com.coe.daoImp;

import java.util.List;

import com.coe.dao.ICandidatesDao;
import com.coe.dto.Candidates;

public class CandidatesDaoImp extends BaseDao implements ICandidatesDao {

	public void delete(Integer id) {
		super.deleteObjectByID(Candidates.class, id);

	}

	public List find(String hql) {
		return super.findAllObject(hql);
	}

	public List find(String hql, Object[] values) {
		return super.findObjectByHql(hql, values);
	}

	public void save(Candidates candidates) {
		super.saveObject(candidates);

	}

	public void updateObjectByID(Candidates candidates) {
		super.updateObjectByID(candidates);
	}

}
