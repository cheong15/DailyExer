package gz.it.pratice.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * @类描述：  客户模块的持久化类 （一方）
 * 
 */
public class Customer implements java.io.Serializable {

	private Long custId;
	private String custName;
	private String custSource;
	private String custIndustry;
	private String custLevel;
	private String custPhone;
	private String custMobile;
	//private Set cstLinkmans = new HashSet(0);
	//处理一对多的关系: 最好是先new
	private Set<Linkman> linkmans = new HashSet<Linkman>();

	public Set<Linkman> getLinkmans() {
		return linkmans;
	}
	public void setLinkmans(Set<Linkman> linkmans) {
		this.linkmans = linkmans;
	}

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String custName) {
		this.custName = custName;
	}

	/** full constructor */
	public Customer(String custName, String custSource, String custIndustry,
			String custLevel, String custPhone, String custMobile) {
		this.custName = custName;
		this.custSource = custSource;
		this.custIndustry = custIndustry;
		this.custLevel = custLevel;
		this.custPhone = custPhone;
		this.custMobile = custMobile;
	}

	// Property accessors

	public Long getCustId() {
		return this.custId;
	}

	public void setCustId(Long custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return this.custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustSource() {
		return this.custSource;
	}

	public void setCustSource(String custSource) {
		this.custSource = custSource;
	}

	public String getCustIndustry() {
		return this.custIndustry;
	}

	public void setCustIndustry(String custIndustry) {
		this.custIndustry = custIndustry;
	}

	public String getCustLevel() {
		return this.custLevel;
	}

	public void setCustLevel(String custLevel) {
		this.custLevel = custLevel;
	}

	public String getCustPhone() {
		return this.custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public String getCustMobile() {
		return this.custMobile;
	}

	public void setCustMobile(String custMobile) {
		this.custMobile = custMobile;
	}

	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custName=" + custName
				+ ", custSource=" + custSource + ", custIndustry="
				+ custIndustry + ", custLevel=" + custLevel + ", custPhone="
				+ custPhone + ", custMobile=" + custMobile + "]";
	}

	/*public Set getCstLinkmans() {
		return this.cstLinkmans;
	}

	public void setCstLinkmans(Set cstLinkmans) {
		this.cstLinkmans = cstLinkmans;
	}*/
	
	
	

}