package gz.it.pratice.service;

import java.util.List;

import gz.it.pratice.action.query.CustomerQuery;
import gz.it.pratice.entity.Customer;
import gz.it.pratice.util.PageBean;

public interface CustomerService {
	
	public boolean checkName(String name);

	public void save(Customer cus);
	
	/**
	 * @parm    传入的查询条件 :CustomerQuery
	 * @return  PageBean
	 */
	public PageBean<Customer> findByHql(CustomerQuery query);
	
	/**
	 * 批量删除
	 * @param ids 
	 */
	public void deleteByIds(String ids);

	/**
	 * 客户编辑
	 * @param custId
	 * @return 
	 */
	public Customer findById(Long custId);

	/**
	 * 获取所有的客户
	 * @return 
	 */
	public List<Customer> findAll();
}
