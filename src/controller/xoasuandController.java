package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.nguoidocbo;

/**
 * Servlet implementation class xoasuandController
 */
@WebServlet("/xoasuandController")
public class xoasuandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoasuandController() {
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
			nguoidocbo ndbo = new nguoidocbo();
			String mndx = request.getParameter("mndx");
			String sl = request.getParameter("mndsl");
			String mnd = request.getParameter("txtmnd");
			String ht = request.getParameter("txtht");
			String email = request.getParameter("txtemail");
			String tk = request.getParameter("txttk");
			String mk = request.getParameter("txtmk");
			String them = request.getParameter("them");
			String capnhat = request.getParameter("capnhat");
			if (sl != null) {
				request.setAttribute("mndsl", ndbo.Select(Long.parseLong(sl)));
			}
			if (them != null) {
				ndbo.Them(ht,email,tk,mk);
			} else if (capnhat != null) {
				ndbo.Capnhat(Long.parseLong(mnd), ht,email,tk,mk);
			} else if(mndx!=null) {
				ndbo.Xoa(Long.parseLong(mndx));
			}
			RequestDispatcher rd = request.getRequestDispatcher("adminqlController?nd=1");
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
