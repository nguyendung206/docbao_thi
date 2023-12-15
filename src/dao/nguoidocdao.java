package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.nguoidocbean;

public class nguoidocdao {
	public nguoidocbean ktdn (String tk, String mk) throws Exception{
		KetNoi1 kn= new KetNoi1();
		kn.ketnoi();
		String sql= "select * from nguoidoc where taikhoan = ? and matkhau = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tk);
		cmd.setString(2, mk);
		ResultSet rs = cmd.executeQuery();
		nguoidocbean nd = null;
		while(rs.next()) {
			long manguoidoc= rs.getLong("manguoidoc");
			String hoten=rs.getString("hoten");
			String email=rs.getString("email");
			String taikhoan=rs.getString("taikhoan");
			String matkhau=rs.getString("matkhau");
			nd= new nguoidocbean(manguoidoc, hoten, email, taikhoan, matkhau);
		}
		rs.close();
		kn.cn.close();
		return nd;
	}
	public Boolean checkTaikhoan(String taikhoan) throws Exception {
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "SELECT * FROM nguoidoc where taikhoan = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, taikhoan);
		ResultSet rs = cmd.executeQuery();
		return rs.next();
	}
	public int dangky ( String hoten, String email, String taikhoan, String matkhau) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "INSERT INTO nguoidoc (hoten, email, taikhoan, matkhau)" + 
				"VALUES (?,?,?,?);";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, email);
		cmd.setString(3, taikhoan);
		cmd.setString(4, matkhau);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int tongNguoidoc() throws Exception{
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		int soluong = 0;
		String sql = "select count(manguoidoc) as tong from nguoidoc";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			soluong = rs.getInt("tong");
		}
		rs.close();
		kn.cn.close();
		return soluong;
	}
}
