package com.coe.serviceImp;

import java.util.List;

import com.coe.dao.IConnectDao;
import com.coe.dto.Contract;
import com.coe.service.IContractService;

public class ContractServiceImp implements IContractService {
	private IConnectDao connectDao;

	public IConnectDao getConnectDao() {
		return connectDao;
	}

	public void setConnectDao(IConnectDao connectDao) {
		this.connectDao = connectDao;
	}

	public List findAllContract() {
		// TODO Auto-generated method stub

		return this.getConnectDao().find("from Contract");
	}

	public boolean saveContract(Contract contract) {
		boolean b = false;
		this.getConnectDao().save(contract);
		b = true;
		return b;
	}

	public List findContractbymh(String hql) {

		return this.getConnectDao().find(hql);
	}

	public void updatContract(Contract contract) {
		this.getConnectDao().update(contract);

	}

	public void deletContract(Integer id) {
		this.getConnectDao().delete(id);

	}

}
