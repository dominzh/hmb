package order.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//import javax.enterprise.inject.New;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.zhku.commons.CommonUtils;
import cn.zhku.jdbc.TxQueryRunner;
import goods.domain.Goods;
import order.domain.Order;
import order.domain.OrderItem;
import paper.Expression;
import paper.PageBean;
import paper.PageConstants;

public class OrderDao {
	private QueryRunner qr = new TxQueryRunner();
	
	/**
	 *  评价订单
	 * 
	 * @param oid
	 * @param status
	 * @throws SQLException
	 */
	public void updateAppraise(String orderitemId, int score ,String appraise)
			throws SQLException {
		String sql = "update orderitem set score = ?, appraise = ? where orderItemId =?";
		qr.update(sql, score, appraise ,orderitemId);
	}
	
	/**
	 *获取商品的平均评分
	 * @throws SQLException 
	 */
	public float  getAvgScore(String gname) throws SQLException{
		String sql = "select avg(score) from orderitem where gname=? and score !=1 group by gname";
		Number number = (Number) qr.query(sql, new ScalarHandler() , gname);
		return number.floatValue();
	}

	/**
	 * 
	 * 查询订单状态
	 * @param oid
	 * @return
	 * @throws SQLException
	 */
	public int findStatus(String orderitemId) throws SQLException {
		String sql = "select status from orderitem where orderItemId = ?";
		Number number = (Number) qr.query(sql, new ScalarHandler(), orderitemId);
		return number.intValue();
	}

	/**
	 * 
	 * 查询订单状态
	 * @param oid
	 * @param status
	 * @throws SQLException
	 */
	public void updateStatus(String orderitemId, int status)
			throws SQLException {
		String sql = "update orderitem set status = ? where orderItemId =?";
		qr.update(sql, status, orderitemId);
	}

	/**
	 * 加载订单 
	 * @param oid
	 * @return
	 * @throws SQLException
	 */
	
	public Order load(String oid) throws SQLException {
		String sql = "select * from b_order where oid = ?";
		Order order = qr.query(sql, new BeanHandler<Order>(Order.class), oid);
		loadOrderItem(order);// 涓哄綋鍓嶈鍗曞姞杞藉畠鐨勬墍鏈夎鍗曟潯鐩�
		return order;
	}
	
	/**
	 * 加载订单条目
	 * @param orderItemId
	 * @return
	 * @throws SQLException
	 */
	public OrderItem loadOrderItem (String orderItemId) throws SQLException{
		String sql = "select * from b_order b,orderitem a where a.orderItemid = ?";
		OrderItem orderitem = qr.query(sql, new BeanHandler<OrderItem>(OrderItem.class),orderItemId);
		loadOrder(orderitem);
		return orderitem;
	}

	/**
	 *生成订单
	 * 
	 * @param order
	 * @throws SQLException
	 */
	public void add(Order order) throws SQLException {
		/*
		 * 1. 插入订单
		 */
		String sql = "insert into b_order values(?,?,?,?,?,?)";
		Object[] params = { order.getOid(), order.getOrdertime(),
				order.getTotal(), order.getAddress(), order.getPhone(),order.getOwner().getBid() };
		qr.update(sql, params);
		/*
		 * 2. 循环遍历订单的所有条目,让每个条目生成一个Object[] 多个条目就对应Object[][] 执行批处理，完成插入订单条目
		 */
		sql = "insert into orderitem values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int len = order.getOrderItemList().size();
		Object[][] objs = new Object[len][];
		for (int i = 0; i < len; i++) {
			OrderItem item = order.getOrderItemList().get(i);
			objs[i] = new Object[] { item.getOrderItemId(), item.getQuantity(),
					item.getSubtotal(), item.getGoods().getGid(),
					item.getGoods().getGname(), item.getGoods().getPrice(),
					item.getGoods().getImage_s(), item.getStatus(),
					item.getGoods().getShopname(), order.getOid() ,item.getScore(),item.getAppraise()};
		}
		qr.batch(sql, objs);
	}

