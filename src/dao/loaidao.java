package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception {
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from loaibao";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new loaibean(maloai, tenloai));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int Them (String maloai, String tenloai) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "INSERT INTO loaibao (maloai, tenloai)" + 
				"VALUES (?,?);";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int Capnhat (String maloai, String tenloai) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "update loaibao set tenloai = ? where maloai = ?;";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, tenloai);
		cmd.setString(2, maloai);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int Xoa(String maloai) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql="delete from loaibao where maloai = ?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		int kq=cmd.executeUpdate();
		kn.cn.close();
		return kq;
	}
	public Boolean checkMaloai(String maloai) throws Exception {
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "select * from loaibao where maloai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		ResultSet rs = cmd.executeQuery();
		return rs.next();
	}
	public ArrayList<loaibean> Select(String ml) throws Exception{
		ArrayList<loaibean> ds = new ArrayList<loaibean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from loaibao where maloai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, ml);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new loaibean(maloai, tenloai));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int tongLoai() throws Exception{
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		int soluong = 0;
		String sql = "select count(maloai) as tong from loaibao";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			soluong = rs.getInt("tong");
		}
		rs.close();
		kn.cn.close();
		return soluong;
	}
	public String gettenloai(String maloai) throws Exception{
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String tenloai = "";
		String sql = "select tenloai from loai where maloai=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			tenloai = rs.getString("tenloai");
		}
		rs.close();
		kn.cn.close();
		return tenloai;
	}
}
