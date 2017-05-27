package gz.it.pratice.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import gz.it.pratice.dao.UserDao;
import gz.it.pratice.entity.User;

/**
 * @类描述：   用户dao的实现类
 * 
 * @项目名：itheimacrm
 * @类全名：gz.itheima.itheimacrm.dao.impl.UserDaoImpl
 * @创建人： Johnny.Chen 
 * @创建时间： 2017年5月20日 上午10:31:08 
 * @修改人：
 * @修改时间：
 */
public class UserDaoImpl implements UserDao{
	
	//注入hibernateTemplate
	private HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	/**
	 * 用户保存
	 */
	public void save(User user) {
		hibernateTemplate.save(user);
	}
	
	/**
	 * 查询所有用户
	 * @return  用户列表
	 */
	public List<User> findAll(){
		//这个是HibernateTemplate中的查询所有的方法
		List<User> loadAll = hibernateTemplate.loadAll(User.class);
		return loadAll;
	}

	
	public List<User> findByHql(String hql, Object... arg) {
		return (List<User>)hibernateTemplate.find(hql, arg);
	}

}