	/**
	 * 按买家查询订单
	 * 
	 * @param press
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findByBuyer(String bid, int pc) throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("bid", "=", bid));
		return findByCriteria(exprList, pc);
	}

	/**
	 * 查询所有
	 */
	public PageBean<OrderItem> findAll(String shopname, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("shopname", "=", shopname + ""));
		return findByCriteria2(exprList, pc);
	}
	
	

	/**
	 * 按状态查询
	 */
	public PageBean<OrderItem> findByStatus(String shopname, int status, int pc)
			throws SQLException {
		List<Expression> exprList = new ArrayList<Expression>();
		exprList.add(new Expression("shopname", "=", shopname + ""));
		exprList.add(new Expression("status", "=", status + ""));
		return findByCriteria2(exprList, pc);
	}

	

	private PageBean<Order> findByCriteria(List<Expression> exprList, int pc)
			throws SQLException {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.ORDER_PAGE_SIZE;// 每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		List<Object> params = new ArrayList<Object>();// SQL涓湁闂彿锛屽畠鏄搴旈棶鍙风殑鍊�
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
		String sql = "select count(*) from b_order" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();// 得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from b_order" + whereSql
				+ " order by ordertime desc limit ?,?";
		params.add((pc - 1) * ps);// 当前页首行记录的下标
		params.add(ps);// 一共查询几行，就是每页记录数


		List<Order> beanList = qr.query(sql, new BeanListHandler<Order>(
				Order.class), params.toArray());
		// 虽然已经获取了所有的订单，但每个订单中并没有订单条目
				// 遍历每个订单，为其加载它的所有订单条目
		for (Order order : beanList) {
			loadOrderItem(order);
		}

		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<Order> pb = new PageBean<Order>();
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
	 * 为指定的order加载它的所有orderItem
	 * 
	 * @param order
	 * @throws SQLException
	 */
	private void loadOrderItem(Order order) throws SQLException {
		/**
		 * 1.给sql语句select * from oderitem where oid = ? 2.执行之，得到List<OrderItem>
		 * 3.设置给Order对象
		 * 
		 */
		String sql = "select * from orderitem where oid = ?";
		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(),
				order.getOid());
		List<OrderItem> orderItemList = toOrderItemList(mapList);

		order.setOrderItemList(orderItemList);
	}
	

	/**
	 * 把多个Map转换成多个OrderItem
	 * 
	 * @param mapList
	 * @return
	 */
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for (Map<String, Object> map : mapList) {
			OrderItem orderItem = toOrderItem(map);
			orderItemList.add(orderItem);
		}
		return orderItemList;
	}

	/**
	 * 
	 * @param map
	 * @return
	 */
	private OrderItem toOrderItem(Map<String, Object> map) {
		if (map == null || map.size() == 0)
			return null;
		OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
		Goods goods = CommonUtils.toBean(map, Goods.class);
		orderItem.setGoods(goods);
		return orderItem;
	}
	
	private PageBean<OrderItem> findByCriteria2(List<Expression> exprList,
			int pc) throws SQLException {
		/*
		 * 1. 得到ps 2. 得到tr 3. 得到beanList 4. 创建PageBean，返回
		 */
		/*
		 * 1. 得到ps
		 */
		int ps = PageConstants.ORDER_PAGE_SIZE;// 每页记录数
		/*
		 * 2. 通过exprList来生成where子句
		 */
		StringBuilder whereSql = new StringBuilder(" where a.oid=b.oid");
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
		String sql = "select count(*) from orderitem a , b_order b" + whereSql;
		Number number = (Number) qr.query(sql, new ScalarHandler(),
				params.toArray());
		int tr = number.intValue();// 得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
		sql = "select * from orderitem a , b_order b " + whereSql + "order by ordertime desc limit ?,?";
		params.add((pc - 1) * ps);// 当前页首行记录的下标
		params.add(ps);// 一共查询几行，就是每页记录数

		List<OrderItem> beanList = qr.query(sql,
				new BeanListHandler<OrderItem>(OrderItem.class),
				params.toArray());
		for (OrderItem orderitem : beanList) {
			loadOrder(orderitem);
		}

		
		/*
		 * 5. 创建PageBean，设置参数
		 */
		PageBean<OrderItem> pb = new PageBean<OrderItem>();
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
	 * 为指定的orderItem加载它的order
	 * 
	 * @param order
	 * @throws SQLException
	 */
	
	private void loadOrder(OrderItem orderitem) throws SQLException {
		/**
		 * 1.给sql语句select * from oderitem where oid = ? 2.执行之，得到List<OrderItem>
		 * 3.设置给Order对象
		 * 
		 */
		String sql = "select * from orderitem where orderitemId = ?";
		Map<String, Object> map = qr.query(sql, new MapHandler(),
				orderitem.getOrderItemId());
		Order order = CommonUtils.toBean(map, Order.class);
		Goods goods = CommonUtils.toBean(map, Goods.class);
		Order order2 =load(order.getOid());
		orderitem.setOrder(order2);
		orderitem.setGoods(goods);
	}

}
