package gz.it.pratice.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;

import gz.it.pratice.action.query.CustomerQuery;
import gz.it.pratice.dao.CustomerDao;
import gz.it.pratice.entity.Customer;

public class CustomerDaoImpl implements CustomerDao{
	
	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}


	/**
	 * 查询客户
	 */
	@Override
	public List<Customer> findByHQL(String hql, Object... values) {
		return (List<Customer>)hibernateTemplate.find(hql, values);
	}


	@Override
	public void save(Customer cus) {
		//hibernateTemplate.save(cus);
		//新增或修改
		hibernateTemplate.saveOrUpdate(cus);
	}


	/**
	 * 用回Hibernate的分页查询
	 */
	@Override
	public List<Customer> findByHibernate(final CustomerQuery cq ,final String hql,final  Object... values) {
		
		return hibernateTemplate.execute(new HibernateCallback<List<Customer>>() {

			@Override
			public List<Customer> doInHibernate(Session session)throws HibernateException {
				//分页的条件查询
				Query query = session.createQuery(hql);
				
				//条件查询
				for(int i=0;i<values.length;i++){
					query.setParameter(i, values[i]);
				}
				
				query.setFirstResult((cq.getCurPage()-1)*cq.getPageSize());//起始行
				query.setMaxResults(cq.getPageSize());
				return query.list();
			}
		});
	}


	@Override
	public Integer findByHibernateDataCount(final CustomerQuery cq,final  String hql,final  Object... values) {
		return hibernateTemplate.execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session)throws HibernateException {
				//分页的条件查询
				Query query = session.createQuery(hql);

				//条件查询
				for(int i=0;i<values.length;i++){
					query.setParameter(i, values[i]);
				}
				
				return ((Long)query.uniqueResult()).intValue();
			}
		});
	}


	@SuppressWarnings("unchecked")
	@Override
	public void deleteByIds(final String hql,final Object[] values) {
		
		//"delete from Customer where custId in ( :ids )"
		hibernateTemplate.execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				//使用Hibernate的原生的值
				Query createQuery = session.createQuery(hql);
				createQuery.setParameterList("ids", values);//把一个集合设置进来
				return createQuery.executeUpdate();
			}
		});
		
		
		
		//先查询出用户
				//List<Customer> cList = (List<Customer>) hibernateTemplate.find(hql, values);
				//批量删除
				//hibernateTemplate.deleteAll(cList);
				/*hibernateTemplate.execute(new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Query createQuery = session.createQuery(hql);
						createQuery.setParameterList("ids", values);
						return createQuery.executeUpdate();
					}
				});
				*/
				
		
	}


	//直接返回客户
	@Override
	public Customer findById(Long custId) {
		return hibernateTemplate.get(Customer.class, custId);
	}


	/**
	 * 把所有的客户查询出来
	 */
	@Override
	public List<Customer> findAll() {
		return hibernateTemplate.loadAll(Customer.class);
	}
		

}
