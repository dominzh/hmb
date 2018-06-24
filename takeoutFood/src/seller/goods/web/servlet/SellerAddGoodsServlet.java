package seller.goods.web.servlet;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import category.domain.Category;
import category.service.CategoryService;
import cn.zhku.commons.CommonUtils;
import goods.domain.Goods;
import goods.service.GoodsService;
import seller.seller.domain.Seller;

public class SellerAddGoodsServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		/*
		 * 1. commons-fileupload的上传三步
		 */
		// 创建工具
		FileItemFactory factory = new DiskFileItemFactory();
		/*
		 * 2. 创建解析器对象
		 */
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(200 * 1024);//设置单个上传的文件上限为80KB
		/*
		 * 3. 解析request得到List<FileItem>
		 */
		List<FileItem> fileItemList = null;
		try {
			fileItemList = sfu.parseRequest(request);
		} catch (FileUploadException e) {
			// 如果出现这个异步，说明单个文件超出了80KB
			error("上传的文件超出了200KB", request, response);
			return;
		}
		
		/*
		 * 4. 把List<FileItem>封装到Goods对象中
		 * 4.1 首先把“普通表单字段”放到一个Map中，再把Map转换成Goods和Category对象，再建立两者的关系
		 */
		Map<String,Object> map = new HashMap<String,Object>();
		for(FileItem fileItem : fileItemList) {
			if(fileItem.isFormField()) {//如果是普通表单字段
				map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			}
		}
		Goods goods = CommonUtils.toBean(map, Goods.class);//把Map中大部分数据封装到Book对象中
		Category category = CommonUtils.toBean(map, Category.class);//把Map中cid封装到Category中
		Seller seller = (Seller)request.getSession().getAttribute("sessionSeller");
		goods.setShopname(seller.getLoginname());
		goods.setCategory(category);
		
		/*
		 * 4.2 把上传的图片保存起来
		 *   > 获取文件名：截取之
		 *   > 给文件添加前缀：使用uuid前缀，为也避免文件同名现象
		 *   > 校验文件的扩展名：只能是jpg
		 *   > 校验图片的尺寸
		 *   > 指定图片的保存路径，这需要使用ServletContext#getRealPath()
		 *   > 保存之
		 *   > 把图片的路径设置给Book对象
		 */
		// 获取文件名
		FileItem fileItem = fileItemList.get(1);//获取大图
		String filename = fileItem.getName();
		// 截取文件名，因为部分浏览器上传的绝对路径
		int index = filename.lastIndexOf("\\");
		if(index != -1) {
			filename = filename.substring(index + 1);
		}
		// 给文件名添加uuid前缀，避免文件同名现象
		filename = CommonUtils.uuid() + "_" + filename;
		// 校验文件名称的扩展名
		if(!filename.toLowerCase().endsWith(".jpg")) {
			error("上传的图片扩展名必须是JPG", request, response);
			return;
		}
		// 校验图片的尺寸
		// 保存上传的图片，把图片new成图片对象：Image、Icon、ImageIcon、BufferedImage、ImageIO
		/*
		 * 保存图片：
		 * 1. 获取真实路径
		 */
		String savepath = this.getServletContext().getRealPath("/dishes_img");
		/*
		 * 2. 创建目标文件
		 */
		File destFile = new File(savepath, filename);
		/*
		 * 3. 保存文件
		 */
		try {
			fileItem.write(destFile);//它会把临时文件重定向到指定的路径，再删除临时文件
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		// 校验尺寸
		// 1. 使用文件路径创建ImageIcon
		ImageIcon icon = new ImageIcon(destFile.getAbsolutePath());
		// 2. 通过ImageIcon得到Image对象
		Image image = icon.getImage();
		// 3. 获取宽高来进行校验
		if(image.getWidth(null) > 450 || image.getHeight(null) > 450) {
			error("您上传的图片尺寸超出了450*350！", request, response);
			destFile.delete();//删除图片
			return;
		}
		
		// 把图片的路径设置给book对象
		goods.setImage_b("dishes_img/" + filename);
		
		


		// 获取文件名
		fileItem = fileItemList.get(2);//获取小图
		filename = fileItem.getName();
		// 截取文件名，因为部分浏览器上传的绝对路径
		index = filename.lastIndexOf("\\");
		if(index != -1) {
			filename = filename.substring(index + 1);
		}
		// 给文件名添加uuid前缀，避免文件同名现象
		filename = CommonUtils.uuid() + "_" + filename;
		// 校验文件名称的扩展名
		if(!filename.toLowerCase().endsWith(".jpg")) {
			error("上传的图片扩展名必须是JPG", request, response);
			return;
		}
		// 校验图片的尺寸
		// 保存上传的图片，把图片new成图片对象：Image、Icon、ImageIcon、BufferedImage、ImageIO
		/*
		 * 保存图片：
		 * 1. 获取真实路径
		 */
		savepath = this.getServletContext().getRealPath("/dishes_img");
		/*
		 * 2. 创建目标文件
		 */
		destFile = new File(savepath, filename);
		/*
		 * 3. 保存文件
		 */
		try {
			fileItem.write(destFile);//它会把临时文件重定向到指定的路径，再删除临时文件
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		// 校验尺寸
		// 1. 使用文件路径创建ImageIcon
		icon = new ImageIcon(destFile.getAbsolutePath());
		// 2. 通过ImageIcon得到Image对象
		image = icon.getImage();
		// 3. 获取宽高来进行校验
		if(image.getWidth(null) > 450 || image.getHeight(null) > 450) {
			error("您上传的图片尺寸超出了450*450！", request, response);
			destFile.delete();//删除图片
			return;
		}
		
		// 把图片的路径设置给book对象
		goods.setImage_s("dishes_img/" + filename);
		
		
		
		
		// 调用service完成保存
		goods.setGid(CommonUtils.uuid());
		goods.setScore(0);
		GoodsService goodsService = new GoodsService();
		goodsService.add(goods);
		
		// 保存成功信息转发到msg.jsp
		request.setAttribute("msg", "添加菜品成功！");
		request.getRequestDispatcher("/seller/jsp/msg.jsp").forward(request, response);
	}
	
	/*
	 * 保存错误信息，转发到add.jsp
	 */
	private void error(String msg, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("msg", msg);
		request.setAttribute("parents", new CategoryService().findParents());//所有一级分类
		request.getRequestDispatcher("/seller/jsp/dishes/add.jsp").
				forward(request, response);
	}

}
