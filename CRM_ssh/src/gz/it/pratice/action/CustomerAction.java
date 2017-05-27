package gz.it.pratice.action;

import com.opensymphony.xwork2.ModelDriven;

import gz.it.pratice.action.query.CustomerQuery;
import gz.it.pratice.base.BaseAction;
import gz.it.pratice.entity.Customer;
import gz.it.pratice.service.CustomerService;
import gz.it.pratice.util.PageBean;

public class CustomerAction extends BaseAction implements ModelDriven<Customer>{
	
	private static final long serialVersionUID = 435374488072752596L;
	
	//注入Service
	private CustomerService customerService;
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}




	//代码校验：客户名称不能重复
	public void validateAdd() {
		
		log.info("客户名称唯一性校验：======>"+customer);
		if(customer.getCustId()==null&&customerService.checkName(customer.getCustName())){
			this.addFieldError("custName", "客户名称不能重复");
		}
		
	}
	
	
	
	
	/**
	 * 用户添加action
	 * @return 
	 */
	public String add(){
		
		log.info("客户添加======>"+customer);
		
		if(customer.getCustId()==null){
			//回显成功的信息
			this.putContext("msg", "恭喜：新增客户成功！");
		}else{
			//回显成功的信息
			this.putContext("msg", "恭喜：修改客户成功！");
		}
		
		//保存客户
		customerService.save(customer);
		
		return SUCCESS;
	}
	
	/**
	 * 客户查询
	 * @return 
	 */
	public String list(){
		
		if(query.getCurPage()==null){
			query.setCurPage(1);
		}
		if(query.getPageSize()==null){
			query.setPageSize(10);
		}
		
		log.info(query);
		
		
		PageBean<Customer> cList = customerService.findByHql(query);
		
		//回显query的值
		//query.setPageSize(cList.getPageSize());
		
		//直接返回页面
		this.putRootMap("pg", cList);
		return "list";
		
	}
	
	
	
	public String deleteByIds(){
		
		log.info("批量删除 客户======>"+query.getIds());
		
		customerService.deleteByIds(query.getIds());
		
		return SUCCESS;
	}
	
	
	//客户编辑
	public String edit(){
		log.info("客户的ID值："+customer.getCustId());
		//获取客户
		Customer cust = customerService.findById(customer.getCustId());
		
		//把客户丢到值栈中
		//this.putRootMap("c", cust);
		this.putRoot(cust);
		
		return INPUT;
	}
	
	
	private Long[] idsArray;
	public Long[] getIdsArray() {
		return idsArray;
	}
	public void setIdsArray(Long[] idsArray) {
		this.idsArray = idsArray;
	}


	//普通属性驱动封装其他参数<s:property value="query.curPage"/>   取值
	//表单：     curPage    :     <input type="text" name="query.curPage"/>  设值
	private CustomerQuery query = new CustomerQuery();
	public CustomerQuery getQuery() {
		return query;
	}
	public void setQuery(CustomerQuery query) {
		this.query = query;
	}

	//模型驱动封装参数
	//表单：     custName    :     <input type="text" name="cusName"/>
	private Customer customer = new Customer();
	@Override
	public Customer getModel() {
		return customer;
	}

}
