package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.baobean;

public class baodao {
	public ArrayList<baobean> getbao() throws Exception {
		ArrayList<baobean> ds = new ArrayList<baobean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from bao";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mabao = rs.getLong("mabao");
			String tieude = rs.getString("tieude");
			String noidung = rs.getString("noidung");
			String mota = rs.getString("mota");
			String anhbia = rs.getString("anhbia");
			long matacgia = rs.getLong("matacgia");
			Date ngayxuatban = rs.getDate("ngayxuatban");
			String maloai = rs.getString("maloai");
			ds.add(new baobean(mabao, tieude, noidung, mota, anhbia, matacgia, maloai, ngayxuatban));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int Them (String tieude, String noidung, String mota, String anhbia, long matacgia, Date ngayxuatban, String maloai) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "INSERT INTO bao (tieude, noidung, mota, anhbia, matacgia, ngayxuatban, maloai)" + 
				"VALUES (?,?,?,?,?,?,?);";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, tieude);
		cmd.setString(2, noidung);
		cmd.setString(3, mota);
		cmd.setString(4, anhbia);
		cmd.setLong(5, matacgia);
		Date n = new Date();
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd");
		String ngay = dd.format(n);
		Date Ngayxuatban=dd.parse(ngay);
		cmd.setDate(6, new java.sql.Date(Ngayxuatban.getTime()));
		cmd.setString(7, maloai);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int Capnhat (long mabao, String tieude, String noidung, String mota, String anhbia, long matacgia, Date ngayxuatban, String maloai) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "update bao set tieude = ?, noidung = ?, mota = ?, anhbia = ?, matacgia = ?, ngayxuatban = ?, maloai = ?\r\n"
				+ "where mabao = ?";
		PreparedStatement cmd =kn.cn.prepareStatement(sql);
		cmd.setString(1, tieude);
		cmd.setString(2, noidung);
		cmd.setString(3, mota);
		cmd.setString(4, anhbia);
		cmd.setLong(5, matacgia);
		Date n = new Date();
		SimpleDateFormat dd= new SimpleDateFormat("yyyy-MM-dd");
		String ngay = dd.format(n);
		Date Ngayxuatban=dd.parse(ngay);
		cmd.setDate(6, new java.sql.Date(Ngayxuatban.getTime()));
		cmd.setString(7, maloai);
		cmd.setLong(8, mabao);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int Xoa(long mabao) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql="delete from bao where mabao = ?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setLong(1, mabao);
		int kq=cmd.executeUpdate();
		kn.cn.close();
		return kq;
	}
	public Boolean checkMabao(long mabao) throws Exception {
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql= "select * from bao where mabao = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mabao);
		ResultSet rs = cmd.executeQuery();
		return rs.next();
	}
	public ArrayList<baobean> Select(long mb) throws Exception {
		ArrayList<baobean> ds = new ArrayList<baobean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from bao where mabao = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, mb);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mabao = rs.getLong("mabao");
			String tieude = rs.getString("tieude");
			String noidung = rs.getString("noidung");
			String mota = rs.getString("mota");
			String anhbia = rs.getString("anhbia");
			long matacgia = rs.getLong("matacgia");
			Date ngayxuatban = rs.getDate("ngayxuatban");
			String maloai = rs.getString("maloai");
			ds.add(new baobean(mabao, tieude, noidung, mota, anhbia, matacgia, maloai, ngayxuatban));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int tongBao() throws Exception{
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		int soluong = 0;
		String sql = "select count(mabao) as tong from bao";
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
