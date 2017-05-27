package gz.it.pratice.action;

import gz.it.pratice.base.BaseAction;
import gz.it.pratice.entity.User;
import gz.it.pratice.exception.LoginFailException;
import gz.it.pratice.service.UserService;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends BaseAction implements ModelDriven<User>{
	
	private static final long serialVersionUID = 742594482690255628L;
	
	//注入user的业务模块
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	 * 用户添加
	 */
	public String add(){
		//日志的打印，没有日志，我用使用：System.out.println("用户添加......");
		this.log.info("用户添加......");
		
		userService.save(user);
		/*ActionContext context = ActionContext.getContext();
		context.put("msg", "恭喜：新增用户成功！");*/
		//调用baseAction中的方法
		this.putContext("msg", "恭喜：新增用户成功！");
		return SUCCESS;
	}
	
	/**
	 * 用户列表
	 * @return 
	 */
	public String list(){
		//日志的打印，没有日志，我用使用：System.out.println("用户查询......");
		this.log.info("用户查询......");
		//查询所有用户
		List<User> uList = userService.findAll();
		//保存用户到值栈中
		/*ValueStack vs = ActionContext.getContext().getValueStack();
		vs.set("uList", uList);*/
		//调用baseAction中的方法
		this.putRootMap("uList", uList);
		return "list";
	}
	
	
	public String login(){
		//System.out.println(user);
		this.log.info(user);
		try {
			User u = userService.login(user);
			this.putContextSession(USER_IN_SESSION, u);
		} catch (LoginFailException e) {
			e.printStackTrace();
			this.putContext("loginFailMsg", e.getMessage());
			return "login";
		}
		
		return "main";
	}
	
	
	public String index(){
		//ActionContext.getContext().getSession().get(USER_IN_SESSION);
		return "index";
	}
	
	
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}

}
