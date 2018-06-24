package admin.admin.dao;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import admin.admin.domain.Admin;
import cn.zhku.jdbc.TxQueryRunner;
public class AdminDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 通过管理员登录名和登录密码查询
	 * @param adminname
	 * @param adminpwd
	 * @return
	 * @throws SQLException
	 */
	public Admin find(String adminname, String adminpwd) throws SQLException  {
		String sql = "select * from admin where adminname = ? and adminpwd =  ?";
		return qr.query(sql, new BeanHandler<Admin>(Admin.class),adminname,adminpwd);
	}

}
