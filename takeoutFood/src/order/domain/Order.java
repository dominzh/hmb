package order.domain;

import java.util.List;

import buyer.domain.Buyer;

public class Order {

	private String oid;//主键
	private String ordertime;//下单时间
	private double total;//总计
	private String address;//收货地址
	private String phone;//手机
	private Buyer owner;//订单的所有者	
	private List<OrderItem> orderItemList;
	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Buyer getOwner() {
		return owner;
	}
	public void setOwner(Buyer owner) {
		this.owner = owner;
	}
	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}
	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	
	
}
