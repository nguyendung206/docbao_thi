package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.nguoidocbean;
import bean.tacgiabean;

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
	public ArrayList<nguoidocbean> getnguoidoc() throws Exception {
		ArrayList<nguoidocbean> ds = new ArrayList<nguoidocbean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from nguoidoc";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long manguoidoc = rs.getLong("manguoidoc");
			String hoten = rs.getString("hoten");
			String email = rs.getString("email");
			String taikhoan = rs.getString("taikhoan");
			String matkhau = rs.getString("matkhau");
			ds.add(new nguoidocbean(manguoidoc, hoten, email, taikhoan, matkhau));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int Them (String hoten,String email, String taikhoan, String matkhau) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "INSERT INTO nguoidoc (hoten,email,taikhoan,matkhau) VALUES (?,?,?,?);";
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
	public int Capnhat (long manguoidoc, String hoten,String email, String taikhoan, String matkhau) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "update nguoidoc set hoten = ?,email = ?, taikhoan = ?, matkhau = ? where manguoidoc = ?;";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, email);
		cmd.setString(3, taikhoan);
		cmd.setString(4, matkhau);
		cmd.setLong(5, manguoidoc);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int Xoa(long manguoidoc) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql="delete from nguoidoc where manguoidoc = ?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setLong(1, manguoidoc);
		int kq=cmd.executeUpdate();
		kn.cn.close();
		return kq;
	}
	public Boolean checkMand(long manguoidoc) throws Exception {
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "select * from nguoidoc where manguoidoc = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, manguoidoc);
		ResultSet rs = cmd.executeQuery();
		return rs.next();
	}
	public ArrayList<nguoidocbean> Select(long mnd) throws Exception{
		ArrayList<nguoidocbean> ds = new ArrayList<nguoidocbean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from nguoidoc where manguoidoc = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mnd);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long manguoidoc = rs.getLong("manguoidoc");
			String hoten = rs.getString("hoten");
			String email = rs.getString("email");
			String taikhoan = rs.getString("taikhoan");
			String matkhau = rs.getString("matkhau");
			ds.add(new nguoidocbean(manguoidoc, hoten, email, taikhoan, matkhau));
		}
		rs.close();
		kn.cn.close();
		return ds;
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
