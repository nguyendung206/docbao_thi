package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.adminbean;

public class admindao {
	public adminbean ktdn (String tk, String mk) throws Exception{
		KetNoi1 kn= new KetNoi1();
		kn.ketnoi();
		String sql= "select * from admin where taikhoanadmin = ? and matkhauadmin = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tk);
		cmd.setString(2, mk);
		ResultSet rs = cmd.executeQuery();
		adminbean nd = null;
		while(rs.next()) {
			long maadmin= rs.getLong("maadmin");
			String taikhoanadmin=rs.getString("taikhoanadmin");
			String matkhauadmin=rs.getString("matkhauadmin");
			nd= new adminbean(maadmin, taikhoanadmin, matkhauadmin);
		}
		rs.close();
		kn.cn.close();
		return nd;
	}
	public Boolean checkTaikhoan(String taikhoan) throws Exception {
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "SELECT * FROM admin where taikhoanadmin = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, taikhoan);
		ResultSet rs = cmd.executeQuery();
		return rs.next();
	}
	public int dangky (String taikhoan, String matkhau) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "INSERT INTO admin (taikhoanadmin, matkhauadmin)" + 
				"VALUES (?,?);";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, taikhoan);
		cmd.setString(2, matkhau);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
}
