package gz.it.pratice.service;

import java.util.List;

import gz.it.pratice.entity.User;
import gz.it.pratice.exception.LoginFailException;

public interface UserService {
	
	public void save(User user);
	
	public List<User> findAll();

	//用户登录
	public User login(User user) throws LoginFailException ;

}
