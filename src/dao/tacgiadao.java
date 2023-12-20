package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.tacgiabean;

public class tacgiadao {
	public ArrayList<tacgiabean> gettacgia() throws Exception {
		ArrayList<tacgiabean> ds = new ArrayList<tacgiabean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from tacgia";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long matacgia = rs.getLong("matacgia");
			String tentacgia = rs.getString("tentacgia");
			ds.add(new tacgiabean(matacgia, tentacgia));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int Them (String tentacgia) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "INSERT INTO tacgia (tentacgia) VALUES (?);";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, tentacgia);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int Capnhat (long matacgia, String tentacgia) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "update tacgia set tentacgia = ? where matacgia = ?;";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, tentacgia);
		cmd.setLong(2, matacgia);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int Xoa(long matacgia) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql="delete from tacgia where matacgia = ?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setLong(1, matacgia);
		int kq=cmd.executeUpdate();
		kn.cn.close();
		return kq;
	}
	public Boolean checkMatg(long mtg) throws Exception {
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "select * from tacgia where matacgia = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mtg);
		ResultSet rs = cmd.executeQuery();
		return rs.next();
	}
	public ArrayList<tacgiabean> Selecttg(long mtg) throws Exception{
		ArrayList<tacgiabean> ds = new ArrayList<tacgiabean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from tacgia where matacgia = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mtg);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long matacgia = rs.getLong("matacgia");
			String tentacgia = rs.getString("tentacgia");
			ds.add(new tacgiabean(matacgia, tentacgia));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int tongTacgia() throws Exception{
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		int soluong = 0;
		String sql = "select count(matacgia) as tong from tacgia";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			soluong = rs.getInt("tong");
		}
		rs.close();
		kn.cn.close();
		return soluong;
	}
	public long Getmatg(String tentg) throws Exception{
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		long matg = 0;
		String sql = "select matacgia from tacgia where tentacgia = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tentg);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			matg = rs.getInt("matacgia");
		}
		rs.close();
		kn.cn.close();
		return matg;
	}
}
