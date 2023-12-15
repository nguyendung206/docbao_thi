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
			String bao = request.getParameter("bao");
			String loai = request.getParameter("loai");
			String tg = request.getParameter("tg");
			adminbean  ad = (adminbean)session.getAttribute("dn");
			if(ad==null)
				response.sendRedirect("dangnhapController");
			if (bao != null) {
				request.setAttribute("ctbao", ctbbo.getallctbao());
				request.setAttribute("dsloai", lbo.getloai());
				request.setAttribute("dstacgia", tgbo.gettacgia());
			} else if (loai != null) {
				request.setAttribute("dsloai", lbo.getloai());
			} else if (tg != null) {
				request.setAttribute("dstacgia", tgbo.gettacgia());
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
