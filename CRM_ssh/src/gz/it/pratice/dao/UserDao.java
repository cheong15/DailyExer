package gz.it.pratice.dao;

import java.util.List;

import gz.it.pratice.entity.User;

/**
 * @类描述：  用户模块
 * 
 * @项目名：itheimacrm
 * @类全名：gz.itheima.itheimacrm.dao.UserDao
 * @创建人： Johnny.Chen 
 * @创建时间： 2017年5月20日 上午10:29:44 
 * @修改人：
 * @修改时间：
 */
public interface UserDao {
	
	//新增用户
	public void save(User user);
	
	//查询所有用户
	public List<User> findAll();
	
	public List<User> findByHql(String hql, Object ... arg);

}
