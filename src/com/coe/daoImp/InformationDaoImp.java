package com.coe.daoImp;

import java.util.List;

import com.coe.dao.IInformationDao;
import com.coe.dto.Information;

public class InformationDaoImp extends BaseDao implements IInformationDao {

	public void delete(Integer id) {
		super.deleteObjectByID(Information.class, id);

	}

	public List find(String hql) {
		return super.findAllObject(hql);
	}

	public List find(String hql, Object[] values) {
		return super.findObjectByHql(hql, values);
	}

	public void save(Information info) {
		super.saveObject(info);

	}

	public Object findByid(Class objclass, Integer id) {

		return super.findOjbectByID(objclass, id);
	}

	public void updateObjectByID(Information objclass) {
		super.updateObjectByID(objclass);
	}
	

}
