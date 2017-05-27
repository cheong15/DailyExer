package gz.itheima.itheimacrm.test;

import gz.it.pratice.entity.User;
import gz.it.pratice.service.UserService;
import gz.it.pratice.util.MD5Util;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/applicationContext.xml"})
public class Test2 {
	
	@Resource(name="userService")
	private UserService userService;
	
	@Test
	public void run1(){
		
		User user = new User();
		user.setUser_code("t001");
		user.setUser_name("成海");
		user.setUser_password(MD5Util.powerfulMd5("123456"));
		user.setUser_state("1");
		
		userService.save(user);
		
	}

}
