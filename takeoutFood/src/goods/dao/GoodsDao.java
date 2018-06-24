package goods.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import category.domain.Category;
import cn.zhku.commons.CommonUtils;
import cn.zhku.jdbc.TxQueryRunner;
import goods.domain.Goods;
import paper.Expression;
import paper.PageBean;
import paper.PageConstants;

public class GoodsDao {

	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 删除商品
	 * 
	 * @param gid
	 * @throws SQLException
	 */
	public void delete(String gid) throws SQLException {
		String sql = "delete from dishes where gid=?";
		qr.update(sql, gid);
	}

	/**
	 * 修改菜品
	 * 
	 * @param dishes
	 * @throws SQLException
	 */
	public void edit(Goods goods) throws SQLException {
		String sql = "update dishes set gname=?,cid=?,gbrand=?,"
				+ "price=?,place=?,`describe`=? where gid=?";
		Object[] params = { goods.getGname(), goods.getCategory().getCid(),
				goods.getGbrand(),goods.getPrice(), goods.getPlace(), 
				goods.getDescribe(),goods.getGid() };
		qr.update(sql, params);
	}

	/**
	 * 按gid查询
	 * 
	 * @param gid
	 * @return
	 * @throws SQLException
	 */
	public Goods findByGid(String gid) throws SQLException {
		String sql = "select * from dishes g,category c where g.cid=c.cid and g.gid = ?";
		// 一行记录中，包含了很多的goods的属性，还有一个cid属性
		Map<String, Object> map = qr.query(sql, new MapHandler(), gid);
		// 把Map中除了cid以外的其他属性映射到Goods对象中
		Goods goods = CommonUtils.toBean(map, Goods.class);
		// 把Map中cid属性映射到Category中，即这个Category只有cid
		Category category = CommonUtils.toBean(map, Category.class);
		// 两者建立关系
		goods.setCategory(category);

		// 把pid获取出来，创建一个Category parent，把pd赋给它，然后再把parent赋值给category
		if (map.get("pid") != null) {
			Category parent = new Category();
			parent.setCid((String) map.get("pid"));
			category.setParent(parent);
		}
		return goods;
	}

	/**
	 * 查询指定分类下商品的个数
	 * 
	 * @param gid
	 * @return
	 * @throws SQLException
	 */
	public int findGoodsCountByCategory(String cid) throws SQLException {
		String sql = "select count(*) from dishes where cid=?";
		Number cnt = (Number) qr.query(sql, new ScalarHandler(), cid);
		return cnt == null ? 0 : cnt.intValue();
	}

	/**
	 * 按分类查询
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByCategory(String cid,String status, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cid", "=", cid));
		return findByCriteria2(exprList,status, pc);
	}
	
	/**
	 * 按分类和商家查询
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByCategoryBySeller(String shopname,String status,String cid, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("cid", "=", cid));
		exprList.add(new Expression("shopname", "=", shopname));
		return findByCriteria2(exprList,status, pc);
	}


	/**
	 * 按商品名模糊查询
	 * 
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByGname(String gname,String status, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("gname", "like", "%" + gname + "%"));
		return findByCriteria2(exprList,status, pc);
	}

	/**
	 * 查询店铺所有商品
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findAllGoodsBySeller(String shopname,String status,int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("shopname", "=", shopname));
		return findByCriteria2(exprList,status, pc);
	}
	
	/**
	 * 查询所有商品
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findAllGoods(String status,int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		return findByCriteria2(exprList,status, pc);
	}
	
	/**
	 * 按产地查
	 * 
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByPlace(String place, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("place", "like", "%" + place + "%"));
		return findByCriteria(exprList, pc);
	}
	

	/**
	 * 统计排序功能
	 * 
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByCriteria2(List<Expression> exprList, String status,int pc)
			throws SQLException {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		
		int ps = PageConstants.GOODS_PAGE_SIZE;// 每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder("  where shopname in (select loginname from seller where status ='1')");
		List<Object> params = new ArrayList<Object>();// SQL中有问号，它是对应问号的值
		for (Expression expr : exprList) {
			/*
			 * 添加一个条件上， 1) 以and开头 2) 条件的名称 3) 条件的运算符，可以是=、!=、>、< ... is null，is
			 * null没有值 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" and ").append(expr.getName()).append(" ")
					.append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if (!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数
		 */
		String sql = "select count(*) from dishes" + whereSql;
		
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();// 得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		String orderBy="score desc";
		if(status.equals("1")){
			orderBy="price desc";
		}else if(status.equals("2")){
			orderBy="price asc";
		}
		sql = "select * from dishes" + whereSql + " order by "+ orderBy +" limit ?,?";
		params.add((pc - 1) * ps);// 当前页首行记录的下标
		params.add(ps);// 一共查询几行，就是每页记录数

