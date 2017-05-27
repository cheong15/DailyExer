package gz.it.pratice.service.impl;

import java.util.List;

import gz.it.pratice.dao.LinkmanDao;
import gz.it.pratice.entity.Linkman;
import gz.it.pratice.service.LinkmanService;

//联系人业务层实现来
public class LinkmanServiceImpl implements LinkmanService{
	
	//1、注入dao
	private LinkmanDao linkmanDao;
	public void setLinkmanDao(LinkmanDao linkmanDao) {
		this.linkmanDao = linkmanDao;
	}


	/**
	 * 保存联系人
	 */
	public void save(Linkman man) {
		linkmanDao.save(man);
	}
	
	/**
	 * 联系人的查询
	 */
	public List<Linkman> findAll() {
		List<Linkman> linkmanList = linkmanDao.findAll();
		//在service调用关联数据，在这一层调用，session没有关闭，所以不会报错
		//System.out.println(linkmanList.get(0).getCustomer().getCustName());
		return linkmanList;
	}


	/**
	 * 查找出分页数据
	 */
	public List<Linkman> findByPage(Integer pageSize, Integer curPage,String keyWord) {
		return linkmanDao.findByPage(pageSize,curPage,keyWord);
	}


	/**
	 * 查询出总记录数
	 */
	@Override
	public Integer findCountData(String keyword) {
		return linkmanDao.findByDataCount(keyword);
	}

}
