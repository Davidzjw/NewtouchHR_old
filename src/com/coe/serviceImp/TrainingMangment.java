package com.coe.serviceImp;

import java.util.List;

import com.coe.dao.ITrainingapprovalDao;
import com.coe.dao.ITrainplanDao;
import com.coe.dto.Information;
import com.coe.dto.Trainingapproval;
import com.coe.dto.Trainingplan;
import com.coe.service.ITrainingMangment;

public class TrainingMangment implements ITrainingMangment {
	private ITrainingapprovalDao trainingapprovalDao;
	private ITrainplanDao trainingplanDao;

	public ITrainingapprovalDao getTrainingapprovalDao() {
		return trainingapprovalDao;
	}

	public void setTrainingapprovalDao(ITrainingapprovalDao trainingapprovalDao) {
		this.trainingapprovalDao = trainingapprovalDao;
	}

	public ITrainplanDao getTrainingplanDao() {
		return trainingplanDao;
	}

	public void setTrainingplanDao(ITrainplanDao trainingplanDao) {
		this.trainingplanDao = trainingplanDao;
	}

	/** ********************** 查找对象 ***************************** */

	public List findAllplan() {

		List list = this.trainingplanDao.find("from Trainingplan");
		return list;
	}

	public List findAllapproval() {
		List list = this.trainingapprovalDao.find("from Trainingapproval");
		return list;
	}

	public Trainingapproval findMyapproval() {
		return new Trainingapproval();
	}

	public Trainingplan findTrainingplan(String trf) {
		Trainingplan trainingplan = this.trainingplanDao.findbyTrf(trf);
		return trainingplan;
	}

	public Trainingplan findTrainingplanbyfzr(String fzr) {
		Trainingplan trainingplan = this.trainingplanDao.findbyfzr(fzr);
		return trainingplan;
	}

	public List findappbyinfo(Information information) {
		Object[] values = { information };
		List list = this.trainingapprovalDao.find(
				"from Trainingapproval where information = ?", values);
		return list;
	}

	public Trainingplan findTrainingplanbyId(Integer id) {
		Trainingplan trainingplan = this.trainingplanDao.findbyId(id);
		return trainingplan;
	}

	/** ********************** 更新对象 ***************************** */

	public void update(Trainingapproval trainingapproval) {
		this.trainingapprovalDao.updateApp(trainingapproval);
	}

	public void updateTrainingplan(Trainingplan trainingplan) {
		this.getTrainingplanDao().update(trainingplan);

	}


	/** ********************** 保存对象 ***************************** */

	public void saveapp(Trainingapproval trainingapproval) {
		this.trainingapprovalDao.save(trainingapproval);

	}

	public void saveplan(Trainingplan trainingplan) {
		this.trainingplanDao.saveplan(trainingplan);

	}

	/** ********************** 删除对象 ***************************** */
	public void delapproval(Integer id) {
		this.trainingapprovalDao.delete(id);

	}

	public List findTrapp(String hql) {
		List list = this.getTrainingapprovalDao().find(hql);
		return list;
	}

	public void deleteTrainingplan(Integer id) {
		this.getTrainingplanDao().delet(id);

	}

	public List findTrplan(String hql) {
		return this.getTrainingplanDao().find(hql);
	}
	public void updateApp(String hql,Object[] values) {

		this.trainingapprovalDao.updateApps(hql,values);

	}
	public List findAllEva() {
		Object[] values= {new Integer(1)};
		List list=this.trainingapprovalDao.find("from Trainingapproval where trmark=?", values);
		return list;
	}
}
