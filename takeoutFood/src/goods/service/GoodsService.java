package goods.service;

import java.sql.SQLException;

import goods.dao.GoodsDao;
import goods.domain.Goods;
import paper.PageBean;

public class GoodsService {

	private GoodsDao goodsDao = new GoodsDao();
	
	/**
	 * 删除图书
	 * @param gid
	 */
	public void delete(String gid) {
		try {
			goodsDao.delete(gid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 修改图书
	 * @param book
	 */
	public void edit(Goods goods) {
		try {
			goodsDao.edit(goods);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 返回当前分类下商品个数
	 * @param cid
	 * @return
	 */
	public int findGoodsCountByCategory(String cid) {
		try {
			return goodsDao.findGoodsCountByCategory(cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 加载图书
	 * @param bid
	 * @return
	 */
	public Goods load(String gid){
		try {
			return goodsDao.findByGid(gid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按分类查
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findByCategory(String cid, String status,int pc) {
		try {
			return goodsDao.findByCategory(cid, status, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按分类和商家查
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findByCategoryBySeller(String shopname,String status,String cid, int pc) {
		try {
			return goodsDao.findByCategoryBySeller(shopname,status,cid, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 查询所有商品
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findAllGoods(String status, int pc) {
		try {
			return goodsDao.findAllGoods(status,pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 查询店铺所有商品
	 * 
	 * @param cid
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findAllGoodsBySeller(String shopname,String status, int pc) {
		try {
			return goodsDao.findAllGoodsBySeller(shopname,status, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按商品名查
	 * 
	 * @param bname
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findByGname(String gname,String status, int pc) {
		try {
			return goodsDao.findByGname(gname,status, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按产地查
	 * 
	 * @param place
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findByPlace(String place, int pc) {
		try {
			return goodsDao.findByPlace(place, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 按店铺
	 * 
	 * @param place
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findByShop(String shopname, int pc) {
		try {
			return goodsDao.findByShop(shopname, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 多条件组合查询
	 * 
	 * @param criteria
	 * @param pc
	 * @return
	 */
	public PageBean<Goods> findByCombination(Goods criteria,String status, int pc) {
		try {
			return goodsDao.findByCombination(criteria,status, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 添加商品
	 */
	public void add(Goods goods){
		try {
			goodsDao.add(goods);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/*
	 * 更新商品评分平均值
	 */
	public void updateScore(float score , String gname){
		try {
			goodsDao.updateScore(score, gname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
}
