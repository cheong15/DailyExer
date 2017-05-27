package gz.it.pratice.service;

import java.util.List;

import gz.it.pratice.entity.Linkman;

/**
 * @类描述：联系人业务层的接口
 * 
 */
public interface LinkmanService {
	
	/**
	 * 保存联系人的方法
	 * @param man 
	 */
	public void save(Linkman man);

	/**
	 * 查找所有的客户
	 * @return 
	 */
	public List<Linkman> findAll();

	/**
	 * 查询出分页数据
	 * @param pageSize
	 * @param curPage
	 * @param keyWord 
	 * @return 
	 */
	public List<Linkman> findByPage(Integer pageSize, Integer curPage, String keyWord);

	/**
	 * 查询出总记录数据
	 * @return 
	 * @ProjectName itheimacrm
	 * @author Johnny 
	 * @param keyWord 
	 * @date 2017年5月23日 下午4:09:42
	 */
	public Integer findCountData(String keyWord);
}
