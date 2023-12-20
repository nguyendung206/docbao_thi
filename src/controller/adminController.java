package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bean.baobean;
import bo.baobo;
import bo.loaibo;
import bo.tacgiabo;

/**
 * Servlet implementation class adminController
 */
@WebServlet("/adminController")
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminController() {
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
			loaibo lbo = new loaibo(); 
			baobo bbo = new baobo();
			tacgiabo tgbo = new tacgiabo();HttpSession session = request.getSession();
			adminbean  nd= (adminbean)session.getAttribute("dn");
			if(nd==null)
				response.sendRedirect("dangnhapController");
			request.setAttribute("dsloai", lbo.getloai());
			request.setAttribute("dstacgia", tgbo.gettacgia());
			String ml = request.getParameter("ml");
			String key = request.getParameter("txttk");
			String mtg = request.getParameter("mtg");
			ArrayList<baobean> ds = bbo.getbao();
			if (ml!=null) {
				ds=bbo.TimMa(ml);
			}
			else if(key!=null) {
				ds=bbo.Tim(key); 
			}
			else if (mtg!=null){
				ds = bbo.TimTacgia(Long.parseLong(mtg));
			}
			request.setAttribute("dsbao", ds);
			RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
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
