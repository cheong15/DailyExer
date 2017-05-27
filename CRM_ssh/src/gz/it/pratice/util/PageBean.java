package gz.it.pratice.util;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {

	//查询出的当前页的数据
	private List<T> curDataList = new ArrayList<T>();
	
	//当前页
	private Integer curPage;
	//每页显示几条
	private Integer pageSize = 10;
	//总记录数
	private Integer totalCount;
	//总页数
	private Integer totalPage;
	
	
	//上一页
	private Integer prePage;
	
	//下一页
	private Integer nextPage;
	
	//下一页：固定，算出来，跟最后一页有关
	public Integer getNextPage() {
		return this.getTotalPage()-this.getCurPage()==0?this.getTotalPage():this.getCurPage()+1;
	}
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}
	
	//上一页： 固定，我们可以算出来，跟第一页有关
	public Integer getPrePage() {
		return this.getCurPage()-1==0?1:this.getCurPage()-1;
	}
	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}
	
	
	
	public List<T> getCurDataList() {
		return curDataList;
	}
	public void setCurDataList(List<T> curDataList) {
		this.curDataList = curDataList;
	}
	public Integer getCurPage() {
		return curPage;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	
	//总页数:算法固定
	public Integer getTotalPage() {
		return this.getTotalCount()%this.getPageSize()==0
				?this.getTotalCount()/this.getPageSize()
						:this.getTotalCount()/this.getPageSize()+1;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	@Override
	public String toString() {
		return "PageBean [curDataList=" + curDataList + ", curPage=" + curPage
				+ ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", prePage=" + prePage
				+ ", nextPage=" + nextPage + "]";
	}
	
	
	
	
	
	
	
}
