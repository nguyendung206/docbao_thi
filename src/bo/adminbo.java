package bo;

import bean.adminbean;
import dao.admindao;

public class adminbo {
	admindao addao= new admindao();
	public adminbean ktdn (String tk, String mk) throws Exception{
		return addao.ktdn(tk, mk);
	}
	public int dangky (String taikhoan, String matkhau) throws Exception{
		return addao.dangky(taikhoan, matkhau);
	}
	public Boolean checkTaikhoan (String taikhoan) throws Exception{
		return addao.checkTaikhoan(taikhoan);
	}
}
