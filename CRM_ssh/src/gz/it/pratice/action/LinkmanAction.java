package gz.it.pratice.action;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;

import gz.it.pratice.base.BaseAction;
import gz.it.pratice.entity.Customer;
import gz.it.pratice.entity.Linkman;
import gz.it.pratice.service.CustomerService;
import gz.it.pratice.service.LinkmanService;

public class LinkmanAction extends BaseAction implements ModelDriven<Linkman>{
	
	//注入客户模块的service，为了获取所有的客户
	private CustomerService customerService;
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	//注入联系人的service
	private LinkmanService linkmanService;
	public void setLinkmanService(LinkmanService linkmanService) {
		this.linkmanService = linkmanService;
	}
	
	//=================================================================================
	//===========================            联系人查询开始             ============================
	//=================================================================================
	
	//普通属性驱动封装数据
	private Integer pageSize;//每页多少条数据
	private Integer curPage;//当前页
	//一定要提供setter的方法
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}
	
	//普通属性驱动封装关键字参数
	private String keyWord;
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	
	/**
	 * 二、联系人查询：分页
	 * @return 
	 */
	public String list(){
		
		if(pageSize==null){
			pageSize = 2;//每页两条数据
		}
		
		if(curPage==null){
			curPage = 1;//默认第一页
		}
		
		//调试关键字
		
		/*
		 * 
		 * 
		 * 如果get请求有乱码的话，用urldecode
	Jsp页面：
	
	下面是javacripe的编码
    var keyWord = document.getElementById("keyWord").value;
    keyWord = encodeURIComponent(encodeURIComponent(keyWord));
    window.location.href='xxxaction?serchName='+keyWord;
	
	
	

Action中：
    serchName = java.net.URLDecoder.decode(serchName, "UTF-8");

		 */
		System.out.println(keyWord);
		
		//1、调用service的方法查询出来联系人:传入分页参数
		//查询出分页数据
		List<Linkman> linkmanList = linkmanService.findByPage(pageSize,curPage,keyWord);
		//查询出总记录数据
		Integer totalCount = linkmanService.findCountData(keyWord);
		
		
		
		
		//2、把数据放入值栈中，去到jsp页面迭代
		//当前页数据
		this.putRootMap("linkmanList", linkmanList);
		//总记录数
		this.putRootMap("totalCount", totalCount);
		
		
		//3、回传分页的数据
		//算出总页数: 总记录数与每页多少条去模 ，如果除得尽：总记录数除以每页多少条；否则 加一。
		Integer totalPage = totalCount%pageSize==0?totalCount/pageSize:(totalCount/pageSize)+1;
		
		this.putRootMap("pageSize", pageSize);//每页多少条
		this.putRootMap("curPage", curPage);//当前页
		
		this.putRootMap("prePage", curPage-1==0?1:curPage-1);//上一页: 当前页减去一，如果为零，代表是第一页
		this.putRootMap("nextPage", totalPage==curPage?curPage:curPage+1);//下一页： 与总页数有关，如果与当页一致，那么下一页就是当前页，反之，则当前页加一
		
		this.putRootMap("totalPage", totalPage);
		
		return "list";
	}

	/**
	 * 一、联系人查询： 全表查询
	 * @return 
	 */
	/*public String list(){
		
		//1、调用service的方法查询出来联系人
		List<Linkman> linkmanList = linkmanService.findAll();
		
		//获取关联数据的值
		//System.out.println(linkmanList.get(0).getCustomer().getCustName());
		
		//2、把数据放入值栈中，去到jsp页面迭代
		this.putRootMap("linkmanList", linkmanList);
		
		return "list";
	}*/
	
	
	
	
	
	
	//=================================================================================
	//===========================            联系人查询结束             ============================
	//=================================================================================
	

	/**
	 * 去到新增联系人的页面
	 * @return 
	 */
	public String toAdd(){
		//获取所有联系人
		List<Customer> cusList = customerService.findAll();
		this.putContext("cusList", cusList);
		return "toAdd";
	}
	
	public String add(){
		this.log.info("封装联系人表单信息===>"+linkman);
		
		//保存的业务方法
		linkmanService.save(linkman);
		
		//添加回显的成功信息
		this.putContext("msg", "恭喜：新增联系人成功！！！！");
		
		return SUCCESS;
	}
	
	
	//模型驱动封装表单数据
	private Linkman linkman = new Linkman();
	public Linkman getModel() {
		return linkman;
	}

}
