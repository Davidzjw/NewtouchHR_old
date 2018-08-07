package com.coe.daoImp;

import java.util.List;

import com.coe.dao.INoticeDao;
import com.coe.dto.Notice;

public class NoticeDaoImp extends BaseDao implements INoticeDao {

	public void delete(Integer id) {
		super.deleteObjectByID(Notice.class, id);
	}

	public List find(String hql) {
		return super.findAllObject(hql);
	}

	public List find(String hql, Object[] values) {
		return super.findObjectByHql(hql, values);
	}

	public void save(Notice notice) {
		super.saveObject(notice);
	}

	public void update(Notice notice) {
		super.updateObjectByID(notice);
		
	}

}
