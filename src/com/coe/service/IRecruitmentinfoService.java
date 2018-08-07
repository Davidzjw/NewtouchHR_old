package com.coe.service;

import java.util.List;

import com.coe.dto.Recruitmentinfo;

public interface IRecruitmentinfoService {


	public List findAllRecruitmentinfo();

	public boolean saveRecruitmentinfo(Recruitmentinfo recruitmentinfo);

	public List findRecruitmentinfobymh(String hql);

	public Recruitmentinfo findRecruitmentinfoByid(Integer id);

	public void updateRecruitmentinfo(Recruitmentinfo recruitmentinfo);
	
	public void deletRecruitmentinfo(Integer id);

}
