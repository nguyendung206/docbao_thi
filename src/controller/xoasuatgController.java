package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.tacgiabo;

/**
 * Servlet implementation class xoasuatgController
 */
@WebServlet("/xoasuatgController")
public class xoasuatgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoasuatgController() {
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
			tacgiabo tgbo = new tacgiabo();
			String mtgx = request.getParameter("mtg");
			String sl = request.getParameter("mtgsl");
			String mtg = request.getParameter("txtmtg");
			String ttg = request.getParameter("txtttg");
			String them = request.getParameter("them");
			String capnhat = request.getParameter("capnhat");
			if (sl != null) {
				request.setAttribute("mtgsl", tgbo.Selecttg(Long.parseLong(sl)));
			}
			if (them != null) {
				if (!tgbo.checkMatg(Long.parseLong(mtg))) {
					tgbo.Them(ttg);
				}
			} else if (capnhat != null) {
				tgbo.Capnhat(Long.parseLong(mtg), ttg);
			} else if(mtgx!=null) {
				tgbo.Xoa(Long.parseLong(mtgx));
			}
			RequestDispatcher rd = request.getRequestDispatcher("adminqlController?tg=1");
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
