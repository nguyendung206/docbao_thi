package bo;

import java.util.ArrayList;

import bean.tacgiabean;
import dao.tacgiadao;

public class tacgiabo {
	tacgiadao tgdao= new tacgiadao();
	public ArrayList<tacgiabean> gettacgia() throws Exception {
		return tgdao.gettacgia();
	}
	public int Them (String tentacgia) throws Exception{
		return tgdao.Them(tentacgia);
	}
	public int Capnhat (long matacgia, String tentacgia) throws Exception{
		return tgdao.Capnhat(matacgia, tentacgia);
	}
	public int Xoa(long matacgia) throws Exception{
		return tgdao.Xoa(matacgia);
	}
	public Boolean checkMatg(long mtg) throws Exception {
		return tgdao.checkMatg(mtg);
	}
	public ArrayList<tacgiabean> Selecttg(long mtg) throws Exception{
		return tgdao.Selecttg(mtg);
	}
	public int tongTacgia() throws Exception{
		return tgdao.tongTacgia();
	}
	public long Getmatg (String tentg) throws Exception{
		return tgdao.Getmatg(tentg);
	}
}
