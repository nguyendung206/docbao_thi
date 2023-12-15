package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.loaibo;

/**
 * Servlet implementation class xoasualoaiController
 */
@WebServlet("/xoasualoaiController")
public class xoasualoaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoasualoaiController() {
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
			String mlx = request.getParameter("ml");
			String mlsl = request.getParameter("mlsl");
			String ml = request.getParameter("txtml");
			String tl = request.getParameter("txttl");
			String them = request.getParameter("them");
			String capnhat = request.getParameter("capnhat");
			if (mlsl != null) {
				request.setAttribute("mlsl", lbo.Select(mlsl));
			}
			if (them != null) {
				if (!lbo.checkMaloai(ml)) {
					lbo.Them(ml, tl);
				}
			} else if (capnhat != null) {
				lbo.Capnhat(ml, tl);
			} else {
				lbo.Xoa(mlx);
			}
			RequestDispatcher rd = request.getRequestDispatcher("adminqlController?loai=1");
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
