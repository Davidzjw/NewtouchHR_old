package com.coe.daoImp;

import java.util.List;

import com.coe.dao.IRecruitmentinfoDao;
import com.coe.dto.Recruitmentinfo;

public class RecruitmentinfoDaoImp extends BaseDao implements
		IRecruitmentinfoDao {

	public void delete(Integer id) {
		super.deleteObjectByID(Recruitmentinfo.class, id);

	}

	public List find(String hql) {
		return super.findAllObject(hql);
	}

	public List find(String hql, Object[] values) {
		return super.findObjectByHql(hql, values);
	}

	public Object findByid(Class objclass, Integer id) {

		return super.findOjbectByID(objclass, id);
	}

	public void save(Recruitmentinfo recruitmentinfo) {
		super.saveObject(recruitmentinfo);
	}

	public void updateObjectByID(Recruitmentinfo recruitmentinfo) {
		super.updateObjectByID(recruitmentinfo);

	}

}
