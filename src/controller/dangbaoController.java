package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.nguoidocbean;
import bo.baobo;
import bo.tacgiabo;

/**
 * Servlet implementation class dangbaoController
 */
@WebServlet("/dangbaoController")
public class dangbaoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangbaoController() {
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
            HttpSession session = request.getSession();
			baobo bbo = new baobo();
			tacgiabo tgbo = new tacgiabo();
			nguoidocbean  nd= (nguoidocbean)session.getAttribute("dn");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
			String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "image_bao";
			response.getWriter().println(dirUrl1);
			List<FileItem> fileItems = upload.parseRequest(request);
			String tieude = "";
            Date ngay = new Date();
            String maloai = "";
            long matg = tgbo.Getmatg(nd.getHoten());
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
                        case "txttieude":
                            tieude = fieldValue;
                            break;
                        case "txtml":
                            maloai = fieldValue;
                            break;
                        case "txtmota":
                            mota = fieldValue;
                            break;
                        case "txtnd":
                            noidung = fieldValue;
                            break;
                        case "them":
                        	bbo.Dangbao(tieude, noidung, mota, anhbia, matg, ngay, maloai);
                        	response.sendRedirect("htDangbaoController");
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
