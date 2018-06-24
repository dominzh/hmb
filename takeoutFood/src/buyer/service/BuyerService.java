package buyer.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import buyer.dao.BuyerDao;
import buyer.domain.Buyer;
import buyer.service.exception.BuyerException;
import cn.zhku.commons.CommonUtils;
import cn.zhku.mail.Mail;
import cn.zhku.mail.MailUtils;
/**
 * 买家业务层
 * @author bx
 *
 */
public class BuyerService {
	private BuyerDao buyerDao = new BuyerDao();

	/**
	 * 修改密码
	 * @throws BuyerException 
	 */
	public void updatePassword(String uid, String newPass, String oldPass) throws BuyerException {
		try {
			/**
			 * 1.校验初始密码
			 */
			boolean bool = buyerDao.findByBidAndPassword(uid, oldPass);
			if(!bool){//如果初始密码错误
				throw new BuyerException("初始密码错误！");
			}
			/**
			 * 2.修改密码
			 */
			buyerDao.updatePassword(uid, newPass);
		} catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 登录功能
	 * @param buyer
	 * @return
	 */
	public Buyer login(Buyer user){
		try {
			return buyerDao.findByLoginnameAndLoginpass(user.getLoginname(),user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 激活功能
	 * @param code
	 */
	public void activation(String code) throws BuyerException{
		/**
		 * 1.通过激活码查询用户
		 * 2.如果User为null，说明是无效激活码，抛出异常，给出异常信息（无效激活码）
		 * 3.查看用户状态是否为true，如果为true，抛出异常，给出异常信息（请不要重复激活）
		 * 4.修改用户状态为true
		 */
		Buyer buyer;
		
			try {
				buyer = buyerDao.findByCode(code);
				if (buyer == null)
					throw new BuyerException("无效激活码");
				if(buyer.isStatus())
					throw new BuyerException("您已经激活过了，不要二次激活");
				buyerDao.updateStatus(buyer.getBid(), true);//修改状态
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
	}
	
	/**
	 * 校验用户名是否注册
	 * @param loginname
	 * @return 
	 * @throws SQLException 
	 */
	public boolean ajaxValidateLoginname(String loginname) {
		try {
			return buyerDao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			 throw new RuntimeException(e);
		}
	}
	/**
	 * 校验Email是否注册
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidateEmail(String email) {
		try {
			return buyerDao.ajaxValidateEmail(email);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 校验手机是否注册
	 * @param phone
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidatePhone(String phone) {
		try {
			return buyerDao.ajaxValidatePhone(phone);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 注册功能
	 */
	public void regist(Buyer buyer){
		/**
		 * 1.数据的补齐
		 */
		buyer.setBid(CommonUtils.uuid());
		buyer.setStatus(false);
		buyer.setActivationCode(CommonUtils.uuid()+CommonUtils.uuid());
		/**
		 * 2.向数据库插入
		 */
		try {
			buyerDao.add(buyer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e); 
		}
		
	}
}
