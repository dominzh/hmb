package seller.seller.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import buyer.domain.Buyer;
import cn.zhku.jdbc.TxQueryRunner;
import seller.seller.domain.Seller;

/**
 * 卖家持久层
 * @author bx
 *
 */
public class SellerDao {
	private QueryRunner qr = new TxQueryRunner();
	
	/**
	 * 校验用户名是否注册
	 * 
	 * @param loginname
	 * @return
	 * @throws SQLException
	 */
	
	public boolean ajaxValidateLoginname(String loginname) throws SQLException {
		String sql = "select count(1) from seller where loginname = ?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), loginname);
		return number.intValue() == 0;
	}
	
	/**
	 * 校验身份证是否注册
	 * 
	 * @param id_card
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidateId_card(String id_card) throws SQLException {
		String sql = "select count(1) from seller where id_card = ?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), id_card);
		return number.intValue() == 0;
	}
	
	
	/**
	 * 添加用户
	 * @param seller
	 * @throws SQLException
	 */
	public void add(Seller seller) throws SQLException {
		String sql = "insert into seller values(?,?,?,?,?,?)";
		Object[] params = { seller.getSid(), seller.getLoginname(),
				seller.getName(),seller.getId_card(),seller.getStatus(),seller.getHonour()};
		qr.update(sql,params);
	}
	
	/**
	 * 关联买家表
	 * @param sid
	 * @param cid
	 * @throws SQLException
	 */
	public void connectBuyer(String sid,String bid) throws SQLException{
		String sql = "update buyer set sid = ? where bid = ?";
		qr.update(sql,sid,bid);
	}
	
	/**
	 * 进入店铺
	 * @param buyer
	 * @return
	 * @throws SQLException
	 */
	public Seller login(Buyer buyer) throws SQLException{
		String sql = "select * from seller where sid =?";
		return qr.query(sql, new BeanHandler<Seller>(Seller.class),buyer.getSid());
	}
	
	/**
	 * 获取店铺信誉
	 * @param loginname
	 * @return
	 * @throws SQLException
	 */
	public int getHonuer(String loginname) throws SQLException{
		String sql = "select honour from seller where loginname =?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), loginname);
		return number.intValue();
	}
	
	/**
	 * 修改店铺信誉
	 * @param loginname
	 * @return
	 * @throws SQLException
	 */
	public void updateHonuer(int newhonour,String loginname) throws SQLException{
		String sql = "update seller set honour = ? where loginname = ?";
		qr.update(sql, newhonour,loginname);		
	}
	
	/**
	 * 载入所有店铺
	 * @param buyer
	 * @return
	 * @throws SQLException
	 */
	public List<Seller> loginAll() throws SQLException{
		String sql = "select * from seller order by honour asc";
		return qr.query(sql, new BeanListHandler<Seller>(Seller.class));
	}
	
	/*
	 * 开店
	 */
	
	public void open(String sid) throws SQLException{
		String sql = "update seller set status = '1' where sid = ?";
		qr.update(sql,sid);
	}
	
	/*
	 * 关店
	 */
	
	public void close(String sid) throws SQLException{
		String sql = "update seller set status = '0' where sid = ?";
		qr.update(sql,sid);
	}
	
}


