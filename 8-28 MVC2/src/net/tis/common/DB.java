package net.tis.common;

import java.sql.*;

public class DB {
	public static Connection getConnection() {
		Connection CN =null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //����̺�ε�
		    String url="jdbc:oracle:thin:@127.0.0.1:1521:XE" ;
		    CN=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE","system","1234");
		    System.out.println("0730 ����Ŭ���Ἲ��success");

		}catch(Exception e){ System.out.println(e); }
		return CN;
	}
}
