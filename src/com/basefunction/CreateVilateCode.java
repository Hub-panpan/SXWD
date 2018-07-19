package com.basefunction;

import java.awt.Color;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class CreateVilateCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * Constructor of the object.
	 */
	public CreateVilateCode() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//创建图片缓冲区，120宽，60高，图片样式为RGB三原色
		BufferedImage img =new BufferedImage(120,60,BufferedImage.TYPE_INT_RGB);
		//获取画笔
		Graphics g = img.getGraphics();
		//设置画笔颜色
		g.setColor(getColor());
		//画出验证码的背景
		g.fillRect(0, 0, 120, 60);
		//画出噪点
		g.setColor(getColor());
		Random ran = new Random();
		for(int i=0;i<6;i++){
			g.drawLine(ran.nextInt(120), ran.nextInt(60),ran.nextInt(120), ran.nextInt(60));
		}
		//生成验证码
		char[] code = "0123456789abcdefghigklmnopqrstuvwxyz".toCharArray();
		//设置验证码的颜色和字体
		g.setColor(getColor());
		g.setFont(new Font("Arial",Font.BOLD,18));
		//画出验证码
		char[] rc = new char[4];
		for(int i=0;i<4;i++){
			rc[i] = code[ran.nextInt(36)];
		}
		String vcode = new String(rc);
		g.drawString(vcode, 20, 20);
		//将验证码存入Session
		HttpSession session = request.getSession();
		session.setAttribute("vcode", vcode);
		//将图片输出到前台页面
		ImageIO.write(img, "jpeg", response.getOutputStream());
}
		private Color getColor(){
		Random ran = new Random();
		int r = ran.nextInt(255);
		int g = ran.nextInt(255);
		int b = ran.nextInt(255);
		return new Color(r,g,b);
		}
		
	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
