package dao;

import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.chitietbaobean;

public class chitietbaodao {
	public ArrayList<chitietbaobean> getctbao(long mb) throws Exception {
		ArrayList<chitietbaobean> ds = new ArrayList<chitietbaobean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from Vhtbao where mabao = ?";
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
			String tentacgia = rs.getString("tentacgia");
			Date ngayxuatban = rs.getDate("ngayxuatban");
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new chitietbaobean(mabao, tieude, noidung, mota, anhbia, ngayxuatban, matacgia, tentacgia, maloai, tenloai));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public ArrayList<chitietbaobean> getallctbao() throws Exception {
		ArrayList<chitietbaobean> ds = new ArrayList<chitietbaobean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from Vhtbao";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mabao = rs.getLong("mabao");
			String tieude = rs.getString("tieude");
			String noidung = rs.getString("noidung");
			String mota = rs.getString("mota");
			String anhbia = rs.getString("anhbia");
			long matacgia = rs.getLong("matacgia");
			String tentacgia = rs.getString("tentacgia");
			Date ngayxuatban = rs.getDate("ngayxuatban");
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new chitietbaobean(mabao, tieude, noidung, mota, anhbia, ngayxuatban, matacgia, tentacgia, maloai, tenloai));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public ArrayList<chitietbaobean> getBaotheongay(Date ngay) throws Exception {
		ArrayList<chitietbaobean> ds = new ArrayList<chitietbaobean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from Vhtbao where ngayxuatban = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setDate(1, new java.sql.Date(ngay.getTime()));
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			long mabao = rs.getLong("mabao");
			String tieude = rs.getString("tieude");
			String noidung = rs.getString("noidung");
			String mota = rs.getString("mota");
			String anhbia = rs.getString("anhbia");
			long matacgia = rs.getLong("matacgia");
			String tentacgia = rs.getString("tentacgia");
			Date ngayxuatban = rs.getDate("ngayxuatban");
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new chitietbaobean(mabao, tieude, noidung, mota, anhbia, ngayxuatban, matacgia, tentacgia, maloai, tenloai));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
