package seller.seller.service;


import java.sql.SQLException;
import java.util.List;

import buyer.domain.Buyer;
import cn.zhku.commons.CommonUtils;
import seller.seller.dao.SellerDao;
import seller.seller.domain.Seller;

/**
 * 卖家业务层
 * @author bx
 *
 */
public class SellerService {

	private SellerDao sellerDao = new SellerDao();
	
	/**
	 * 校验用户名是否注册
	 * @param loginname
	 * @return 
	 * @throws SQLException 
	 */
	public boolean ajaxValidateLoginname(String loginname) {
		try {
			return sellerDao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			 throw new RuntimeException(e);
		}
	}
	
	/**
	 * 校验id_card是否注册
	 * @param id_card
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidateId_card(String id_card) {
		try {
			return sellerDao.ajaxValidateId_card(id_card);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
		
	
	/**
	 * 注册功能
	 */
	public void regist(Seller seller,Buyer buyer){
		/**
		 * 1.数据的补齐
		 */
		seller.setSid(CommonUtils.uuid());
		
		/**
		 * 2.向数据库插入
		 */
		try {
			sellerDao.add(seller);
			sellerDao.connectBuyer(seller.getSid(), buyer.getBid());
		} catch (SQLException e) {
			throw new RuntimeException(e); 
		}
		
	}
	
	public Seller login(Buyer buyer){
		try {
			return sellerDao.login(buyer);
		} catch (SQLException e) {
			throw new RuntimeException(e); 
		}
	}
	
	public int getHonuer(String loginname){
		try {
			return sellerDao.getHonuer(loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e); 
		}
	}
	
	public void updateHonuer(int newhonour,String loginname){
		try {
			sellerDao.updateHonuer(newhonour,loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e); 
		}
	}
	
	public List<Seller> loginAll(){
		try {
			return sellerDao.loginAll();
		} catch (SQLException e) {
			throw new RuntimeException(e); 
		}
	}
	
	public void open(String sid){
		try {
			sellerDao.open(sid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void close(String sid){
		try {
			sellerDao.close(sid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
