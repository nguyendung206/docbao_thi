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
import bo.baobo;
import bo.duyetbaibo;

/**
 * Servlet implementation class duyetbaiController
 */
@WebServlet("/duyetbaiController")
public class duyetbaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public duyetbaiController() {
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
			duyetbaibo dbbo = new duyetbaibo();
			baobo bbo = new baobo();
			HttpSession session = request.getSession();
			adminbean  nd= (adminbean)session.getAttribute("dn");
			if(nd==null)
				response.sendRedirect("dangnhapController");
			String mabaoduyet = request.getParameter("mbd");
			String mabaoxoa = request.getParameter("mbx");
			if(mabaoduyet!=null) {
				dbbo.Capnhat(Long.parseLong(mabaoduyet));
			}
			if(mabaoxoa!=null) {
				bbo.Xoa(Long.parseLong(mabaoxoa));
			}
			request.setAttribute("ds", dbbo.getduyetbai());
			RequestDispatcher rd = request.getRequestDispatcher("duyetbai.jsp");
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
