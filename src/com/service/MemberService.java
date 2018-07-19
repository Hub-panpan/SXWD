package com.service;

import java.io.IOException;
import java.util.List;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.print.resources.serviceui;

import com.DAO.MemberDao;
import com.DAO.OptionDAO;
import com.DAO.VoteDAO;
import com.DAO.VoteInfoDAO;
import com.basefunction.Regex;
import com.model.Count;
import com.model.Member;
import com.model.Option;
import com.model.Vote;
import com.model.VoteInfo;

public class MemberService {
	// 通过传入表单值 来进行注册 登录 注销
	public void save(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");

		String uphone = req.getParameter("tel");
		String uname = req.getParameter("username");
		String upwd = req.getParameter("password");
	
		String uaddrs = req.getParameter("address");

	//	String hdyzm = req.getParameter("isTrue");

	//	System.out.println("验证码" + hdyzm);

		MemberDao dao = new MemberDao();
		Member m = new MemberDao().get(uphone);
		Regex re = new Regex();

		if (m != null) {
			try {
				req.getSession()
						.setAttribute(
								"errormsg",
								m.getMember_phone() + m.getMember_name()
										+ "当前手机号已经被注册");
				RequestDispatcher dispatcher = req
						.getRequestDispatcher("error.jsp");
				dispatcher.forward(req, resp);
			} catch (ServletException e) {

				e.printStackTrace();
			}

		} else
		// 判断 是否是合法的手机号码
		if (!re.isMobileN02(uphone)) {

			req.getSession().setAttribute("errormsg", "正则匹配之后-请输入有效手机号");
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("error.jsp");
			try {
				dispatcher.forward(req, resp);
			} catch (ServletException e) {

				e.printStackTrace();
			}
		} else
		
		// 判断是否是有效的用户名
		if (re.isValidName(uname)) {
			req.getSession().setAttribute("errormsg", "用户名包涵非法字符");
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("error.jsp");
			try {
				dispatcher.forward(req, resp);
			} catch (ServletException e) {

				e.printStackTrace();
			}
		}

		else
		// 判断是否是有效的地址
		if (!re.isValidAddr(uaddrs)) {
			req.getSession().setAttribute("errormsg", "地址长度应大于6并不能包涵除#以外其他字符");
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("error.jsp");
			try {
				dispatcher.forward(req, resp);
			} catch (ServletException e) {

				e.printStackTrace();
			}
		}

		/**else
		
		if (!hdyzm.equals("true")) {
			req.getSession().setAttribute("errormsg", "滑动验证未通过");
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("error.jsp");
			try {
				dispatcher.forward(req, resp);
			} catch (ServletException e) {

				e.printStackTrace();
			}
		}**/ else {

			Member mx = new Member();
			mx.setMember_phone(uphone);
			mx.setMember_name(uname);
			mx.setMember_password(upwd);
			mx.setMember_address(uaddrs);
			mx.setMember_points(0);
			mx.setMember_rights(0);

			// 如果 保存一个 新增的员工信息 不用放到session中去！！！ 我们登录的时候 去 数据库中 直接查询表 数据！！！！

			// 用户反馈信息
			if (dao.save(mx)) {

				req.getSession().setAttribute("succmsg",
						"恭喜吃货！您已经注册成功，快来开始你的吃货之旅吧！！");
				resp.sendRedirect("succeed.jsp");
			} else {
				req.getSession().setAttribute("errormsg", "很，可惜！会员注册失败！");
				resp.sendRedirect("error.jsp");
			}
		}

	}

	public void login(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		String uphone = req.getParameter("tel");
		String upwd = req.getParameter("password");
		//String urepwd = req.getParameter("repassword");
       
		//String uyzm = req.getParameter("vcode"); // 验证码

		HttpSession session = req.getSession();
		String yzm = (String) session.getAttribute("vcode");

		//System.out.println("验证码" + yzm + "  " + uyzm);
		Member m = new MemberDao().get(uphone);
        
		if (m != null) {
			System.out.println("验证登录时 是够从数据库中获取到 用户信息" + m.getMember_name());
			if (m.getMember_phone().equals(uphone)
					&& m.getMember_password().equals(upwd)
				) {
// && yzm.equals(uyzm)
				session.setAttribute("active_user", m);
				RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
				dispatcher.forward(req, resp);
			} else {
				req.getSession().setAttribute("errormsg",
						"登录失败!请仔细检查用户名和密码和验证码！");
				RequestDispatcher dispatcher = req
						.getRequestDispatcher("error.jsp");
				dispatcher.forward(req, resp);

			}

		} else {
			req.getSession().setAttribute("errormsg", "登录失败!用户名不存在哟！快来注册一个吧！");
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("error.jsp");
			dispatcher.forward(req, resp);

		}

	}

