package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.baobo;
import bo.chitietbaobo;
import bo.loaibo;
import bo.nguoidocbo;
import bo.tacgiabo;

/**
 * Servlet implementation class adminthongkeController
 */
@WebServlet("/adminthongkeController")
public class adminthongkeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminthongkeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			baobo bbo = new baobo();
			loaibo lbo = new loaibo();
			tacgiabo tgbo = new tacgiabo();
			nguoidocbo ndbo = new nguoidocbo();
			chitietbaobo ctbo = new chitietbaobo();
            HttpSession session = request.getSession();
			adminbean  nd= (adminbean)session.getAttribute("dn");
			String ngay = request.getParameter("txtngay");
			String all = request.getParameter("all");
			String tk = request.getParameter("tk");
			if(nd==null) {
				response.sendRedirect("dangnhapController");
			}
			if (tk != null) {
				if (ngay!=null && !ngay.isEmpty()) {
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
					Date Ngay = dateFormat.parse(ngay);
					request.setAttribute("ds", ctbo.getBaotheongay(Ngay));
				}
			} else if (all!=null) {
				request.setAttribute("ds", ctbo.getallctbao());
			} else {
				request.setAttribute("ds", ctbo.getallctbao());
			}
			request.setAttribute("tongBao", bbo.tongBao());
			request.setAttribute("tongLoai", lbo.tongLoai());
			request.setAttribute("tongNguoidoc", ndbo.tongNguoidoc());
			request.setAttribute("tongTacgia", tgbo.tongTacgia());
			RequestDispatcher rd = request.getRequestDispatcher("thongke.jsp");
		    rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
