package bo;

import bean.nguoidocbean;
import dao.nguoidocdao;

public class nguoidocbo {
	nguoidocdao nddao= new nguoidocdao();
	public nguoidocbean ktdn (String tk, String mk) throws Exception{
		return nddao.ktdn(tk, mk);
	}
	public int dangky (String hoten, String email, String taikhoan, String matkhau) throws Exception{
		return nddao.dangky(hoten, email, taikhoan, matkhau);
	}
	public Boolean checkTaikhoan (String taikhoan) throws Exception{
		return nddao.checkTaikhoan(taikhoan);
	}
	public int tongNguoidoc() throws Exception{
		return nddao.tongNguoidoc();
	}
}
