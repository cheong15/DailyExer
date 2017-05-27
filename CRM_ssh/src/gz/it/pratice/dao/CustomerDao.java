package gz.it.pratice.dao;

import gz.it.pratice.action.query.CustomerQuery;
import gz.it.pratice.entity.Customer;

import java.util.List;

public interface CustomerDao {
	
	/**
	 * 查询客户
	 * @param hql
	 * @param values
	 * @return 
	 */
	public List<Customer> findByHQL(String hql,Object ...values );
	
	/**
	 * 保存客户
	 * @param cus 
	 */
	public void save(Customer cus);
	
	/**
	 * 条件查询客户
	 * @param hql
	 * @param values
	 * @return 
	 */
	public List<Customer> findByHibernate(CustomerQuery cq ,String hql,Object ...values );
	
	/**
	 * 查出总记录数
	 * @param cq
	 * @param hql
	 * @param values
	 * @return 
	 * @ProjectName itheimacrm
	 * @author Johnny 
	 * @date 2017年5月22日 上午11:52:17
	 */
	public Integer findByHibernateDataCount(CustomerQuery cq ,String hql,Object ...values );
	
	public void deleteByIds(String hql,Object[] values);

	/**
	 * 查询客户根据id
	 * @param custId
	 * @return 
	 */
	public Customer findById(Long custId);

	/**
	 * 查询所有的客户
	 * @return 
	 */
	public List<Customer> findAll();
}
