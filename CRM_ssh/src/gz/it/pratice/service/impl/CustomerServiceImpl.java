package gz.it.pratice.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import gz.it.pratice.action.query.CustomerQuery;
import gz.it.pratice.dao.CustomerDao;
import gz.it.pratice.entity.Customer;
import gz.it.pratice.service.CustomerService;
import gz.it.pratice.util.PageBean;

public class CustomerServiceImpl implements CustomerService {
	
	//注入dao
	private CustomerDao customerDao;
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}


	/**
	 * 校验客户名称的唯一性
	 */
	@Override
	public boolean checkName(String name) {
		List<Customer> customerList = customerDao.findByHQL("from Customer where custName=?", name);
		if(customerList.size()>0){
			//已过已经存在客户名称，返回true
			return true;
		}
		//其他情况就是不存在同名的客户
		return false;
	}


	@Override
	public void save(Customer cus) {
		customerDao.save(cus);
	}


	/**
	 * 查询客户的数据
	 */
	@Override
	public PageBean<Customer> findByHql(CustomerQuery query) {
		
		//hql语句拼接
		String hqlStrList =  "from Customer where 1=1 ";
		String hqlStrCount = "select count(c) from Customer c where 1=1";
		
		
		//封装参数
		List<String> valueList = new ArrayList<String>();
		
		//信息来源
		if(StringUtils.isNoneBlank(query.getCustSource())){
			hqlStrList += " and custSource=?";
			hqlStrCount += " and custSource=?";
			valueList.add(query.getCustSource());
		}
		
		//所属行业
		if(StringUtils.isNoneBlank(query.getCustIndustry())){
			hqlStrList += " and custIndustry=?";
			hqlStrCount += " and custIndustry=?";
			valueList.add(query.getCustIndustry());
		}
		
		//客户级别
		if(StringUtils.isNoneBlank(query.getCustLevel())){
			hqlStrList += " and custLevel=?";
			hqlStrCount += " and custLevel=?";
			valueList.add(query.getCustLevel());
		}
		
		//关键字的设置
		if(StringUtils.isNoneBlank(query.getKeyWord())){
			hqlStrList += " and (custName like ?  or  custPhone like ? or custMobile like ?)";
			hqlStrCount += " and (custName like ?  or  custPhone like ? or custMobile like ?)";
			valueList.add("%"+query.getKeyWord()+"%");
			valueList.add("%"+query.getKeyWord()+"%");
			valueList.add("%"+query.getKeyWord()+"%");
		}
		
		
		
		
		
		
		
		//1、获取当前页数据
		List<Customer> cList = customerDao.findByHibernate(query, hqlStrList, valueList.toArray());
		
		//2、获取总记录数
		Integer count = customerDao.findByHibernateDataCount(query, hqlStrCount,  valueList.toArray());
		
		//3、回传数据
		PageBean<Customer>  pg = new PageBean<Customer>();
		pg.setCurDataList(cList);
		pg.setTotalCount(count);//总记录数
		
		//回传页面数据
		pg.setCurPage(query.getCurPage());
		pg.setPageSize(query.getPageSize());
		
		return pg;
		
	}


	@Override
	public void deleteByIds(String ids) {
		//出除最后一个逗号
		ids = ids.substring(0, ids.length()-1);
		String[] split = ids.split(",");
		List<Long> idsList = new ArrayList<Long>();
		for (String id : split) {
			//把id值传入集合
			idsList.add(new Long(id));
		}
		
		String hql = "delete from Customer where custId in ( :ids )";
		
		System.out.println("批量删除====>"+hql);
		
		customerDao.deleteByIds(hql, idsList.toArray());
		
	}


	@Override
	public Customer findById(Long custId) {
		return customerDao.findById(custId);
	}


	@Override
	public List<Customer> findAll() {
		return customerDao.findAll();
	}

}
