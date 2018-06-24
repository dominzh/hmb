package goods.domain;

import category.domain.Category;
import seller.seller.domain.Seller;

public class Goods {

	private String gid;//主键
	private String gname;//商品名称
	private Category category;//商品所属分类
	private Seller seller;//卖家
	private String gbrand;//品牌
	private double price;//价格
	private String place; //产地
	private String describe; //描述
	private String image_s; //小图
	private String image_b; //大图
	private String shopname;//店家名字
	private float score;//商品评分
	
	
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public String getGbrand() {
		return gbrand;
	}
	public void setGbrand(String gbrand) {
		this.gbrand = gbrand;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getImage_s() {
		return image_s;
	}
	public void setImage_s(String image_s) {
		this.image_s = image_s;
	}
	public String getImage_b() {
		return image_b;
	}
	public void setImage_b(String image_b) {
		this.image_b = image_b;
	}

	
}
