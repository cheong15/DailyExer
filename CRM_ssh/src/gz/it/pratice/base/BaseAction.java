package gz.it.pratice.base;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

//抽取公用方法
public class BaseAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	//公用日志打印：必须是   protected  
	//protected Logger log = Logger.getLogger(this.getClass());//这里是旧版的log4j
	protected Logger log = LogManager.getLogger(this.getClass());  //使用新版的log4j2
	
	
	public static final String USER_IN_SESSION = "user_in_session";
	
	
	/**
	 * 把数据存入值栈的context的map中
	 * @param key  
	 * @param obj 
	 */
	public void putContext(String key,Object obj){
		log.info("把数据存入了值栈的context的map中.........");
		ActionContext context = ActionContext.getContext();
		context.put(key, obj);
	}
	
	/**
	 * 把数据存入值栈的root的栈顶的map中
	 * @param key
	 * @param obj 
	 */
	public void putRootMap(String key,Object obj){
		log.info("把数据存入值栈的root的栈顶的map中.........");
		ValueStack vs = ActionContext.getContext().getValueStack();
		vs.set(key, obj);
	}
	
	/**
	 * 把对象推到root的栈顶
	 * @param obj 
	 * @ProjectName itheimacrm
	 * @author Johnny 
	 * @date 2017年5月22日 下午5:48:37
	 */
	public void putRoot(Object obj){
		log.info("把数据存入值栈的root的栈顶.........");
		ValueStack vs = ActionContext.getContext().getValueStack();
		vs.push(obj);
	}
	
	
	/**
	 * 把数据存入session中
	 * @param key
	 * @param obj 
	 */
	public void putContextSession(String key ,Object obj){
		ActionContext.getContext().getSession().put(key, obj);
	}
	
	

}
