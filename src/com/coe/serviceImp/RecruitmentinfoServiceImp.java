package com.coe.serviceImp;

import java.util.List;

import com.coe.dao.IRecruitmentinfoDao;
import com.coe.dto.Recruitmentinfo;
import com.coe.service.IRecruitmentinfoService;

public class RecruitmentinfoServiceImp implements IRecruitmentinfoService {
	private IRecruitmentinfoDao recruitmentinfoDao;

	public IRecruitmentinfoDao getRecruitmentinfoDao() {
		return recruitmentinfoDao;
	}

	public void setRecruitmentinfoDao(IRecruitmentinfoDao recruitmentinfoDao) {
		this.recruitmentinfoDao = recruitmentinfoDao;
	}

	public void deletRecruitmentinfo(Integer id) {
		this.getRecruitmentinfoDao().delete(id);

	}

	public List findAllRecruitmentinfo() {
		return this.getRecruitmentinfoDao().find("from Recruitmentinfo");
	}

	public Recruitmentinfo findRecruitmentinfoByid(Integer id) {
		return (Recruitmentinfo) this.getRecruitmentinfoDao().findOjbectByID(
				Recruitmentinfo.class, id);
	}

	public List findRecruitmentinfobymh(String hql) {
		return this.getRecruitmentinfoDao().find(hql);
	}

	public boolean saveRecruitmentinfo(Recruitmentinfo recruitmentinfo) {
		boolean b = false;
		this.getRecruitmentinfoDao().save(recruitmentinfo);
		b = true;
		return b;
	}

	public void updateRecruitmentinfo(Recruitmentinfo recruitmentinfo) {
		this.getRecruitmentinfoDao().updateObjectByID(recruitmentinfo);
	}

}
