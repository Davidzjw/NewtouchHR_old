package com.coe.service;

import java.util.List;

import com.coe.dto.Contract;

public interface IContractService {


	public List findAllContract();

	public boolean saveContract(Contract contract);

	public List findContractbymh(String hql);

	public void updatContract(Contract contract);

	public void deletContract(Integer id);

}
