package seller.seller.domain;

public class Seller {

	private String sid;// 主键
	private String loginname;// 登录名 店铺名
	private String name;// 姓名
	private String id_card;// 身份证
	private int status=1;//店铺状态：1开启, 2关闭
	private int honour=100;//店铺信用值
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getHonour() {
		return honour;
	}

	public void setHonour(int honour) {
		this.honour = honour;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId_card() {
		return id_card;
	}

	public void setId_card(String id_card) {
		this.id_card = id_card;
	}

}
