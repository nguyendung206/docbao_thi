package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.baobean;
import dao.baodao;

public class baobo {
	baodao bdao = new baodao();
	ArrayList<baobean> ds;
	public ArrayList<baobean> getbao() throws Exception {
		ds=bdao.getbao();
		return ds;
	}
	public ArrayList<baobean> TimMa(String maloai) throws Exception {
		ArrayList<baobean> tam = new ArrayList<baobean>();
		for (baobean s: ds) {
			if (s.getMaloai().trim().contains(maloai.trim()))
					tam.add(s);
		}
		return tam;
	}
	public ArrayList<baobean> Tim(String key) throws Exception {
		ArrayList<baobean> tam = new ArrayList<baobean>();
		for (baobean s: ds) {
			if (s.getTieude().trim().toLowerCase().contains(key.trim().toLowerCase()))
				tam.add(s);
		}
		return tam;
	}
	public ArrayList<baobean> TimTacgia(long matacgia) throws Exception {
	    ArrayList<baobean> tam = new ArrayList<baobean>();
	    for (baobean s : ds) {
	        if(s.getMatacgia() == matacgia) {
	        	tam.add(s);
	        }
	    }
	    return tam;
	}
	public int Them (String tieude, String noidung, String mota, String anhbia, long matacgia, Date ngayxuatban, String maloai) throws Exception{
		return bdao.Them(tieude, noidung, mota, anhbia, matacgia, ngayxuatban, maloai);
	}
	public int Capnhat (long mabao, String tieude, String noidung, String mota, String anhbia, long matacgia, Date ngayxuatban, String maloai) throws Exception{
		return bdao.Capnhat(mabao, tieude, noidung, mota, anhbia, matacgia, ngayxuatban, maloai);
	}
	public int Xoa(long mabao) throws Exception{
		return bdao.Xoa(mabao);
	}
	public Boolean checkMabao(long mabao) throws Exception {
		return bdao.checkMabao(mabao);
	}
	public ArrayList<baobean> Select(long mb) throws Exception {
		return bdao.Select(mb);
	}
	public int tongBao() throws Exception{
		return bdao.tongBao();
	}
}
