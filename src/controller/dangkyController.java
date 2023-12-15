package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.nguoidocbo;


/**
 * Servlet implementation class dangkyController
 */
@WebServlet("/dangkyController")
public class dangkyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkyController() {
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
				String hoten = request.getParameter("txtht");
			    String email = request.getParameter("txtemail");
				String un = request.getParameter("txtun");
			    String pass = request.getParameter("txtpass");
	            session.removeAttribute("tbdk");
			    if (hoten != null && un != null && pass != null) {
			    	nguoidocbo ndbo = new nguoidocbo();
			        if (!ndbo.checkTaikhoan(un)) {
			        	ndbo.dangky(hoten, email, un, pass);
			            session.removeAttribute("tbdn");
			            RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
			            rd.forward(request, response);
			            return;
			        } else {
			        	String tb = "tb";
			        	session.setAttribute("tbdk", tb);
			            response.sendRedirect("dangnhapController");
			        }
			    } else {
			    	RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
			        rd.forward(request, response);
			    }
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
