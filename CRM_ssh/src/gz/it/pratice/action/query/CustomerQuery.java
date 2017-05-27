package gz.it.pratice.action.query;

public class CustomerQuery {
	
	private Integer curPage;//从页面传过来的
	private Integer pageSize;//每页多少条
	
	
	//加上页面的查询参数
	private String custSource;//来源
	private String custIndustry;//所属行业
	private String custLevel;//客户级别
	
	private String keyWord;//关键字
	
	
	private String ids;//批量删除的id字符串，以逗号隔开
	
	
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getCustSource() {
		return custSource;
	}
	public void setCustSource(String custSource) {
		this.custSource = custSource;
	}
	public String getCustIndustry() {
		return custIndustry;
	}
	public void setCustIndustry(String custIndustry) {
		this.custIndustry = custIndustry;
	}
	public String getCustLevel() {
		return custLevel;
	}
	public void setCustLevel(String custLevel) {
		this.custLevel = custLevel;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
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
	@Override
	public String toString() {
		return "CustomerQuery [curPage=" + curPage + ", pageSize=" + pageSize
				+ ", custSource=" + custSource + ", custIndustry="
				+ custIndustry + ", custLevel=" + custLevel + ", keyWord="
				+ keyWord + "]";
	}
	
	
	
	
	

}
