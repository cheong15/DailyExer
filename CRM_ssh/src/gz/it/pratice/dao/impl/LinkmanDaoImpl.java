package gz.it.pratice.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;

import gz.it.pratice.dao.LinkmanDao;
import gz.it.pratice.entity.Linkman;

//联系人的DAO
public class LinkmanDaoImpl implements LinkmanDao {
	//注入ht模板
	private HibernateTemplate ht;
	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	/**
	 * 保存联系人
	 */
	public void save(Linkman lkm) {
		ht.save(lkm);
	}


	/**
	 * 查询联系人
	 */
	public List<Linkman> findAll() {
		return ht.loadAll(Linkman.class);
	}

	
	
	/**
	 * 查询分页数据
	 */
	@Override
	public List<Linkman> findByPage(final Integer pageSize,final Integer curPage,final String keyword) {
		
		//通过原生的Hibernate的api完成分页
		return ht.execute(new HibernateCallback<List<Linkman>>() {
			@Override
			public List<Linkman> doInHibernate(Session session) throws HibernateException {
				//创建hql的query对象
				
				String condition = "from Linkman where 1=1 ";
				
				if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)){
					condition  += " and (lkm_name like ? or lkm_gender like ? "
							+ " or lkm_mobile like ? "
							+ " or lkm_email like ? "
							+ " or lkm_position like ? "
							+ " or lkm_memo like ?) ";
				}
				
				//传入的参数，与?的个数一致
				String keyword2 = "%"+keyword+"%";
				String[] value = {keyword2,keyword2,keyword2,keyword2,keyword2,keyword2};
				
				Query query = session.createQuery(condition);
				if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)){
					for(int i=0;i<value.length;i++){
						query.setParameter(i, value[i]);
					}
				}
				query.setFirstResult((curPage-1)*pageSize);//查起始行： 算法固定:  (curPage-1)*pageSize
				query.setMaxResults(pageSize);//总共查询几行
				//这里一定要返回数据
				return query.list();
			}
		});
	}

	/**
	 * 获取总记录数据
	 */
	@Override
	public Integer findByDataCount(final String keyword) {
		
		return ht.execute(new HibernateCallback<Integer>() {

			@Override
			public Integer doInHibernate(Session session) throws HibernateException {
				
				//条件的封装
				String condition = "select count(l) from Linkman l where 1=1 ";
				
				//这里有个坑1
				if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)){
					condition  += " and ( lkm_name like ? or lkm_gender like ? "
							+ " or lkm_mobile like ? "
							+ " or lkm_email like ? "
							+ " or lkm_position like ? "
							+ " or lkm_memo like ? ) ";
				}
				
				//传入的参数，与?的个数一致
				String keyword2 = "%"+keyword+"%";
				String[] value = {keyword2,keyword2,keyword2,keyword2,keyword2,keyword2};
				
				Query query = session.createQuery(condition);
				//这里有个坑2
				if(keyword!=null && !"".equals(keyword) && !"null".equals(keyword)){
					for(int i=0;i<value.length;i++){
						query.setParameter(i, value[i]);
					}
				}
				
				return ((Long)query.uniqueResult()).intValue();
			}
		});
	}

}
