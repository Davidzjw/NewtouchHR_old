package com.coe.daoImp;

import java.util.List;

import com.coe.dao.IConnectDao;
import com.coe.dto.Contract;

public class ContractDaoImp extends BaseDao implements IConnectDao {

	public void delete(Integer id) {
		super.deleteObjectByID(Contract.class, id);

	}

	public List find(String hql) {
		return super.findAllObject(hql);
	}

	public List find(String hql, Object[] values) {
		return super.findObjectByHql(hql, values);
	}

	public void save(Contract contract) {
		super.saveObject(contract);

	}

	public void update(Contract object) {
		super.updateObjectByID(object);

	}


}
