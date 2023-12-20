package bo;

import java.util.ArrayList;

import bean.loaibean;
import dao.loaidao;

public class loaibo {
	loaidao ldao= new loaidao();
	public ArrayList<loaibean> getloai() throws Exception {
		return ldao.getloai();
	}
	public int Them (String maloai, String tenloai) throws Exception{
		return ldao.Them(maloai, tenloai);
	}
	public int Capnhat (String maloai, String tenloai) throws Exception{
		return ldao.Capnhat(maloai, tenloai);
	}
	public int Xoa(String maloai) throws Exception{
		return ldao.Xoa(maloai);
	}
	public Boolean checkMaloai (String maloai) throws Exception{
		return ldao.checkMaloai(maloai);
	}
	public ArrayList<loaibean> Select(String ml) throws Exception{
		return ldao.Select(ml);
	}
	public int tongLoai() throws Exception{
		return ldao.tongLoai();
	}
	public String gettenloai(String maloai) throws Exception{
		return ldao.gettenloai(maloai);
	}
}
