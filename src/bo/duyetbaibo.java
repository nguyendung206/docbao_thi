package bo;

import java.util.ArrayList;

import bean.duyetbaibean;
import dao.duyetbaidao;

public class duyetbaibo {
	duyetbaidao dbdao = new duyetbaidao();
	public ArrayList<duyetbaibean> getduyetbai() throws Exception {
		return dbdao.getduyetbai();
	}
	public int Capnhat(long mabao) throws Exception{
		return dbdao.Capnhat(mabao);
	}
}
