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
import bean.nguoidocbean;
import bo.adminbo;
import bo.nguoidocbo;
import nl.captcha.Captcha;



/**
 * Servlet implementation class dangnhapController
 */
@WebServlet("/dangnhapController")
public class dangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
             HttpSession session = request.getSession();
             Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
             String captchaAnswer = request.getParameter("answer");
		     String tk = request.getParameter("txtun");
		     String mk = request.getParameter("txtpass");
		     if (tk != null && mk != null ) {
		         nguoidocbo ndbo = new nguoidocbo();
		         adminbo adbo = new adminbo();
		         nguoidocbean nd = ndbo.ktdn(tk, mk);
		         adminbean ad = adbo.ktdn(tk, mk);
		         if (ad != null && captcha.isCorrect(captchaAnswer)) {
		             session.setAttribute("dn", ad);
		             session.removeAttribute("tbdn");
		             session.removeAttribute("tbdk");
		             response.sendRedirect("adminController");
		             return;	
		         } else if (nd != null && captcha.isCorrect(captchaAnswer)) {
		             session.setAttribute("dn", nd);
		             session.removeAttribute("tbdn");
		             session.removeAttribute("tbdk");
		             response.sendRedirect("trangchuController");
		             return;	
		         } else {
		        	 String tb = "tb";
		        	 session.setAttribute("tbdn", tb);
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
