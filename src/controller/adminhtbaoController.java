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
import bean.chitietbaobean;
import bo.chitietbaobo;

/**
 * Servlet implementation class adminhtbaoController
 */
@WebServlet("/adminhtbaoController")
public class adminhtbaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminhtbaoController() {
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
			chitietbaobo ctbbo = new chitietbaobo();
			String mb = request.getParameter("mb");
            HttpSession session = request.getSession();
			adminbean  nd= (adminbean)session.getAttribute("dn");
			if(nd==null)
				response.sendRedirect("dangnhapController");
			if (mb != null) {
				ArrayList<chitietbaobean> ds = ctbbo.getctbao(Long.parseLong(mb));
				request.setAttribute("ctbao", ds);
			}
			RequestDispatcher rd = request.getRequestDispatcher("adminhtbao.jsp");
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
