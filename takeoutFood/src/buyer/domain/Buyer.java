package buyer.domain;
/**
 * 买家实体类
 * @author bx
 * 属性来源
 * 1.buyer表：因为我们需要把buyer表查询出的数据封装到Buyer对象中
 * 2.该模块所有表单：因为我们需要把表单数据封装到Buyer对象中
 *
 */
public class Buyer {
	private String bid;//主键
	private String loginname;//登录名
	private String loginpass;//登录密码
	private String email;//邮箱
	private String phone;//手机
	private String address;//收货地址
	private boolean status;//状态，true表示已激活，或者未激活
	private String activationCode;//激活码，它是唯一值，即每个用户的激活码是不同的
	private String sid;//店铺的id
	
	//注册表单
	private String reloginpass;//确认密码
	private String verifyCode;//验证码
	
	//修改密码表单
	private String newpass;//新密码

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getLoginpass() {
		return loginpass;
	}

	public void setLoginpass(String loginpass) {
		this.loginpass = loginpass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public String getReloginpass() {
		return reloginpass;
	}

	public void setReloginpass(String reloginpass) {
		this.reloginpass = reloginpass;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	
}
