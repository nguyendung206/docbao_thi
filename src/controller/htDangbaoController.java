package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.nguoidocbean;
import bo.loaibo;
import bo.tacgiabo;

/**
 * Servlet implementation class htDangbaoController
 */
@WebServlet("/htDangbaoController")
public class htDangbaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public htDangbaoController() {
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
			loaibo lbo = new loaibo();
			tacgiabo tgbo = new tacgiabo();
            nguoidocbean  nd= (nguoidocbean)session.getAttribute("dn");
			if(nd==null)
				response.sendRedirect("dangnhapController");
			request.setAttribute("dsloai", lbo.getloai());
			request.setAttribute("dstacgia", tgbo.gettacgia());
			RequestDispatcher rd = request.getRequestDispatcher("dangbao.jsp");
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
