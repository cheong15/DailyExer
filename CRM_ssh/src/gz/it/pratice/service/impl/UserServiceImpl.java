package gz.it.pratice.service.impl;

import java.util.List;

import gz.it.pratice.dao.UserDao;
import gz.it.pratice.entity.User;
import gz.it.pratice.exception.LoginFailException;
import gz.it.pratice.service.UserService;
import gz.it.pratice.util.MD5Util;

/**
 * @类描述：    用户业务层类
 * 
 * @项目名：itheimacrm
 * @类全名：gz.itheima.itheimacrm.service.impl.UserServiceImpl
 * @创建人： Johnny.Chen 
 * @创建时间： 2017年5月20日 上午10:34:09 
 * @修改人：
 * @修改时间：
 */
public class UserServiceImpl implements UserService {
	
	//注入dao
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	/**
	 * 用户保存
	 */
	public void save(User user) {
		//把明文的密码加密：24次MD5加密
		user.setUser_password(MD5Util.powerfulMd5(user.getUser_password()));
		userDao.save(user);
	}


	/**
	 * 查询所有用户
	 */
	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}


	@Override
	public User login(User user) throws LoginFailException {
		
		List<User> ulist = userDao.findByHql("from User where user_code=?", user.getUser_code());
		//如果存在用户则判断是否一致
		if(ulist!=null&&ulist.size()>0){
			//把明文的密码转成md5密码
			String md5Pwd = MD5Util.powerfulMd5(user.getUser_password());
			//这个u是从数据库取出的
			User u = ulist.get(0);
			if(!u.getUser_password().equals(md5Pwd)){
				throw new LoginFailException("用户密码出错");
			}
			//判断用户的状态
			if("0".equals(u.getUser_state())){
				throw new LoginFailException("用户已被锁定，请联系管理员！");
			}
			
			return u;
		}
		//不存在用户的情况下
		else{
			throw new LoginFailException("用户不存在");
		}
		
	}

}
