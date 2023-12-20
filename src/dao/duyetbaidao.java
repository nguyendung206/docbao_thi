package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.duyetbaibean;

public class duyetbaidao {
	public ArrayList<duyetbaibean> getduyetbai() throws Exception {
		ArrayList<duyetbaibean> ds = new ArrayList<duyetbaibean>();
		KetNoi1 kn = new KetNoi1();
		kn.ketnoi();
		String sql= "select * from Vduyetbai";
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
			Boolean trangthai =rs.getBoolean("trangthai");
			ds.add(new duyetbaibean(mabao, tieude, noidung, mota, anhbia, ngayxuatban, matacgia, tentacgia, maloai, tenloai, trangthai));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int Capnhat(long mabao) throws Exception{
		KetNoi1 kn =new KetNoi1();
		kn.ketnoi();
		String sql="update bao set trangthai = 1 where mabao= ?";
		PreparedStatement cmd= kn.cn.prepareStatement(sql);
		cmd.setLong(1, mabao);
		int kq=cmd.executeUpdate();
		kn.cn.close();
		return kq;
	}
}
