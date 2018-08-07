package com.coe.daoImp;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;


/**
 * 通用的数据操作类
 * 
 * @author lipeng
 * 
 */
public class BaseDao {
	private HibernateTemplate hibernateTemplate;
	

	/**
	 * 根据hql语句查找对对象
	 * 
	 * @param hql
	 *            查询语句
	 * @return List
	 */
	public List findAllObject(String hql) {
		return this.getHibernateTemplate().find(hql);
	}

	/**
	 * 根据hql语句和条件数组查找对象
	 * 
	 * @param hql
	 *            查询语句
	 * @param values
	 *            条件数组
	 * @return List
	 */
	public List findObjectByHql(String hql, Object[] values) {
		
		return this.getHibernateTemplate().find(hql, values);
	}

	/**
	 * 分页查询
	 * 
	 * @param hql
	 *            查询语句
	 * @param offset
	 *            从多少条开始
	 * @param pageSize
	 *            每页显示多少条
	 * @param values
	 *            条件数组
	 * @return List
	 */
	public List findObjectByFenYe(final String hql, final int offset,
			final int pageSize, final Object[] values) {
		return (List) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						if (values != null) {
							int j = values.length;
							for (int i = 0; i < j; i++) {
								query.setParameter(i, values[i]);
							}
						}
						query.setFirstResult(offset);
						query.setMaxResults(pageSize);
						return query.list();
					}
				});
	}

	/**
	 * 单一结果查询
	 * 
	 * @param values
	 *            条件数组
	 * @param hql
	 *            查询语句
	 * @return Object
	 */
	public Object getSingletonResult(final Object[] values, final String hql) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (values != null) {
					for (int i = 0; i < values.length; i++) {
						query.setParameter(i, values[i]);
					}
				}
				return query.uniqueResult();
			}
		});
	}

	/**
	 * 保存对象数据
	 * 
	 * @param object
	 */
	public void saveObject(Object object) {

		this.getHibernateTemplate().save(object);
	}

	/**
	 * 根据id查找对象
	 * 
	 * @param objclass
	 * @param id
	 * @return Object
	 */
	public Object findOjbectByID(Class objclass, Integer id) {
		return this.getHibernateTemplate().get(objclass, id);
	}

	/**
	 * 根据id删除对象
	 * 
	 * @param objclass
	 * @param id
	 */
	public void deleteObjectByID(Class objclass, Integer id) {

		this.getHibernateTemplate().delete(
				this.getHibernateTemplate().load(objclass, id));

	}

	/**
	 * 根据hql语句更新对象信息
	 * 
	 * @param hql
	 *            更新语句
	 * @param values
	 *            条件数组
	 * @return
	 */
	public Integer executeUpdateObjectByHql(final String hql,
			final Object[] values) {
		return (Integer) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// hql语句 实现修改
						Query query = session.createQuery(hql);
						if (values != null) {
							for (int i = 0; i < values.length; i++) {
								query.setParameter(i, values[i]);// 注入hql语句中的参数
							}
						}
						return new Integer(query.executeUpdate());
					}

				});
	}

	/**
	 * 根据id更新对象信息
	 * 
	 * @param objclass
	 * @param id
	 */
	public void updateObjectByID(Object objclass) {
		this.getHibernateTemplate().update(objclass);
	}

	/** *************************************************************************************** */
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
