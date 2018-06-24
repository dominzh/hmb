package buyer.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import buyer.domain.Buyer;
import cn.zhku.jdbc.TxQueryRunner;

/**
 * 买家持久层
 * 
 * @author bx
 * 
 */
public class BuyerDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 按bid和password查询
	 * 
	 * @throws SQLException
	 */
	public boolean findByBidAndPassword(String bid, String password)
			throws SQLException {
		String sql = "select count(1) from buyer where bid=? and loginpass=?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), bid,
				password);
		return number.intValue() > 0;
	}

	/**
	 * 修改密码
	 * @throws SQLException 
	 */
	public void updatePassword(String bid, String password) throws SQLException {
		String sql = "update buyer set loginpass=? where bid =?";
		qr.update(sql, password, bid);
	}

	/**
	 * 按用户名和密码查询
	 * 
	 * @param loginname
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public Buyer findByLoginnameAndLoginpass(String loginname, String password)
			throws SQLException {
		String sql = "select * from buyer where loginname = ? and loginpass = ?";

		return qr.query(sql, new BeanHandler<Buyer>(Buyer.class), loginname,
				password);
	}
	

	
	/**
	 * 通过激活码查询用户
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Buyer findByCode(String code) throws SQLException {
		String sql = "select * from buyer where activationCode = ?";
		return qr.query(sql, new BeanHandler<Buyer>(Buyer.class), code);
	}

	/**
	 * @param bid
	 * @param status
	 * @throws SQLException
	 */
	public void updateStatus(String bid, boolean status) throws SQLException {
		String sql = "update buyer set status = ? where bid = ?";
		qr.update(sql, status, bid);
	}
	
	/**
	 * 校验用户名是否注册
	 * 
	 * @param loginname
	 * @return
	 * @throws SQLException
	 */
	
	public boolean ajaxValidateLoginname(String loginname) throws SQLException {
		String sql = "select count(1) from buyer where loginname = ?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), loginname);
		return number.intValue() == 0;
	}
	
	/**
	 * 校验Email是否注册
	 * 
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidateEmail(String email) throws SQLException {
		String sql = "select count(1) from buyer where email = ?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), email);
		return number.intValue() == 0;
	}
	
	/**
	 * 校验手机号码是否注册
	 * 
	 * @param loginname
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidatePhone(String phone) throws SQLException {
		String sql = "select count(1) from buyer where phone = ?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), phone);
		return number.intValue() == 0;
	}
	
	/**
	 * 添加用户
	 * @param buyer
	 * @throws SQLException
	 */
	public void add(Buyer buyer) throws SQLException {
		String sql = "insert into buyer values(?,?,?,?,?,?,?,?,?)";
		Object[] params = { buyer.getBid(), buyer.getLoginname(),
				buyer.getLoginpass(), buyer.getEmail(), buyer.getPhone(),
				buyer.getAddress(), buyer.isStatus(), buyer.getActivationCode(),null };
		qr.update(sql,params);
	}
}
