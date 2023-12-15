package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoi1 {
	public Connection cn;
	public void ketnoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:sqlserver://LAPTOP-NL7BAQ6R\\SQLEXPRESS:1433;databaseName=QLDocBao;user=sa;password=1234";
		cn = DriverManager.getConnection(url);
		System.out.println("Da ket noi");
	}
}