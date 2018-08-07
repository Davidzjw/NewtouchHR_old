package com.coe.service;

import java.util.List;

import com.coe.dto.Candidates;

public interface ICandidatesService {


	public List findAllCandidates();

	public boolean saveCandidates(Candidates candidates);

	public List findCandidatesbymh(String hql);

	public Candidates findCandidatesByid(Integer id);

	public void updateCandidates(Candidates candidates);
	
	public void deletCandidates(Integer id);
	
	public List getzhaopinNum(String str);

}
