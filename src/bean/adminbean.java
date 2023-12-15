package bean;

public class adminbean {
	private long maadmin;
	private String taikhoanadmin;
	private String matkhauadmin;
	public adminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public adminbean(long maadmin, String taikhoanadmin, String matkhauadmin) {
		super();
		this.maadmin = maadmin;
		this.taikhoanadmin = taikhoanadmin;
		this.matkhauadmin = matkhauadmin;
	}
	public long getMaadmin() {
		return maadmin;
	}
	public void setMaadmin(long maadmin) {
		this.maadmin = maadmin;
	}
	public String getTaikhoanadmin() {
		return taikhoanadmin;
	}
	public void setTaikhoanadmin(String taikhoanadmin) {
		this.taikhoanadmin = taikhoanadmin;
	}
	public String getMatkhauadmin() {
		return matkhauadmin;
	}
	public void setMatkhauadmin(String matkhauadmin) {
		this.matkhauadmin = matkhauadmin;
	}
	
}
