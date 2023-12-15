package bean;

import java.util.Date;

public class chitietbaobean {
	private long mabao;
	private String tieude;
	private String noidung;
	private String mota;
	private String anhbia;
	private Date ngayxuatban;
	private long matacgia;
	private String tentacgia;
	private String maloai;
	private String tenloai;
	public chitietbaobean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chitietbaobean(long mabao, String tieude, String noidung, String mota, String anhbia, Date ngayxuatban,
			long matacgia, String tentacgia, String maloai, String tenloai) {
		super();
		this.mabao = mabao;
		this.tieude = tieude;
		this.noidung = noidung;
		this.mota = mota;
		this.anhbia = anhbia;
		this.ngayxuatban = ngayxuatban;
		this.matacgia = matacgia;
		this.tentacgia = tentacgia;
		this.maloai = maloai;
		this.tenloai = tenloai;
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
	public Date getNgayxuatban() {
		return ngayxuatban;
	}
	public void setNgayxuatban(Date ngayxuatban) {
		this.ngayxuatban = ngayxuatban;
	}
	public long getMatacgia() {
		return matacgia;
	}
	public void setMatacgia(long matacgia) {
		this.matacgia = matacgia;
	}
	public String getTentacgia() {
		return tentacgia;
	}
	public void setTentacgia(String tentacgia) {
		this.tentacgia = tentacgia;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	
}
