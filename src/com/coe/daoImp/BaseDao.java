package com.coe.daoImp;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;


/**
 * ͨ�õ����ݲ�����
 * 
 * @author lipeng
 * 
 */
public class BaseDao {
	private HibernateTemplate hibernateTemplate;
	

	/**
	 * ����hql�����ҶԶ���
	 * 
	 * @param hql
	 *            ��ѯ���
	 * @return List
	 */
	public List findAllObject(String hql) {
		return this.getHibernateTemplate().find(hql);
	}

	/**
	 * ����hql��������������Ҷ���
	 * 
	 * @param hql
	 *            ��ѯ���
	 * @param values
	 *            ��������
	 * @return List
	 */
	public List findObjectByHql(String hql, Object[] values) {
		
		return this.getHibernateTemplate().find(hql, values);
	}

	/**
	 * ��ҳ��ѯ
	 * 
	 * @param hql
	 *            ��ѯ���
	 * @param offset
	 *            �Ӷ�������ʼ
	 * @param pageSize
	 *            ÿҳ��ʾ������
	 * @param values
	 *            ��������
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
	 * ��һ�����ѯ
	 * 
	 * @param values
	 *            ��������
	 * @param hql
	 *            ��ѯ���
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
	 * �����������
	 * 
	 * @param object
	 */
	public void saveObject(Object object) {

		this.getHibernateTemplate().save(object);
	}

	/**
	 * ����id���Ҷ���
	 * 
	 * @param objclass
	 * @param id
	 * @return Object
	 */
	public Object findOjbectByID(Class objclass, Integer id) {
		return this.getHibernateTemplate().get(objclass, id);
	}

	/**
	 * ����idɾ������
	 * 
	 * @param objclass
	 * @param id
	 */
	public void deleteObjectByID(Class objclass, Integer id) {

		this.getHibernateTemplate().delete(
				this.getHibernateTemplate().load(objclass, id));

	}

	/**
	 * ����hql�����¶�����Ϣ
	 * 
	 * @param hql
	 *            �������
	 * @param values
	 *            ��������
	 * @return
	 */
	public Integer executeUpdateObjectByHql(final String hql,
			final Object[] values) {
		return (Integer) this.getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// hql��� ʵ���޸�
						Query query = session.createQuery(hql);
						if (values != null) {
							for (int i = 0; i < values.length; i++) {
								query.setParameter(i, values[i]);// ע��hql����еĲ���
							}
						}
						return new Integer(query.executeUpdate());
					}

				});
	}

	/**
	 * ����id���¶�����Ϣ
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
