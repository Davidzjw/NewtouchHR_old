package com.coe.daoImp;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.coe.dao.ITrainingapprovalDao;
import com.coe.dto.Trainingapproval;

public class TrainingapprovalDao extends BaseDao implements
		ITrainingapprovalDao {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void delete(Integer id) {
		super.deleteObjectByID(Trainingapproval.class, id);

	}

	public List find(String hql) {
		List list = super.findAllObject(hql);
		return list;
	}

	public List find(String hql, Object[] values) {
		List list = super.findObjectByHql(hql, values);
		return list;
	}

	public void save(Trainingapproval trainingapproval) {
		super.saveObject(trainingapproval);

	}

	public void updateApp(Trainingapproval trainingapproval) {
		super.updateObjectByID(trainingapproval);
	}
	public void updateApps(String hql,Object[] values) {
		
		super.executeUpdateObjectByHql(hql, values);
	}

}