	public void logoff(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		HttpSession session = req.getSession(false);// 防止创建Session
		if (session == null) {
			resp.sendRedirect("/SXWD/index.jsp");
			return;
		}
		session.removeAttribute("active_user");
		resp.sendRedirect("/SXWD/index.jsp");
	}

	public void getSingleVote(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		int vo_id = Integer.parseInt(req.getParameter("vo_id"));// 首先从页面上 获取 提交的
																// Vote id
		System.out.println("获取到当前请求的 投票的id" + vo_id);
		VoteDAO vodao = new VoteDAO();
		OptionDAO opDao = new OptionDAO();

		Vote single_Vote = vodao.get(vo_id); // 返回的是一个 投票的头对象
		List<Option> oplist = opDao.getSingleAllOption(vo_id); // 返回头片的选项信息

		System.out.println("获取到返回的  选项列表的长度：" + oplist.size());

		HttpSession session = req.getSession();
		session.setAttribute("single_Vote", single_Vote);
		session.setAttribute("oplist", oplist);

		RequestDispatcher dispatcher = req
				.getRequestDispatcher("memberVote.jsp");
		dispatcher.forward(req, resp);

	}

	public void iwanttovote(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		String member_phone = req.getParameter("mem_phone");

		String vote_name = req.getParameter("vo_name");
		String vote_id = req.getParameter("vo_id");
		String option_value = req.getParameter("op_value");

		System.out.println(member_phone);
		System.out.println(vote_id);
		System.out.println(vote_name);
		System.out.println(option_value);

		VoteInfo vofo = new VoteInfo();
		vofo.setMember_phone(member_phone);
		vofo.setVote_id(Integer.parseInt(vote_id));
		vofo.setVote_name(vote_name);
		vofo.setOption_value(option_value);

		// 注意 这个 地方 我们 没有给时间 赋值 是在插入数据库的时候 自动赋值

		VoteInfoDAO vofodao = new VoteInfoDAO();
		HttpSession session = req.getSession();
		boolean bool = vofodao.save(vofo);

		// session.removeAttribute("count_vote");

		if (bool) {

			System.out.println("成功插入  用户投票数据一条 ！");
			/* 一旦用户投票成功 我们就返回现在 统计结果到页面上 */
			// session.setAttribute("succmsg", "成功插入  用户投票数据 一条 ！");

			List<Count> count_vote = vofodao.count(Integer.parseInt(vote_id));

			session.setAttribute("count_vote", count_vote);

			/*
			 * RequestDispatcher
			 * dispatcher=req.getRequestDispatcher("memberVote.jsp");
			 * dispatcher.forward(req, resp);
			 */

			resp.sendRedirect("memberVote.jsp");

		}

	}

	
	
	
	
}

/*
 * 1、用户管理员登录注册模块：用于实现用户登录，用户输入用户名,对当前的用户身份进行验证,登录时验证用户密码及用户身份.；
 * 2、权限管理模块：密码修改，评论，投票权限管理； 3、菜品窗口管理模块（栏目管理）：用于栏目信息的增删改查功能
 * 4、菜品管理模块（内容管理）：用于菜品信息的增删改查功能，并在首页进行分页功能。 5、评论管理示模块： (1) 用于对评论的审核与删除功能 (2)
 * 用户在对菜品评价，评价后等待后台管理员同意后，即可显示。 6、投票管理示模块： (1) 管理员可以发起新投票，删除已有投票 (2)
 * 查看当前存在投票信息，结果统计信息 (3)查看所有用户投票详细信息
 */
