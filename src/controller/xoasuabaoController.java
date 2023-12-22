package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bo.baobo;
import bo.chitietbaobo;


/**
 * Servlet implementation class xoasuabaoController
 */
@WebServlet("/xoasuabaoController")
public class xoasuabaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoasuabaoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8"); 
			baobo bbo = new baobo();
			chitietbaobo ctbbo = new chitietbaobo();
			String mbx = request.getParameter("mb");
			String mbsl = request.getParameter("mbsl");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
			String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "image_bao";
			response.getWriter().println(dirUrl1);
			if (mbsl != null) {
				request.setAttribute("mbsl", ctbbo.getctbao(Long.parseLong(mbsl)));
				RequestDispatcher rd = request.getRequestDispatcher("adminqlController?bao=1");
                rd.forward(request, response);
			}
			if(mbx != null) {
				bbo.Xoa(Long.parseLong(mbx));
				RequestDispatcher rd = request.getRequestDispatcher("adminqlController?bao=1");
                rd.forward(request, response);
			}
			List<FileItem> fileItems = upload.parseRequest(request);
			String mabao = "";
			String tieude = "";
            Date ngay = new Date();
            String maloai = "";
            long matg = 0;
            String mota = "";  
            String noidung = "";
            String anhbia = "";
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {
					String nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "image_bao";
						File dir = new File(dirUrl);
						if (!dir.exists()) {
							dir.mkdir();
						}
			            String fileImg = dirUrl + File.separator + nameimg;
			            File file = new File(fileImg);
			            try {
			               fileItem.write(file);
			               anhbia = "image_bao" + "/" + nameimg;
					    } catch (Exception e) {
					    	e.printStackTrace();
					    }
					}
				} else {
					String fieldName = fileItem.getFieldName();
                    String fieldValue = fileItem.getString("utf-8");
                    switch (fieldName) {
	                    case "txtmb":
	                        mabao = fieldValue;
	                        break;
                        case "txttieude":
                            tieude = fieldValue;
                            break;
                        case "txtml":
                            maloai = fieldValue;
                            break;
                        case "txtmtg":
                            matg = Long.parseLong(fieldValue);
                            break;
                        case "txtmota":
                            mota = fieldValue;
                            break;
                        case "txtnd":
                            noidung = fieldValue;
                            break;
                        case "them":
                        	bbo.Them(tieude, noidung, mota, anhbia, matg, ngay, maloai);
                        	response.sendRedirect("adminqlController?bao=1");
                        	break;
                        case "capnhat":
                        	bbo.Capnhat(Long.parseLong(mabao), tieude, noidung, mota, anhbia, matg, ngay, maloai);
                        	response.sendRedirect("adminqlController?bao=1");
                        	break;
                    }
				}
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
