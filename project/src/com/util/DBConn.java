package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {

	private static Connection conn = null;
	
	public static Connection getConnenction() {
		String url ="jdbc:oracle:thin:@192.168.16.22:1521:TestDB";
		String user="suzi";
		String pwd="a123";
		
		if(conn==null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn =DriverManager.getConnection(url,user,pwd);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.toString());
			}
		}
		return conn;
	}
	
	public static void close() {
		if(conn==null) {
			return;
		}
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		conn=null;
	}
	
	
}
