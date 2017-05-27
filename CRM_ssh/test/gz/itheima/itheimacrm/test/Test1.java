package gz.itheima.itheimacrm.test;

import gz.it.pratice.entity.Customer;
import gz.it.pratice.entity.Linkman;
import gz.it.pratice.service.CustomerService;
import gz.it.pratice.service.LinkmanService;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @类描述： 测试联系人模块
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext.xml"})
public class Test1 {
	
	@Resource(name="linkmanService")
	private LinkmanService linkmanService;
	
	@Resource(name="customerService")
	private CustomerService customerService;
	
	//测试联系人新增
	@Test
	public void run1(){
		
		Customer customer = customerService.findById(42L);
		
		Linkman lm = new Linkman();
		lm.setLkm_name("小凤男朋友");
		lm.setLkm_gender("男");
		lm.setLkm_phone("1111111");
		lm.setLkm_position("主播");
		lm.setCustomer(customer);//外键维护
		
		linkmanService.save(lm);
		
	}

}