		List<Goods> beanList = qr.query(sql, new BeanListHandler<Goods>(
				Goods.class), params.toArray());
		for (Goods goods : beanList) {
			loadCategory(goods);
		}
	
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Goods> pb = new PageBean<Goods>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}

	/**
	 * 按店铺
	 * 
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByShop(String shopname, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("shopname", "like", "%" + shopname + "%"));
		return findByCriteria(exprList, pc);
	}

	/**
	 * 多条件组合查询
	 * 
	 * @param combination
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Goods> findByCombination(Goods criteria,String status, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("gname", "like", "%" + criteria.getGname()
				+ "%"));
		exprList.add(new Expression("place", "like", "%" + criteria.getPlace()
				+ "%"));
		exprList.add(new Expression("shopname", "like", "%"
				+ criteria.getSeller().getLoginname() + "%"));
		return findByCriteria2(exprList, status,pc);
	}

	
	/**
	 * 通用的查询方法
	 * 
	 * @param exprList
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	private PageBean<Goods> findByCriteria(List<Expression> exprList, int pc)
			throws SQLException {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.GOODS_PAGE_SIZE;// 每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder("  where shopname in (select loginname from seller where status ='1')");
		List<Object> params = new ArrayList<Object>();// SQL中有问号，它是对应问号的值
		for (Expression expr : exprList) {
			/*
			 * 添加一个条件上， 1) 以and开头 2) 条件的名称 3) 条件的运算符，可以是=、!=、>、< ... is null，is
			 * null没有值 4) 如果条件不是is null，再追加问号，然后再向params中添加一与问号对应的值
			 */
			whereSql.append(" and ").append(expr.getName()).append(" ")
					.append(expr.getOperator()).append(" ");
			// where 1=1 and bid = ?
			if (!expr.getOperator().equals("is null")) {
				whereSql.append("?");
				params.add(expr.getValue());
			}
		}

		/*
		 * 3. 总记录数
		 */
		String sql = "select count(*) from dishes" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();// 得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from dishes" + whereSql + " order by orderBy limit ?,?";
		params.add((pc - 1) * ps);// 当前页首行记录的下标
		params.add(ps);// 一共查询几行，就是每页记录数

		List<Goods> beanList = qr.query(sql, new BeanListHandler<Goods>(
				Goods.class), params.toArray());
		for (Goods goods : beanList) {
			loadCategory(goods);
		}

		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Goods> pb = new PageBean<Goods>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);

		return pb;
	}

	private void loadCategory(Goods goods) throws SQLException {
		String sql = "select cid from dishes where gid= ?";
		Map<String, Object> map = qr.query(sql, new MapHandler(),goods.getGid());
		Category category = CommonUtils.toBean(map, Category.class);
		goods.setCategory(category);
	}

	/**
	 * 添加图书
	 * 
	 * @param book
	 * @throws SQLException
	 */
	public void add(Goods goods) throws SQLException {
		String sql = "insert into dishes(gid,gname,cid,shopname,gbrand,"
				+ "price,place,`describe`,image_s,image_b,score)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { goods.getGid(), goods.getGname(),
				goods.getCategory().getCid(), goods.getShopname(),
				goods.getGbrand(), goods.getPrice(), goods.getPlace(),
				goods.getDescribe(), goods.getImage_s(), goods.getImage_b(),goods.getScore() };
		qr.update(sql, params);
	}
	
	/**
	 * 更新商品评分平均值
	 * @param score
	 * @throws SQLException 
	 */
	public void updateScore(float score , String gname) throws SQLException{
		String sql = "update dishes set score = ? where gname = ?";
		qr.update(sql,score,gname);
	}
}
