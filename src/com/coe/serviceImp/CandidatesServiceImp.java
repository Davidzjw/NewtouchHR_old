package com.coe.serviceImp;

import java.util.List;

import com.coe.dao.ICandidatesDao;
import com.coe.dto.Candidates;
import com.coe.service.ICandidatesService;

public class CandidatesServiceImp implements ICandidatesService {
	private ICandidatesDao candidatesDao;

	public ICandidatesDao getCandidatesDao() {
		return candidatesDao;
	}

	public void setCandidatesDao(ICandidatesDao candidatesDao) {
		this.candidatesDao = candidatesDao;
	}

	public void deletCandidates(Integer id) {
		this.getCandidatesDao().delete(id);

	}

	public List findAllCandidates() {
		return this.getCandidatesDao().find("from Candidates");
	}

	public Candidates findCandidatesByid(Integer id) {

		return (Candidates) this.getCandidatesDao().findOjbectByID(
				Candidates.class, id);
	}

	public List findCandidatesbymh(String hql) {
		return this.getCandidatesDao().find(hql);
	}

	public boolean saveCandidates(Candidates candidates) {
		boolean b = false;
		this.getCandidatesDao().save(candidates);
		b = true;
		return b;
	}

	public void updateCandidates(Candidates candidates) {
		this.getCandidatesDao().updateObjectByID(candidates);
	}

	public List getzhaopinNum(String str) {
		String hql;
		if(str.equals("c.department")){
			 hql="select department , count(*) from Candidates as c group by "+str;
		}else{
			 hql = "select position , count(*) from Candidates as c group by "+str ;
		}
		
		List list = this.getCandidatesDao().find(hql);
		return list;
	}

}
