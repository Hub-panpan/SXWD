package com.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.DAO.FoodsDAO;
import com.DAO.MemberDao;
import com.DAO.MenuDAO;
import com.DAO.RemarkDAO;
import com.model.Foods;
import com.model.FoodsPage;
import com.model.Member;
import com.model.Menu;
import com.model.Remark;

public class FoodsService {

	private static final long serialVersionUID = 1L;

	// 上传文件存储目录
	private static final String UPLOAD_DIRECTORY = "upload/food_img";

	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	public void addFood(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		HttpSession session = req.getSession();
		FoodsDAO meDao = new FoodsDAO();

		LinkedList<String> form_info = new LinkedList<String>();// 創建

		/************************/
		if (!ServletFileUpload.isMultipartContent(req)) {
			// 如果不是则停止
			PrintWriter writer = resp.getWriter();

			session.setAttribute("msg",
					"Error: 表单必须包含 enctype=multipart/form-data!");

			return;
		}

		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// 中文处理
		upload.setHeaderEncoding("UTF-8");

		// 构造临时路径来存储上传的文件
		// 这个路径相对当前应用的目录
		String uploadPath = req.getServletContext().getRealPath("./")
				+ File.separator + UPLOAD_DIRECTORY;
		System.out.println(uploadPath);

		// 如果目录不存在则创建
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// 解析请求的内容提取文件数据
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(req);

			if (formItems != null && formItems.size() > 0) {
				// 迭代表单数据
				for (FileItem item : formItems) {

					// 处理不在表单中的字段
					if (item.isFormField()) {

						String str = new String(item.getString().getBytes(
								"ISO-8859-1"), "utf-8");
						form_info.add(str);
						System.out.println("form filed:" + item.getFieldName()
								+ " 值：" + str);

						if (meDao.get(str) != null) {
							System.out.println("当前菜品ID已经存在");
							session.setAttribute("message",
									"Error: 当前菜品ID已经存在!");
							req.getServletContext()
									.getRequestDispatcher(
											"/admin/Foods/message.jsp")
									.forward(req, resp);

						}
					} else {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator
								+ fileName;
						File storeFile = new File(filePath);
						// 在控制台输出文件的上传路径
						System.out.println(filePath);
						// 保存文件到硬盘
						item.write(storeFile);
						req.setAttribute("message", "文件上传成功!");

					}

				}
			}
		} catch (Exception ex) {
			session.setAttribute("msg", "错误信息: " + ex.getMessage());
		}

		System.out.println("向量元素" + form_info);

		Foods addfo = new Foods();

		addfo.setFood_id(form_info.get(0));
		addfo.setFood_name(form_info.get(1));
		addfo.setFood_price(Float.parseFloat(form_info.get(2)));
		addfo.setFood_info(form_info.get(3));
		addfo.setIsremark(Integer.parseInt(form_info.get(5)));
		addfo.setMenu_id(form_info.get(4));

		FoodsDAO foDao = new FoodsDAO();

		boolean bool = foDao.save(addfo);

