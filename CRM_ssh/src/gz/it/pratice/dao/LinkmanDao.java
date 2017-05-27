package gz.it.pratice.dao;

import java.util.List;

import gz.it.pratice.entity.Linkman;

public interface LinkmanDao {
	
	/**
	 * 保存联系人
	 * @param lkm 
	 */
	public void save(Linkman lkm);
	
	/**
	 * 查询联系人
	 *  
	 */
	public List<Linkman> findAll();

	/**
	 * 分页查询联系人
	 * @param pageSize
	 * @param curPage
	 * @param keyWord 
	 * @return 
	 */
	public List<Linkman> findByPage(Integer pageSize, Integer curPage, String keyWord);

	/**
	 * 查询出总记录数
	 * @param keyword 
	 * @return 
	 */
	public Integer findByDataCount(String keyword);

}
