package bo;

import java.util.ArrayList;

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
	public ArrayList<nguoidocbean> getnguoidoc() throws Exception {
		return nddao.getnguoidoc();
	}
	public int Them (String hoten,String email, String taikhoan, String matkhau) throws Exception{
		return nddao.Them(hoten, email, taikhoan, matkhau);
	}
	public int Capnhat (long manguoidoc, String hoten,String email, String taikhoan, String matkhau) throws Exception{
		return nddao.Capnhat(manguoidoc, hoten, email, taikhoan, matkhau);
	}
	public int Xoa(long manguoidoc) throws Exception{
		return nddao.Xoa(manguoidoc);
	}
	public Boolean checkMand(long manguoidoc) throws Exception {
		return nddao.checkMand(manguoidoc);
	}
	public ArrayList<nguoidocbean> Select(long mnd) throws Exception{
		return nddao.Select(mnd);
	}
}
