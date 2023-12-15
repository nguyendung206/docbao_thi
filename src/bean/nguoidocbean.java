package bean;

public class nguoidocbean {
	private long manguoidoc;
	private String hoten;
	private String email;
	private String taikhoan;
	private String matkhau;
	public nguoidocbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public nguoidocbean(long manguoidoc, String hoten, String email, String taikhoan, String matkhau) {
		super();
		this.manguoidoc = manguoidoc;
		this.hoten = hoten;
		this.email = email;
		this.taikhoan = taikhoan;
		this.matkhau = matkhau;
	}
	public long getManguoidoc() {
		return manguoidoc;
	}
	public void setManguoidoc(long manguoidoc) {
		this.manguoidoc = manguoidoc;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTaikhoan() {
		return taikhoan;
	}
	public void setTaikhoan(String taikhoan) {
		this.taikhoan = taikhoan;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
}
