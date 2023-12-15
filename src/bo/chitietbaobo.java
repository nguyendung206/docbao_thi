package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.chitietbaobean;
import dao.chitietbaodao;

public class chitietbaobo {
	chitietbaodao ctbdao = new chitietbaodao();
	public ArrayList<chitietbaobean> getctbao(long mb) throws Exception {
		return ctbdao.getctbao(mb);
	}
	public ArrayList<chitietbaobean> getallctbao() throws Exception {
		return ctbdao.getallctbao();
	}
	public ArrayList<chitietbaobean> getBaotheongay(Date ngay) throws Exception {
		return ctbdao.getBaotheongay(ngay);
	}
}
