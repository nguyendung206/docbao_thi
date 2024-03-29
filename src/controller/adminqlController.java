package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bo.chitietbaobo;
import bo.loaibo;
import bo.nguoidocbo;
import bo.tacgiabo;

/**
 * Servlet implementation class adminqlController
 */
@WebServlet("/adminqlController")
public class adminqlController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminqlController() {
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
            HttpSession session = request.getSession();
			chitietbaobo ctbbo = new chitietbaobo();
			loaibo lbo = new loaibo();
			tacgiabo tgbo = new tacgiabo();
			nguoidocbo ndbo = new nguoidocbo();
			String bao = request.getParameter("bao");
			String loai = request.getParameter("loai");
			String tg = request.getParameter("tg");
			String nd = request.getParameter("nd");
			String tb1 = request.getParameter("tb1");
			String tb2 = request.getParameter("tb2");
			String tb3 = request.getParameter("tb3");
			String tb4 = request.getParameter("tb4");
			adminbean  ad = (adminbean)session.getAttribute("dn");
			if(ad==null)
				response.sendRedirect("dangnhapController");
			if (bao != null) {
				if (tb1!=null)
					request.setAttribute("tb1", "1");
				else if (tb2!=null)
					request.setAttribute("tb2", "1");
				else if (tb3!=null)
					request.setAttribute("tb3", "1");
				request.setAttribute("ctbao", ctbbo.getallctbao());
				request.setAttribute("dsloai", lbo.getloai());
				request.setAttribute("dstacgia", tgbo.gettacgia());
			} else if (loai != null) {
				if (tb1!=null)
					request.setAttribute("tb1", "1");
				else if (tb2!=null)
					request.setAttribute("tb2", "1");
				else if (tb3!=null)
					request.setAttribute("tb3", "1");
				else if (tb4!=null)
					request.setAttribute("tb4", "1");
				request.setAttribute("dsloai", lbo.getloai());
			} else if (tg != null) {
				if (tb1!=null)
					request.setAttribute("tb1", "1");
				else if (tb2!=null)
					request.setAttribute("tb2", "1");
				else if (tb3!=null)
					request.setAttribute("tb3", "1");
				request.setAttribute("dstacgia", tgbo.gettacgia());
			}
			else if (nd != null) {
				if (tb1!=null)
					request.setAttribute("tb1", "1");
				else if (tb2!=null)
					request.setAttribute("tb2", "1");
				else if (tb3!=null)
					request.setAttribute("tb3", "1");
				else if (tb4!=null)
					request.setAttribute("tb4", "1");
				request.setAttribute("dsnguoidoc", ndbo.getnguoidoc());
			}
			RequestDispatcher rd = request.getRequestDispatcher("quanly.jsp");
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