		if (bool == true) {
			System.out.println("新增菜品信息成功！");
			session.setAttribute("msg", "新增菜品信息成功!");
			req.getServletContext().getRequestDispatcher("/admin/adminMsg.jsp")
					.forward(req, resp);
		}

	}

	public void updateFoodInfo01(HttpServletRequest req,
			HttpServletResponse resp) throws IOException, ServletException {
		String updateFood = req.getParameter("fo_id");
		System.out.println("测试是否能在showFood.jsp页面获得到 fo_id值：" + updateFood);

		Foods me = new Foods();
		FoodsDAO medao = new FoodsDAO();

		me = medao.get(updateFood);

		HttpSession session = req.getSession();
		session.setAttribute("updateFood", me);
		RequestDispatcher dispatcher = req
				.getRequestDispatcher("../Foods/updateFoodsInfo.jsp");
		dispatcher.forward(req, resp);

	}

	/* 提交信息 修改到数据库 */
	public void updateFoodInfo02(HttpServletRequest req,
			HttpServletResponse resp) throws IOException, ServletException {

		String old_id = req.getParameter("old_food_id");

		String new_id = req.getParameter("food_id");
		String new_food_name = req.getParameter("food_name");
		String new_food_price = req.getParameter("food_price");
		String new_food_info = req.getParameter("food_info");
		String new_isRemark = req.getParameter("isRemark");
		String new_food_menu = req.getParameter("menu_id");

		System.out.println("updateFoodInfo02()能够在提交的更新用户的页面得到：旧ID:" + old_id);
		System.out.println("updateFoodInfo02()能够在提交的更新用户的页面得到：新ID:" + new_id);

		FoodsDAO meDao = new FoodsDAO();
		Foods fo = new Foods();

		fo.setFood_id(new_id);
		fo.setFood_name(new_food_name);
		fo.setFood_price(Float.parseFloat(new_food_price));
		fo.setFood_info(new_food_info);
		fo.setIsremark(Integer.parseInt(new_isRemark));
		fo.setMenu_id(new_food_menu);

		HttpSession session = req.getSession();
		Boolean bool = meDao.update(fo, old_id);

		if (bool == true) {

			List<Foods> rs = (List<Foods>) session
					.getAttribute("sigle_menu_list");

			Iterator<Foods> it = rs.iterator();
			// it.hasNext判断是否有下一个元素
			while (it.hasNext()) {
				// it.next取出元素
				Foods fox = it.next();
				if (fox.getFood_id().equals(old_id)) {
					it.remove();
					break;// 结束while
				}
			}
			rs.add(fo);

			req.getSession().setAttribute("sigle_menu_list", rs);

			session.setAttribute("msg", "修改信息成功");
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("../adminMsg.jsp");
			dispatcher.forward(req, resp);

		} else {

			System.out.println("修改失败");

			/* 这个地方 写的不是很完善 等 补上 错误页面 和成功页面 */

		}

	}

	public void deleteFood(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String fo_id = req.getParameter("fo_id");
		System.out.println("测试是否能在showSingle.jsp页面获得到 fo_id值：" + fo_id);

		FoodsDAO dao = new FoodsDAO();
		boolean bool = dao.delete(fo_id);
		if (bool == true) {
			/* 竟然还有这种操作！！ */

			List<Foods> rs = (List<Foods>) req.getAttribute("melist");

			Iterator<Foods> it = rs.iterator();
			// it.hasNext判断是否有下一个元素
			while (it.hasNext()) {
				// it.next取出元素
				Foods u = it.next();
				if (u.getFood_id().equals(fo_id)) {
					// it.remove将当前正在迭代的对象删除
					it.remove();
					break;// 结束while
				}
			}
			HttpSession session = req.getSession();
			session.setAttribute("sigle_menu_list", rs);

		}

		RequestDispatcher dispatcher = req.getRequestDispatcher("showMenu.jsp");
		dispatcher.forward(req, resp);
		/* 这个地方 写的不是很完善 等 补上 错误页面 和成功页面 */
	}

	/* 后台直接看成功！！ */

	public void showsingleMenu(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		String me_id = req.getParameter("me_id");
		FoodsDAO dao = new FoodsDAO();

		List<Foods> sigle_menu_list = dao.sigle_menu_list(me_id);
		if (sigle_menu_list != null) {

			session.setAttribute("sigle_menu_list", sigle_menu_list);

			RequestDispatcher dispatcher = req
					.getRequestDispatcher("/admin/Foods/showFood.jsp");
			dispatcher.forward(req, resp);

		} else {
			System.out.println("获取单一食物列表失败");
			session.setAttribute("msg", "获取单一食物列表失败");

			RequestDispatcher dispatcher = req
					.getRequestDispatcher("/admin/adminMsg.jsp");
			dispatcher.forward(req, resp);
		}

	}

	/* 前台 各种分页 窗口分页 */
	public void fenye(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int page = Integer.parseInt(req.getParameter("page"));
		String me_id = req.getParameter("me_id");
		// 首先 当点击html时，获得到当前的 页面数
		FoodsDAO foDao = new FoodsDAO();
		// 通过当前 点击的页数 计算机出 下一次查询的起始条数
		// 实际上 在服务器启动的时候 对这个进行
		FoodsPage pp = foDao.getPage(page, me_id);
		List<Foods> index_foods = foDao.split_page_food_list(pp, me_id);
		req.getServletContext().setAttribute("index_foods", index_foods);
		req.getServletContext().setAttribute("pp", pp);
		req.getRequestDispatcher("order_breakfast.jsp").forward(req, resp);

	}

	public void showdetails(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String fo_id = req.getParameter("food_id");
		System.out.println(" 用户显示 请求显示的food_id为：" + fo_id);

		FoodsDAO foDao = new FoodsDAO();
		Foods food_detail = foDao.get(fo_id);

		System.out.println(" 正在查询：" + fo_id + "的详细信息");

		// int rem_id=Integer.parseInt(req.getParameter("rem_id")); // 首先从页面上 获取
		// 提交的 remArk id
		System.out.println("正在产寻与此食物有关的  请求的 评论的id");
		RemarkDAO remdao = new RemarkDAO();
		List<Remark> single_remark_list = remdao.getSingleAll(fo_id);

		HttpSession session = req.getSession();
		session.setAttribute("single_remark_list", single_remark_list);
		System.out.println(" 找到的条数 ：" + single_remark_list.size());

		req.setAttribute("food_detail", food_detail);
		System.out.println("封装好 显示详细对象的值:" + food_detail.getFood_id() + "  "
				+ food_detail.getFood_name());
		RequestDispatcher dispatcher = req
				.getRequestDispatcher("showdetail.jsp");
		dispatcher.forward(req, resp);

	}

}
