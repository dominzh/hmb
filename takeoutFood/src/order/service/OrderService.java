package order.service;

import java.sql.SQLException;

import cn.zhku.jdbc.JdbcUtils;
import order.dao.OrderDao;
import order.domain.Order;
import order.domain.OrderItem;
import paper.PageBean;

public class OrderService {
	private OrderDao orderDao = new OrderDao();
	/**
	 * 评价订单
	 * @param orderitemId
	 * @param score
	 * @param appraise
	 */
	public void updateAppraise(String orderitemId, int score ,String appraise){
		try {
			orderDao.updateAppraise(orderitemId, score, appraise);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 获取商品的平均评分
	 * @throws SQLException 
	 */
	public float  getAvgScore(String gname){
		try {
			return orderDao.getAvgScore(gname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 修改订单状态
	 * 
	 * @param oid
	 * @param status
	 */
	public void updateStatus(String orderitemId, int status) {
		try {
			orderDao.updateStatus(orderitemId, status);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 查询订单状态
	 * 
	 * @param oid
	 * @return
	 */
	public int findStatus(String orderItemId) {
		try {
			return orderDao.findStatus(orderItemId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 加载订单///////////////////////////////////////////////////////////
	 * 
	 * @param oid
	 * @return
	 */
	
	public Order load(String oid) {
		try {
			JdbcUtils.beginTransaction();
			Order order = orderDao.load(oid);
			JdbcUtils.commitTransaction();
			return order;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
			}
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 店铺加载订单
	 * 
	 * @param oid
	 * @return
	 */
	
	public OrderItem loadOrderItem(String orderItemId) {
		try {
			JdbcUtils.beginTransaction();
			OrderItem orderItem = orderDao.loadOrderItem(orderItemId);
			JdbcUtils.commitTransaction();
			return orderItem;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
				
				
			}
			throw new RuntimeException(e);
		}
	}

	/**
	 * 生成订单
	 * 
	 * @param order
	 */
	public void createOrder(Order order) {
		try {
			JdbcUtils.beginTransaction();
			orderDao.add(order);
			JdbcUtils.commitTransaction();
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
			}
			throw new RuntimeException(e);
		}
	}

	/**
	 * 我的订单
	 * 
	 * @param bid
	 * @param pc
	 * @return
	 */
	public PageBean<Order> myOrders(String bid, int pc) {
		try {
			JdbcUtils.beginTransaction();
			PageBean<Order> pb = orderDao.findByBuyer(bid, pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
			}
			throw new RuntimeException(e);
		}
	}

	/**
	 * 店铺所有订单
	 * 
	 * @param uid
	 * @param pc
	 * @return
	 */
	public PageBean<OrderItem> findAll(String shopname,int pc) {
		try {
			JdbcUtils.beginTransaction();
			PageBean<OrderItem> pb = orderDao.findAll(shopname,pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
			}
			throw new RuntimeException(e);
		}
	}

	public PageBean<OrderItem> findByStatus(String shopname,int status, int pc) {
		try {
			JdbcUtils.beginTransaction();
			PageBean<OrderItem> pb = orderDao.findByStatus(shopname,status, pc);
			JdbcUtils.commitTransaction();
			return pb;
		} catch (SQLException e) {
			try {
				JdbcUtils.rollbackTransaction();
			} catch (SQLException e1) {
			}
			throw new RuntimeException(e);
		}
	}
}
