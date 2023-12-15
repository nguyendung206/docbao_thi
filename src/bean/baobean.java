package bean;

import java.util.Date;

public class baobean {
	private long mabao;
	private String tieude;
	private String noidung;
	private String mota;
	private String anhbia;
	private long matacgia;
	private String maloai;
	private Date ngayxuatbang;
	public baobean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public baobean(long mabao, String tieude, String noidung, String mota, String anhbia, long matacgia, String maloai,
			Date ngayxuatbang) {
		super();
		this.mabao = mabao;
		this.tieude = tieude;
		this.noidung = noidung;
		this.mota = mota;
		this.anhbia = anhbia;
		this.matacgia = matacgia;
		this.maloai = maloai;
		this.ngayxuatbang = ngayxuatbang;
	}
	public long getMabao() {
		return mabao;
	}
	public void setMabao(long mabao) {
		this.mabao = mabao;
	}
	public String getTieude() {
		return tieude;
	}
	public void setTieude(String tieude) {
		this.tieude = tieude;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public String getAnhbia() {
		return anhbia;
	}
	public void setAnhbia(String anhbia) {
		this.anhbia = anhbia;
	}
	public long getMatacgia() {
		return matacgia;
	}
	public void setMatacgia(long matacgia) {
		this.matacgia = matacgia;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public Date getNgayxuatbang() {
		return ngayxuatbang;
	}
	public void setNgayxuatbang(Date ngayxuatbang) {
		this.ngayxuatbang = ngayxuatbang;
	}

	
}
