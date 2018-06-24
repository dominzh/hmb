package category.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import category.domain.Category;
import cn.zhku.commons.CommonUtils;
import cn.zhku.jdbc.TxQueryRunner;
import paper.PageBean;
import paper.PageConstants;
/**
 * 分类持久层
 * @author bx
 *
 */

public class CategoryDao {

	private QueryRunner qr = new TxQueryRunner();
	
	/**
	 * 把一个map中的数据映射到Category中
	 */
	private Category toCategory(Map<String,Object> map){
		/*
		 * map {cid:xx, cname:xx, pid:xx, desc:xx, orderBy:xx}
		 * Category{cid:xx, cname:xx, parent:(cid=pid), desc:xx}
		 */
		Category category = CommonUtils.toBean(map, Category.class);
		String pid = (String)map.get("pid");
		if(pid != null){//如果父分类ID不为空，
			/*
			 * 使用一个父分类对象来拦截pid
			 * 再把父分类设置给category
			 */
			Category parent = new Category();
			parent.setCid(pid);
			category.setParent(parent);
		}
		return category;
	}
	/*
	 * 可以把多个Map(List<Map>)映射成多个Category(List<Category>)
	 */
	private List<Category> toCategoryList(List<Map<String,Object>> mapList) {
		List<Category> categoryList = new ArrayList<Category>();//创建一个空集合
		for(Map<String,Object>map : mapList){//循环遍历每个Map
			Category c = toCategory(map);//把一个Map转换成一个Category
			categoryList.add(c);//添加到集合中
		}
		return categoryList;//返回集合
	}
	
	
	
	/**
	 * 返回所有分类
	 * @return
	 * @throws SQLException 
	 */
	public List<Category> findAll() throws SQLException {
		/*
		 * 1. 查询出所有一级分类
		 */
		String sql = "select * from category where pid is null order by orderBy";
		List<Map<String,Object>>mapList = qr.query(sql, new MapListHandler());
		//System.out.println(mapList);
		// [{cname=快餐, orderBy=1, pid=null, cid=1, desc=快速供应、即刻食用、价格合理}, {cname=小吃, orderBy=2, pid=null, cid=2, desc=口味上具有特定风格特色的食品}, {cname=甜品饮品, orderBy=3, pid=null, cid=3, desc=甜味点心、糖水、各种饮品}]

		List<Category> parents = toCategoryList(mapList);
		//System.out.println(parents);
		/*
		 * 2. 循环遍历所有的一级分类，为每个一级分类加载它的二级分类 
		 */
		for(Category parent : parents){
			// 查询出当前父分类的所有子分类
			List<Category> children = findByParent(parent.getCid());
			// 设置给父分类
			parent.setChildren(children);
		}
		return parents;
	}
	
	/**
	 * 通过父分类查询子分类
	 * @param pid
	 * @return
	 * @throws SQLException 
	 */
	public List<Category> findByParent(String pid) throws SQLException {
		String sql = "select * from category where pid = ? ";
		List<Map<String,Object>>mapList = qr.query(sql, new MapListHandler(),pid);
		return toCategoryList(mapList);
	}
	/**
	 * 添加一级分类二级分类
	 * @param category
	 * @throws SQLException
	 */
	public void add(Category category) throws SQLException {
		String sql = "insert into category(cid,cname,pid,`desc`)values(?,?,?,?)";
		/**
		 * 因为一级分类，没有parent，而二级方法有
		 * 我们这个方法，要兼容两次分类，所以需要判断
		 */
		String pid = null;
		if(category.getParent()!=null){
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCid(),category.getCname(),pid,category.getDesc()};
		qr.update(sql,params);
	}
	
	/**
	 * 获取所有父分类，但不带子分类的！
	 * @return
	 * @throws SQLException
	 */
	public List<Category> findParents() throws SQLException {
		/*
		 * 1. 查询出所有一级分类
		 */
		String sql = "select * from category where pid is null order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		
		return toCategoryList(mapList);
	}
	
	/**
	 * 加载分类
	 * 即可加载一级分类，也可加载二级分类
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public Category load(String cid) throws SQLException {
		String sql = "select * from category where cid = ?";
		return toCategory(qr.query(sql, new MapHandler(),cid));
	}
	
	/**
	 * 修改分类
	 * 即可修改一级分类，也可修改二级分类
	 * @param category
	 * @throws SQLException 
	 */
	public void edit(Category category) throws SQLException {
		String sql = "update category set cname = ?,pid = ?,`desc` = ? where cid = ?";
		String pid = null;
		if(category.getParent() != null){
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCname(), pid, category.getDesc(), category.getCid()};
		qr.update(sql,params);
	}
	

	/**
	 * 查询指定父分类下子分类的个数
	 * @param pid
	 * @return
	 * @throws SQLException 
	 */
	public int findChildrenCountByParent(String pid) throws SQLException {
		String sql = "select count(1) from category where pid=?";
		Number cnt = (Number) qr.query(sql, new ScalarHandler(),pid);
		return cnt == null?0 :cnt.intValue();
	}
	
	/**
	 * 删除分类
	 * @param cid
	 * @throws SQLException 
	 */
	public void delete(String cid) throws SQLException {
		String sql = "delete from category where cid = ?";
		qr.update(sql,cid);
	}
	
	/**
	 * 获取分类数目
	 */
	public int getNum() throws SQLException {
		String sql = "select count(*) from category";
		Number num = (Number) qr.query(sql,new ScalarHandler());
		return num.intValue();
	}
}
